from django.contrib import admin
from .models import Chalet, ChaletImage, Favorite


class ChaletImageInline(admin.TabularInline):
    model = ChaletImage
    extra = 1
    fields = ('image', 'is_main', 'caption', 'order')
    readonly_fields = ('created_at',)


@admin.register(Chalet)
class ChaletAdmin(admin.ModelAdmin):
    list_display = ('name', 'owner', 'number_of_rooms', 'price_per_night', 'image_count', 'is_available', 'created_at')
    search_fields = ('name', 'owner__full_name', 'location')
    list_filter = ('number_of_rooms', 'is_available', 'created_at')
    readonly_fields = ('created_at', 'image_count')
    inlines = [ChaletImageInline]
    
    def image_count(self, obj):
        return obj.image_count
    image_count.short_description = 'Images'


@admin.register(ChaletImage)
class ChaletImageAdmin(admin.ModelAdmin):
    list_display = ('chalet', 'is_main', 'caption', 'order', 'created_at')
    list_filter = ('is_main', 'created_at')
    search_fields = ('chalet__name', 'caption')
    list_editable = ('is_main', 'order')
    ordering = ('chalet', 'order')


@admin.register(Favorite)
class FavoriteAdmin(admin.ModelAdmin):
    list_display = ('user', 'chalet', 'created_at')
    search_fields = ('user__full_name', 'user__email', 'chalet__name', 'chalet__owner__full_name')
    list_filter = ('created_at',)
    autocomplete_fields = ('user', 'chalet')