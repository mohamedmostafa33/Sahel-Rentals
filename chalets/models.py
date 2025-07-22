from django.db import models
from django.conf import settings

class Chalet(models.Model):
    owner = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='chalets')
    name = models.CharField(max_length=100)
    number_of_rooms = models.PositiveIntegerField()
    price_per_night = models.DecimalField(max_digits=10, decimal_places=2)
    notes = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created_at']
        verbose_name = "Chalet"
        verbose_name_plural = "Chalets"

    def __str__(self):
        return self.name