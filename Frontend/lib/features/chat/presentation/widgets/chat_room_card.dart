import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/chat_room.dart';
import '../../domain/entities/message.dart';

class ChatRoomCard extends StatelessWidget {
  final ChatRoom chatRoom;
  final int currentUserId;
  final VoidCallback onTap;

  const ChatRoomCard({
    super.key,
    required this.chatRoom,
    required this.currentUserId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final otherParticipant = chatRoom.getOtherParticipant(currentUserId);
    final lastMessage = chatRoom.lastMessage;

    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.smallPadding),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blue.shade100,
          backgroundImage:
              otherParticipant.profileImage != null
                  ? CachedNetworkImageProvider(otherParticipant.profileImage!)
                  : null,
          child:
              otherParticipant.profileImage == null
                  ? Text(
                    _getInitials(otherParticipant.fullName),
                    style: TextStyle(
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                  : null,
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                otherParticipant.fullName,
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (chatRoom.unreadCount > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  chatRoom.unreadCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (chatRoom.lastChalet != null) ...[
              Text(
                chatRoom.lastChalet!.name,
                style: TextStyle(
                  color: Colors.blue.shade600,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
            ],
            if (lastMessage != null)
              Text(
                _formatLastMessage(lastMessage),
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
        trailing:
            lastMessage != null
                ? Text(
                  _formatTime(lastMessage.createdAt),
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                )
                : null,
        onTap: onTap,
      ),
    );
  }

  String _getInitials(String fullName) {
    final names = fullName.split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}'.toUpperCase();
    } else if (names.isNotEmpty) {
      return names[0][0].toUpperCase();
    } else {
      return 'U';
    }
  }

  String _formatLastMessage(Message message) {
    final senderName =
        message.sender.id == currentUserId
            ? 'أنت'
            : message.sender.fullName.split(' ')[0];
    return '$senderName: ${message.content}';
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (messageDate == today) {
      // Today - show time
      return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    } else if (messageDate == today.subtract(const Duration(days: 1))) {
      // Yesterday
      return 'أمس';
    } else if (now.difference(dateTime).inDays < 7) {
      // This week - show day name
      final weekdays = [
        'الإثنين',
        'الثلاثاء',
        'الأربعاء',
        'الخميس',
        'الجمعة',
        'السبت',
        'الأحد',
      ];
      return weekdays[dateTime.weekday - 1];
    } else {
      // Older - show date
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}
