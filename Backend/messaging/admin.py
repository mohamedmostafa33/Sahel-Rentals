from django.contrib import admin
from .models import ChatRoom, Message


@admin.register(ChatRoom)
class ChatRoomAdmin(admin.ModelAdmin):
    list_display = ['id', 'last_chalet', 'renter', 'owner', 'created_at', 'updated_at']
    list_filter = ['created_at', 'updated_at']
    search_fields = ['last_chalet__name', 'renter__full_name', 'owner__full_name']
    readonly_fields = ['created_at', 'updated_at']
    raw_id_fields = ['last_chalet', 'renter', 'owner']
    
    def get_queryset(self, request):
        return super().get_queryset(request).select_related('last_chalet', 'renter', 'owner')


@admin.register(Message)
class MessageAdmin(admin.ModelAdmin):
    list_display = ['id', 'chat_room', 'sender', 'content_preview', 'created_at', 'is_read']
    list_filter = ['created_at', 'is_read', 'sender__user_type']
    search_fields = ['content', 'sender__full_name', 'chat_room__last_chalet__name']
    readonly_fields = ['created_at']
    raw_id_fields = ['chat_room', 'sender', 'chalet']
    
    def content_preview(self, obj):
        return obj.content[:50] + '...' if len(obj.content) > 50 else obj.content
    content_preview.short_description = 'Content Preview'
    
    def get_queryset(self, request):
        return super().get_queryset(request).select_related('chat_room', 'sender', 'chalet', 'chat_room__last_chalet')
