from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import (
    ChatRoomViewSet,
    ChatRoomListView,
    ChatRoomCreateView,
    MessageListView,
    MessageCreateView
)

# Create router for ViewSet
router = DefaultRouter()
router.register(r'chat-rooms', ChatRoomViewSet, basename='chatroom')

urlpatterns = [
    # ViewSet URLs (recommended approach)
    path('', include(router.urls)),
    
    # Alternative function-based URLs (for flexibility)
    # path('chat-rooms/', ChatRoomListView.as_view(), name='chatroom-list'),
    # path('chat-rooms/create/', ChatRoomCreateView.as_view(), name='chatroom-create'),
    # path('chat-rooms/<int:chat_room_id>/messages/', MessageListView.as_view(), name='message-list'),
    # path('chat-rooms/<int:chat_room_id>/messages/send/', MessageCreateView.as_view(), name='message-create'),
]
