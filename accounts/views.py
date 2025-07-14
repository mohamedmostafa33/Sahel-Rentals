from rest_framework.response import Response
from rest_framework import status, generics
from .serializers import UserRegistrationSerializer

class UserRegistrationView(generics.CreateAPIView):
    serializer_class = UserRegistrationSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            return Response({
                'message': 'User registered successfully',
                'user': {
                    'email': user.email,
                    'full_name': user.full_name
                }
            }, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)