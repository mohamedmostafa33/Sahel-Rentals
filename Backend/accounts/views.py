from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.exceptions import TokenError
from rest_framework.parsers import MultiPartParser, FormParser
from .serializers import (
    UserRegistrationSerializer, 
    UserLoginSerializer, 
    ResetPasswordRequestSerializer, 
    ResetPasswordConfirmSerializer,
    UserProfileSerializer,
    ProfileImageSerializer
)
from rest_framework.views import APIView
from django.core.mail import send_mail
from django.conf import settings
from .models import OTP
import random

class UserRegistrationView(generics.CreateAPIView):
    serializer_class = UserRegistrationSerializer
    permission_classes = [AllowAny]

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            refresh_token = RefreshToken.for_user(user)
            access_token = refresh_token.access_token

            return Response({
                'message': 'User registered successfully',
                'user': {
                    'id': user.id,
                    'account_type': user.user_type,
                    'email': user.email,
                    'full_name': user.full_name,
                    'phone': user.phone
                },
                'refresh': str(refresh_token),
                'access': str(access_token)
            }, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
class UserLoginView(generics.GenericAPIView):
    serializer_class = UserLoginSerializer
    permission_classes = [AllowAny]

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            user = serializer.context['user']
            refresh_token = RefreshToken.for_user(user)
            access_token = refresh_token.access_token

            return Response({
                'message': 'Login successful',
                'user': {
                    'id': user.id,
                    'account_type': user.user_type,
                    'email': user.email,
                    'full_name': user.full_name,
                    'phone': user.phone
                },
                'refresh': str(refresh_token),
                'access': str(access_token)
            }, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
class UserLogoutView(generics.GenericAPIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        try:
            refresh_token = request.data.get('refresh')
            if not refresh_token:
                return Response({"error": "Refresh token is required"}, status=status.HTTP_400_BAD_REQUEST)
            
            token = RefreshToken(refresh_token)
            token.blacklist()

            return Response({"message": "Logout successful"}, status=status.HTTP_200_OK)
        except TokenError:
            return Response({"error": "Invalid token"}, status=status.HTTP_400_BAD_REQUEST)
          
class ResetPasswordRequestView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = ResetPasswordRequestSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        email = serializer.validated_data['email']
        
        OTP.objects.filter(email=email).delete()
        
        otp = str(random.randint(100000, 999999))
        otp_obj = OTP(email=email, otp=otp)
        otp_obj.save()
        
        send_mail(
            'Password Reset OTP',
            f'Your OTP for password reset is: {otp} (Valid for 10 minutes)',
            settings.DEFAULT_FROM_EMAIL,
            [email],
            fail_silently=False,
        )
        
        return Response({"message": "OTP sent to your email"}, status=status.HTTP_200_OK)
    
class ResetPasswordConfirmView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = ResetPasswordConfirmSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        new_password = serializer.validated_data['new_password']

        user.set_password(new_password)
        user.save()

        OTP.objects.filter(email=user.email).delete()

        return Response({"message": "Password reset successfully"}, status=status.HTTP_200_OK)

class UserProfileView(generics.RetrieveUpdateAPIView):
    """View to retrieve and update user profile"""
    serializer_class = UserProfileSerializer
    permission_classes = [IsAuthenticated]

    def get_object(self):
        return self.request.user

    def get(self, request, *args, **kwargs):
        """Get user profile"""
        serializer = self.get_serializer(self.get_object(), context={'request': request})
        return Response({
            'message': 'Profile retrieved successfully',
            'user': serializer.data
        }, status=status.HTTP_200_OK)

    def put(self, request, *args, **kwargs):
        """Update user profile"""
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        
        if serializer.is_valid():
            serializer.save()
            return Response({
                'message': 'Profile updated successfully',
                'user': serializer.data
            }, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def patch(self, request, *args, **kwargs):
        """Partially update user profile"""
        kwargs['partial'] = True
        return self.put(request, *args, **kwargs)

class DeleteAccountView(generics.DestroyAPIView):
    """View to delete user account"""
    permission_classes = [IsAuthenticated]

    def get_object(self):
        return self.request.user

    def delete(self, request, *args, **kwargs):
        user = self.get_object()
        user.delete()
        return Response(
            {"message": "Account deleted successfully"}, 
            status=status.HTTP_204_NO_CONTENT
        )

class ProfileImageUploadView(APIView):
    """View for uploading and deleting profile images"""
    permission_classes = [IsAuthenticated]
    parser_classes = [MultiPartParser, FormParser]
    
    def post(self, request):
        """Upload profile picture"""
        try:
            # Delete the old image if it exists
            if request.user.profile_image:
                request.user.delete_profile_image()
            
            serializer = ProfileImageSerializer(request.user, data=request.data, partial=True)
            if serializer.is_valid():
                user = serializer.save()
                
                # Return the new image link
                profile_image_url = user.get_profile_image_url()
                if profile_image_url:
                    profile_image_url = request.build_absolute_uri(profile_image_url)
                
                return Response({
                    'message': 'Profile picture uploaded successfully',
                    'profile_image_url': profile_image_url
                }, status=status.HTTP_200_OK)
            
            return Response({
                'error': 'Invalid input data',
                'details': serializer.errors
            }, status=status.HTTP_400_BAD_REQUEST)
            
        except Exception as e:
            return Response({
                'error': 'An error occurred while uploading the image',
                'details': str(e)
            }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    
    def delete(self, request):
        """Delete profile picture"""
        try:
            if request.user.profile_image:
                request.user.delete_profile_image()
                return Response({
                    'message': 'Profile picture deleted successfully'
                }, status=status.HTTP_200_OK)
            else:
                return Response({
                    'message': 'No image to delete'
                }, status=status.HTTP_404_NOT_FOUND)
                
        except Exception as e:
            return Response({
                'error': 'An error occurred while deleting the image',
                'details': str(e)
            }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)