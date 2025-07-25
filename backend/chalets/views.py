from .serializers import ChaletSerializer
from .models import Chalet
from rest_framework.generics import CreateAPIView, ListAPIView, UpdateAPIView, DestroyAPIView
from rest_framework.permissions import IsAuthenticated, BasePermission
from rest_framework.exceptions import NotFound

class IsOwnerUser(BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and getattr(request.user, 'user_type', None) == 'owner'

class ChaletCreateView(CreateAPIView):
    serializer_class = ChaletSerializer
    permission_classes = [IsAuthenticated, IsOwnerUser]

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)

class ChaletListView(ListAPIView):
    serializer_class = ChaletSerializer
    permission_classes = [IsAuthenticated, IsOwnerUser]

    def get_queryset(self):
        return Chalet.objects.filter(owner=self.request.user)

class ChaletUpdateView(UpdateAPIView):
    serializer_class = ChaletSerializer
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