from django.contrib import admin
from .models import CustomUser

@admin.register(CustomUser)
class CustomUserAdmin(admin.ModelAdmin):
    list_display = ('email', 'user_type', 'full_name', 'is_active', 'is_staff', 'created_at')
    search_fields = ('email', 'full_name')
    list_filter = ('is_active', 'is_staff', 'created_at')
    ordering = ('-created_at',)
    
    fieldsets = (
        (None, {'fields': ('email', 'full_name', 'password')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'created_at')}),
    )
    
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'full_name', 'password1', 'password2', 'is_active', 'is_staff', 'is_superuser'),
        }),
    )
