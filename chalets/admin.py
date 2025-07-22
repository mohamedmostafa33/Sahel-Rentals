from django.contrib import admin
from .models import Chalet

@admin.register(Chalet)
class ChaletAdmin(admin.ModelAdmin):
    list_display = ('name', 'owner', 'number_of_rooms', 'price_per_night', 'created_at')
    search_fields = ('name', 'owner__full_name')
    list_filter = ('number_of_rooms', 'created_at')