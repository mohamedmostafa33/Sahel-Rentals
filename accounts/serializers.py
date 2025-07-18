from rest_framework import serializers
from .models import CustomUser, OTP

class UserRegistrationSerializer(serializers.ModelSerializer):
    password1 = serializers.CharField(write_only=True, required=True, min_length=8)
    password2 = serializers.CharField(write_only=True, required=True, min_length=8)

    class Meta:
        model = CustomUser
        fields = ('email', 'full_name', 'password1', 'password2')

    def validate(self, data):
        if data['password1'] != data['password2']:
            raise serializers.ValidationError("Passwords do not match")
        return data
    
    def create(self, validated_data):
        user = CustomUser.objects.create_user(
            email=validated_data['email'],
            full_name=validated_data['full_name'],
            password=validated_data['password1']
        )
        return user

from rest_framework import serializers
from django.contrib.auth import get_user_model

class UserLoginSerializer(serializers.Serializer):
    email = serializers.EmailField(required=True)
    password = serializers.CharField(write_only=True, required=True, min_length=8)
    
    def validate(self, data):
        CustomUser = get_user_model()
    
        user = CustomUser.objects.filter(email=data['email']).first()
        if not user:
            raise serializers.ValidationError("User with this email does not exist")
        if not user.is_active:
            raise serializers.ValidationError("This account is inactive")
        if not user.check_password(data['password']):
            raise serializers.ValidationError("Incorrect password")
    
        self.context['user'] = user
        return data
    
class ResetPasswordRequestSerializer(serializers.Serializer):
    email = serializers.EmailField(required=True)

    def validate_email(self, value):
        CustomUser = get_user_model()
        if not CustomUser.objects.filter(email=value).exists():
            raise serializers.ValidationError("User with this email does not exist")
        return value

class ResetPasswordConfirmSerializer(serializers.Serializer):
    email = serializers.EmailField(required=True)
    otp = serializers.CharField(max_length=6, required=True)
    new_password = serializers.CharField(write_only=True, required=True, min_length=8)
    confirm_password = serializers.CharField(write_only=True, required=True, min_length=8)

    def validate(self, data):
        email = data['email']
        otp = data['otp']
        new_password = data['new_password']
        confirm_password = data['confirm_password']

        if new_password != confirm_password:
            raise serializers.ValidationError("New passwords do not match")

        CustomUser = get_user_model()
        try:
            user = CustomUser.objects.get(email=email)
        except CustomUser.DoesNotExist:
            raise serializers.ValidationError("User with this email does not exist")

        otp_obj = OTP.objects.filter(email=email, otp=otp).first()
        if not otp_obj or not otp_obj.is_valid():
            raise serializers.ValidationError("Invalid or expired OTP")

        data['user'] = user
        return data