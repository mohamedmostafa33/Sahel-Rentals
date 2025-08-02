from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser, PermissionsMixin
from django.utils import timezone
from datetime import timedelta
from PIL import Image
import os
import logging


logger = logging.getLogger(__name__) 

class CustomUserManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError('The Email field must be set')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        return self.create_user(email, password, **extra_fields)


class CustomUser(AbstractBaseUser, PermissionsMixin):
    full_name = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=15, blank=True, null=True, help_text='Phone number with country code')
    
    USER_TYPE_CHOICES = (
        ('owner', 'Owner'),
        ('renter', 'Renter'),
    )
    user_type = models.CharField(max_length=10, choices=USER_TYPE_CHOICES, default='renter')

    profile_image = models.ImageField(
        upload_to='profile_images/%Y/%m/',
        null=True,
        blank=True,
        help_text="Profile Picture"
    )

    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    objects = CustomUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['full_name']

    class Meta:
        verbose_name = "User"
        verbose_name_plural = "Users"

    def __str__(self):
        return self.full_name

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)

        if self.profile_image:
            try:
                img = Image.open(self.profile_image.path)
                if img.height > 300 or img.width > 300:
                    output_size = (300, 300)
                    img.thumbnail(output_size)
                    img.save(self.profile_image.path)
            except Exception as e:
                logger.warning(f"Image resizing failed for user '{self.email}': {e}")  

    def get_profile_image_url(self):
        """Return profile picture link or default image"""
        if self.profile_image and hasattr(self.profile_image, 'url'):
            return self.profile_image.url
        return None

    def delete_profile_image(self):
        """Delete profile picture"""
        if self.profile_image:
            try:
                if os.path.isfile(self.profile_image.path):
                    os.remove(self.profile_image.path)
                self.profile_image = None
                self.save()
            except Exception as e:
                logger.error(f"Failed to delete profile image for user '{self.email}': {e}")


class OTP(models.Model):
    email = models.EmailField()
    otp = models.CharField(max_length=6)
    created_at = models.DateTimeField(auto_now_add=True)
    expires_at = models.DateTimeField()

    def save(self, *args, **kwargs):
        self.expires_at = timezone.now() + timedelta(minutes=10)
        super().save(*args, **kwargs)

    def is_valid(self):
        return timezone.now() < self.expires_at


