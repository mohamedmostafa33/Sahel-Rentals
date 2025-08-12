from django.db import models
from django.conf import settings
from chalets.models import Chalet


class ChatRoom(models.Model):
    renter = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name='renter_chat_rooms',
        verbose_name="Renter",
    )
    owner = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name='owner_chat_rooms',
        verbose_name="Owner",
    )
    last_chalet = models.ForeignKey(
        Chalet,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='chat_rooms',
        verbose_name="Last Chalet",
        help_text="The most recent chalet from which this chat was initiated"
    )
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Created At")
    updated_at = models.DateTimeField(auto_now=True, verbose_name="Updated At")

    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['renter', 'owner'], name='unique_renter_owner_chatroom')
        ]
        ordering = ['-updated_at']
        indexes = [
            models.Index(fields=['renter']),
            models.Index(fields=['owner']),
            models.Index(fields=['last_chalet']),
        ]
        verbose_name = "Chat Room"
        verbose_name_plural = "Chat Rooms"

    def __str__(self):
        renter_name = getattr(self.renter, 'full_name', str(self.renter))
        owner_name = getattr(self.owner, 'full_name', str(self.owner))
        chalet_info = f" - {self.last_chalet.name}" if self.last_chalet else ""
        return f"Chat: {renter_name} & {owner_name}{chalet_info}"

    @property
    def last_message(self):
        messages = getattr(self, 'prefetched_messages', None)
        if messages is not None and len(messages) > 0:
            return messages[0]
        return self.messages.order_by('-created_at').select_related('sender').first()


class Message(models.Model):
    chat_room = models.ForeignKey(
        ChatRoom,
        on_delete=models.CASCADE,
        related_name='messages',
        verbose_name="Chat Room"
    )
    sender = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name='sent_messages',
        verbose_name="Sender"
    )
    chalet = models.ForeignKey(
        Chalet,
        on_delete=models.CASCADE,
        related_name='messages',
        verbose_name="Chalet",
        null=True,
        blank=True,
        help_text="Optional reference to the chalet discussed in this message"
    )
    content = models.TextField(verbose_name="Content")
    created_at = models.DateTimeField(auto_now_add=True, db_index=True, verbose_name="Created At")
    is_read = models.BooleanField(default=False, verbose_name="Is Read")

    class Meta:
        ordering = ['-created_at']
        indexes = [
            models.Index(fields=['chat_room', '-created_at']),
            models.Index(fields=['created_at']),
            models.Index(fields=['chalet']),
        ]
        verbose_name = "Message"
        verbose_name_plural = "Messages"

    def __str__(self):
        sender_name = getattr(self.sender, 'full_name', str(self.sender))
        preview = self.content[:50].replace('\n', ' ')
        return f"{sender_name}: {preview}{'...' if len(self.content) > 50 else ''}"
