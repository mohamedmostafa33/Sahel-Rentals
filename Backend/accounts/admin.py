from django.contrib import admin
from .models import CustomUser

@admin.register(CustomUser)
class CustomUserAdmin(admin.ModelAdmin):
    list_display = ('email', 'full_name', 'phone', 'user_type', 'is_active', 'is_staff', 'created_at')
    search_fields = ('email', 'full_name', 'phone')
    list_filter = ('user_type', 'is_active', 'is_staff', 'created_at')
    ordering = ('-created_at',)
    readonly_fields = ('created_at',) 

    fieldsets = (
        (None, {'fields': ('email', 'full_name', 'phone', 'user_type', 'password')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login',)}),
    )

    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'full_name', 'phone', 'user_type', 'password1', 'password2', 'is_active', 'is_staff', 'is_superuser'),
        }),
    )
