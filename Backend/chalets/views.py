from .serializers import (
    ChaletSerializer, 
    ChaletCreateUpdateSerializer, 
    ChaletImageSerializer, 
    ChaletImageUploadSerializer
)
from .models import Chalet, ChaletImage
from rest_framework.generics import CreateAPIView, ListAPIView, UpdateAPIView, DestroyAPIView
from rest_framework.permissions import IsAuthenticated, BasePermission
from rest_framework.exceptions import NotFound
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status


class IsOwnerUser(BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and getattr(request.user, 'user_type', None) == 'owner'


class ChaletCreateView(CreateAPIView):
    serializer_class = ChaletCreateUpdateSerializer
    permission_classes = [IsAuthenticated, IsOwnerUser]

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)


class ChaletListView(ListAPIView):
    serializer_class = ChaletSerializer
    permission_classes = [IsAuthenticated, IsOwnerUser]

    def get_queryset(self):
        return Chalet.objects.filter(owner=self.request.user)


class ChaletUpdateView(UpdateAPIView):
    serializer_class = ChaletCreateUpdateSerializer
    permission_classes = [IsAuthenticated, IsOwnerUser]

    def get_queryset(self):
        return Chalet.objects.filter(owner=self.request.user)

    def get_object(self):
        try:
            return self.get_queryset().get(id=self.kwargs['pk'])
        except Chalet.DoesNotExist:
            raise NotFound("Chalet not found or you don't have permission to access it.")


class ChaletDeleteView(DestroyAPIView):
    serializer_class = ChaletSerializer
    permission_classes = [IsAuthenticated, IsOwnerUser]

    def get_queryset(self):
        return Chalet.objects.filter(owner=self.request.user)

    def get_object(self):
        try:
            return self.get_queryset().get(id=self.kwargs['pk'])
        except Chalet.DoesNotExist:
            raise NotFound("Chalet not found or you don't have permission to access it.")


@api_view(['POST'])
@permission_classes([IsAuthenticated, IsOwnerUser])
def upload_chalet_images(request, chalet_id):
    """Upload multiple images for a chalet"""
    try:
        chalet = Chalet.objects.get(id=chalet_id, owner=request.user)
    except Chalet.DoesNotExist:
        return Response({'error': 'Chalet not found or you don\'t have permission to access it.'}, 
                       status=status.HTTP_404_NOT_FOUND)
    
    images = request.FILES.getlist('images')
    if not images:
        return Response({'error': 'No images provided'}, 
                       status=status.HTTP_400_BAD_REQUEST)
    
    created_images = []
    existing_count = chalet.images.count()
    
    for idx, image in enumerate(images):
        # Create image instance
        image_data = {
            'image': image,
            'order': existing_count + idx,
            'is_main': existing_count == 0 and idx == 0,  # First image of empty chalet becomes main
            'caption': request.data.get(f'caption_{idx}', '')
        }
        
        serializer = ChaletImageUploadSerializer(
            data=image_data, 
            context={'chalet': chalet, 'request': request}
        )
        
        if serializer.is_valid():
            chalet_image = serializer.save()
            created_images.append(ChaletImageSerializer(chalet_image, context={'request': request}).data)
        else:
            return Response({'error': f'Invalid image data: {serializer.errors}'}, 
                           status=status.HTTP_400_BAD_REQUEST)
    
    return Response({
        'message': f'{len(created_images)} images uploaded successfully',
        'images': created_images
    }, status=status.HTTP_201_CREATED)


@api_view(['DELETE'])
@permission_classes([IsAuthenticated, IsOwnerUser])
def delete_chalet_image(request, chalet_id, image_id):
    """Delete a specific chalet image"""
    try:
        chalet = Chalet.objects.get(id=chalet_id, owner=request.user)
        image = ChaletImage.objects.get(id=image_id, chalet=chalet)
    except Chalet.DoesNotExist:
        return Response({'error': 'Chalet not found or you don\'t have permission to access it.'}, 
                       status=status.HTTP_404_NOT_FOUND)
    except ChaletImage.DoesNotExist:
        return Response({'error': 'Image not found'}, 
                       status=status.HTTP_404_NOT_FOUND)
    
    image.delete()
    return Response({'message': 'Image deleted successfully'}, 
                   status=status.HTTP_200_OK)


@api_view(['PATCH'])
@permission_classes([IsAuthenticated, IsOwnerUser])
def update_chalet_image(request, chalet_id, image_id):
    """Update chalet image properties (main status, caption, order)"""
    try:
        chalet = Chalet.objects.get(id=chalet_id, owner=request.user)
        image = ChaletImage.objects.get(id=image_id, chalet=chalet)
    except Chalet.DoesNotExist:
        return Response({'error': 'Chalet not found or you don\'t have permission to access it.'}, 
                       status=status.HTTP_404_NOT_FOUND)
    except ChaletImage.DoesNotExist:
        return Response({'error': 'Image not found'}, 
                       status=status.HTTP_404_NOT_FOUND)
    
    serializer = ChaletImageSerializer(image, data=request.data, partial=True, context={'request': request})
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_200_OK)
    
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)