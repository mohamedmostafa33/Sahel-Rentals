from django.db import models
from django.conf import settings
import uuid
import os


def chalet_image_upload_path(instance, filename):
    """Generate upload path for chalet images"""
    ext = filename.split('.')[-1]
    filename = f"{uuid.uuid4()}.{ext}"
    return os.path.join('chalets', str(instance.chalet.id), filename)


class Chalet(models.Model):
    owner = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='chalets')
    name = models.CharField(max_length=100)
    number_of_rooms = models.PositiveIntegerField()
    price_per_night = models.DecimalField(max_digits=10, decimal_places=2)
    notes = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    location = models.CharField(max_length=100)
    unit_number = models.CharField(max_length=50)
    is_available = models.BooleanField(default=True)

    class Meta:
        ordering = ['-created_at']
        verbose_name = "Chalet"
        verbose_name_plural = "Chalets"

    def __str__(self):
        return f"{self.name} - {self.owner.full_name}"
    
    @property
    def main_image(self):
        """Get the main/first image for the chalet"""
        main_img = self.images.filter(is_main=True).first()
        return main_img if main_img else self.images.first()
    
    @property
    def image_count(self):
        """Get total number of images"""
        return self.images.count()


class ChaletImage(models.Model):
    chalet = models.ForeignKey(Chalet, on_delete=models.CASCADE, related_name='images')
    image = models.ImageField(upload_to=chalet_image_upload_path)
    is_main = models.BooleanField(default=False)
    caption = models.CharField(max_length=200, blank=True, null=True)
    order = models.PositiveIntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        ordering = ['order', '-is_main', 'created_at']
        verbose_name = "Chalet Image"
        verbose_name_plural = "Chalet Images"
    
    def __str__(self):
        return f"{self.chalet.name} - Image {self.order}"
    
    def save(self, *args, **kwargs):
        # Ensure only one main image per chalet
        if self.is_main:
            ChaletImage.objects.filter(chalet=self.chalet, is_main=True).update(is_main=False)
        super().save(*args, **kwargs)