from rest_framework import serializers
from .models import ChatRoom, Message
from .services import get_or_create_chatroom
from chalets.models import Chalet
from accounts.models import CustomUser


class UserSerializer(serializers.ModelSerializer):
    """Serializer for user information in chat context"""
    class Meta:
        model = CustomUser
        fields = ['id', 'full_name', 'email', 'user_type', 'profile_image']


class ChaletBasicSerializer(serializers.ModelSerializer):
    """Basic serializer for chalet information in chat context"""
    class Meta:
        model = Chalet
        fields = ['id', 'name', 'location', 'price_per_night']


class MessageSerializer(serializers.ModelSerializer):
    """Serializer for messages"""
    sender = UserSerializer(read_only=True)
    chalet = ChaletBasicSerializer(read_only=True)

    class Meta:
        model = Message
        fields = ['id', 'sender', 'chalet', 'content', 'created_at', 'is_read']
        read_only_fields = ['id', 'created_at', 'sender', 'chalet']


class MessageCreateSerializer(serializers.ModelSerializer):
    """Serializer for creating messages"""
    chalet_id = serializers.IntegerField(write_only=True, required=False, allow_null=True)

    class Meta:
        model = Message
        fields = ['content', 'chalet_id']

    def validate_chalet_id(self, value):
        if value is not None:
            try:
                chalet = Chalet.objects.get(id=value)
            except Chalet.DoesNotExist:
                raise serializers.ValidationError("Chalet not found.")
        return value

    def create(self, validated_data):
        chat_room = self.context['chat_room']
        sender = self.context['sender']
        chalet_id = validated_data.get('chalet_id')
        content = validated_data['content']
        
        chalet = None
        if chalet_id:
            chalet = Chalet.objects.get(id=chalet_id)
            if chat_room.last_chalet_id != chalet.id:
                chat_room.last_chalet = chalet
                chat_room.save(update_fields=['last_chalet', 'updated_at'])
        else:
            chalet = chat_room.last_chalet

        return Message.objects.create(
            chat_room=chat_room,
            sender=sender,
            chalet=chalet,
            content=content
        )


class ChatRoomSerializer(serializers.ModelSerializer):
    """Serializer for chat rooms"""
    renter = UserSerializer(read_only=True)
    owner = UserSerializer(read_only=True)
    last_chalet = ChaletBasicSerializer(read_only=True)
    last_message = MessageSerializer(read_only=True)
    unread_count = serializers.SerializerMethodField()

    class Meta:
        model = ChatRoom
        fields = [
            'id', 'renter', 'owner', 'last_chalet', 'created_at',
            'updated_at', 'last_message', 'unread_count'
        ]
        read_only_fields = ['id', 'created_at', 'updated_at']

    def get_unread_count(self, obj):
        request = self.context.get('request')
        if request and request.user.is_authenticated:
            return obj.messages.filter(is_read=False).exclude(sender=request.user).count()
        return 0


class ChatRoomCreateSerializer(serializers.ModelSerializer):
    """Serializer for creating or getting chat rooms"""
    chalet_id = serializers.IntegerField(write_only=True, required=False, allow_null=True)
    owner_id = serializers.IntegerField(write_only=True, required=False, allow_null=True)

    class Meta:
        model = ChatRoom
        fields = ['chalet_id', 'owner_id']

    def validate_chalet_id(self, value):
        if value is not None:
            try:
                chalet = Chalet.objects.get(id=value)
                if not chalet.is_available:
                    raise serializers.ValidationError("This chalet is not available for rental.")
            except Chalet.DoesNotExist:
                raise serializers.ValidationError("Chalet not found.")
        return value

    def validate_owner_id(self, value):
        if value is not None:
            try:
                owner = CustomUser.objects.get(id=value)
                if owner.user_type != 'owner':
                    raise serializers.ValidationError("The specified user is not an owner.")
            except CustomUser.DoesNotExist:
                raise serializers.ValidationError("Owner not found.")
        return value

    def validate(self, attrs):
        chalet_id = attrs.get('chalet_id')
        owner_id = attrs.get('owner_id')
        request = self.context['request']

        if chalet_id is None and owner_id is None:
            raise serializers.ValidationError(
                "Either chalet_id or owner_id must be provided to create a chat room."
            )

        if chalet_id is not None:
            chalet = Chalet.objects.get(id=chalet_id)
            if chalet.owner == request.user:
                raise serializers.ValidationError("You cannot create a chat room with yourself.")
            if owner_id is not None and chalet.owner_id != owner_id:
                raise serializers.ValidationError(
                    "The specified owner_id does not match the chalet's owner."
                )

        if chalet_id is None and owner_id is not None:
            if owner_id == request.user.id:
                raise serializers.ValidationError("You cannot create a chat room with yourself.")

        if request.user.user_type != 'renter':
            raise serializers.ValidationError("Only renters can initiate chat rooms.")

        return attrs

    def create(self, validated_data):
        chalet_id = validated_data.get('chalet_id')
        owner_id = validated_data.get('owner_id')
        renter = self.context['request'].user
        
        if chalet_id is not None:
            chalet = Chalet.objects.select_related('owner').get(id=chalet_id)
            owner = chalet.owner
        else:
            owner = CustomUser.objects.get(id=owner_id)
            chalet = None

        chat_room, created = get_or_create_chatroom(renter, owner, chalet)
        return chat_room
