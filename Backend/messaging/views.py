from rest_framework import generics, status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.viewsets import ModelViewSet
from django.db.models import Q, Max
from django.shortcuts import get_object_or_404
from .models import ChatRoom, Message
from .serializers import (
    ChatRoomSerializer, 
    ChatRoomCreateSerializer,
    MessageSerializer,
    MessageCreateSerializer
)
from .services import get_optimized_chatroom_queryset
from accounts.models import CustomUser
from chalets.models import Chalet

class ChatRoomViewSet(ModelViewSet):
    """
    ViewSet for managing chat rooms
    """
    permission_classes = [IsAuthenticated]
    
    def get_serializer_class(self):
        if self.action == 'create':
            return ChatRoomCreateSerializer
        return ChatRoomSerializer
    
    def get_queryset(self):
        """Return chat rooms where the user is either renter or owner"""
        user = self.request.user
        user_filter_q = Q(renter=user) | Q(owner=user)
        return get_optimized_chatroom_queryset(user_filter_q)
    
    def create(self, request, *args, **kwargs):
        """Create or get existing chat room for a chalet"""
        serializer = self.get_serializer(data=request.data, context={'request': request})
        serializer.is_valid(raise_exception=True)
        
        chalet_id = serializer.validated_data.get('chalet_id')
        owner_id = serializer.validated_data.get('owner_id')
        renter = request.user
        
        if chalet_id is not None:
            chalet = Chalet.objects.select_related('owner').get(id=chalet_id)
            owner = chalet.owner
        else:
            owner = CustomUser.objects.get(id=owner_id)
        
        existing_room = ChatRoom.objects.filter(renter=renter, owner=owner).first()
        
        chat_room = serializer.save()
        response_serializer = ChatRoomSerializer(chat_room, context={'request': request})
        
        status_code = status.HTTP_200_OK if existing_room else status.HTTP_201_CREATED
        return Response(response_serializer.data, status=status_code)
    
    @action(detail=True, methods=['get'])
    def messages(self, request, pk=None):
        """Get messages for a specific chat room"""
        chat_room = self.get_object()
        messages = chat_room.messages.all()
        messages_to_mark_read = messages.filter(is_read=False).exclude(sender=request.user)
        messages_to_mark_read.update(is_read=True)
        serializer = MessageSerializer(messages, many=True)
        return Response(serializer.data)
    
    @action(detail=True, methods=['post'])
    def send_message(self, request, pk=None):
        """Send a message in a chat room"""
        chat_room = self.get_object()
        if request.user not in [chat_room.renter, chat_room.owner]:
            return Response(
                {'error': 'You are not authorized to send messages in this chat room.'}, 
                status=status.HTTP_403_FORBIDDEN
            )
        
        serializer = MessageCreateSerializer(
            data=request.data,
            context={'chat_room': chat_room, 'sender': request.user}
        )
        serializer.is_valid(raise_exception=True)
        message = serializer.save()
        
        chat_room.refresh_from_db()
        chat_room.save(update_fields=['updated_at'])
        
        response_serializer = MessageSerializer(message, context={'request': request})
        return Response(response_serializer.data, status=status.HTTP_201_CREATED)

class ChatRoomListView(generics.ListAPIView):
    """
    List all chat rooms for the current user
    """
    serializer_class = ChatRoomSerializer
    permission_classes = [IsAuthenticated]
    
    def get_queryset(self):
        user = self.request.user
        user_filter_q = Q(renter=user) | Q(owner=user)
        return get_optimized_chatroom_queryset(user_filter_q).annotate(
            latest_message_time=Max('messages__created_at')
        ).order_by('-latest_message_time', '-updated_at')

class ChatRoomCreateView(generics.CreateAPIView):
    """
    Create or get a chat room for a chalet
    """
    serializer_class = ChatRoomCreateSerializer
    permission_classes = [IsAuthenticated]
    
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data, context={'request': request})
        serializer.is_valid(raise_exception=True)
        
        chalet_id = serializer.validated_data.get('chalet_id')
        owner_id = serializer.validated_data.get('owner_id')
        renter = request.user
        
        if chalet_id is not None:
            chalet = Chalet.objects.select_related('owner').get(id=chalet_id)
            owner = chalet.owner
        else:
            owner = CustomUser.objects.get(id=owner_id)
        
        existing_room = ChatRoom.objects.filter(renter=renter, owner=owner).first()
        
        chat_room = serializer.save()
        response_serializer = ChatRoomSerializer(chat_room, context={'request': request})
        
        status_code = status.HTTP_200_OK if existing_room else status.HTTP_201_CREATED
        return Response(response_serializer.data, status=status_code)

class MessageListView(generics.ListAPIView):
    """
    List messages for a specific chat room
    """
    serializer_class = MessageSerializer
    permission_classes = [IsAuthenticated]
    
    def get_queryset(self):
        chat_room_id = self.kwargs['chat_room_id']
        chat_room = get_object_or_404(ChatRoom, id=chat_room_id)
        if self.request.user not in [chat_room.renter, chat_room.owner]:
            return Message.objects.none()
        messages_to_mark_read = chat_room.messages.filter(
            is_read=False
        ).exclude(sender=self.request.user)
        messages_to_mark_read.update(is_read=True)
        return chat_room.messages.all()

class MessageCreateView(generics.CreateAPIView):
    """
    Send a message in a chat room
    """
    serializer_class = MessageCreateSerializer
    permission_classes = [IsAuthenticated]
    
    def create(self, request, *args, **kwargs):
        chat_room_id = self.kwargs['chat_room_id']
        chat_room = get_object_or_404(ChatRoom, id=chat_room_id)
        if request.user not in [chat_room.renter, chat_room.owner]:
            return Response(
                {'error': 'You are not authorized to send messages in this chat room.'}, 
                status=status.HTTP_403_FORBIDDEN
            )
        
        serializer = self.get_serializer(
            data=request.data,
            context={'chat_room': chat_room, 'sender': request.user}
        )
        serializer.is_valid(raise_exception=True)
        message = serializer.save()
        
        chat_room.refresh_from_db()
        chat_room.save(update_fields=['updated_at'])
        
        response_serializer = MessageSerializer(message, context={'request': request})
        return Response(response_serializer.data, status=status.HTTP_201_CREATED)
