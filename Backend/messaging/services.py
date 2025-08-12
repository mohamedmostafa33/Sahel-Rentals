from django.db.models import Prefetch, Q
from .models import ChatRoom, Message

def get_user_chatrooms(user):
    """
    Return chat rooms for a user with the last message prefetched (including sender),
    optimized to avoid N+1 queries.
    """
    last_message_prefetch = Prefetch(
        'messages',
        queryset=Message.objects.select_related('sender', 'chalet').order_by('-created_at')[:1],
        to_attr='prefetched_messages' 
    )
    
    chat_rooms = (
        ChatRoom.objects
        .filter(Q(renter=user) | Q(owner=user))
        .select_related('renter', 'owner', 'last_chalet')
        .prefetch_related(last_message_prefetch)
        .order_by('-updated_at')
    )
    return chat_rooms

def get_optimized_chatroom_queryset(user_filter_q=None):
    """
    Get an optimized queryset for chat rooms with proper select_related and prefetch_related.
    
    Args:
        user_filter_q: Q object for filtering chat rooms by user
    
    Returns:
        QuerySet: Optimized ChatRoom queryset
    """
    last_message_prefetch = Prefetch(
        'messages',
        queryset=Message.objects.select_related('sender', 'chalet').order_by('-created_at')[:1],
        to_attr='prefetched_messages'
    )
    
    queryset = ChatRoom.objects.select_related(
        'renter', 'owner', 'last_chalet'
    ).prefetch_related(last_message_prefetch)
    
    if user_filter_q:
        queryset = queryset.filter(user_filter_q)
    
    return queryset.order_by('-updated_at')

def get_or_create_chatroom(renter, owner, chalet=None):
    """
    Get or create a chat room for a renter-owner pair.
    Updates last_chalet if the room exists and a new chalet is provided.
    
    Args:
        renter: User instance (renter)
        owner: User instance (owner)
        chalet: Chalet instance (optional)
    
    Returns:
        tuple: (ChatRoom instance, created boolean)
    """
    chat_room, created = ChatRoom.objects.get_or_create(
        renter=renter,
        owner=owner,
        defaults={'last_chalet': chalet} if chalet else {}
    )
    
    if not created and chalet and chat_room.last_chalet_id != chalet.id:
        chat_room.last_chalet = chalet
        chat_room.save(update_fields=['last_chalet', 'updated_at'])
    
    return chat_room, created
