import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isFromCurrentUser;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isFromCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.smallPadding),
      child: Row(
        mainAxisAlignment:
            isFromCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isFromCurrentUser) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey.shade300,
              backgroundImage:
                  message.sender.profileImage != null &&
                          message.sender.profileImage!.isNotEmpty
                      ? NetworkImage(
                        _getFullImageUrl(message.sender.profileImage!),
                      )
                      : null,
              child:
                  message.sender.profileImage == null ||
                          message.sender.profileImage!.isEmpty
                      ? Text(
                        _getInitials(message.sender.fullName),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                      : null,
            ),
            const SizedBox(width: AppConstants.smallPadding),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
                vertical: AppConstants.smallPadding,
              ),
              decoration: BoxDecoration(
                color:
                    isFromCurrentUser
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft:
                      isFromCurrentUser
                          ? const Radius.circular(16)
                          : const Radius.circular(4),
                  bottomRight:
                      isFromCurrentUser
                          ? const Radius.circular(4)
                          : const Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isFromCurrentUser)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        message.sender.fullName,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  Text(
                    message.content,
                    style: TextStyle(
                      color: isFromCurrentUser ? Colors.white : Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _formatTime(message.createdAt),
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              isFromCurrentUser
                                  ? Colors.white70
                                  : Colors.grey.shade500,
                        ),
                      ),
                      if (isFromCurrentUser) ...[
                        const SizedBox(width: 4),
                        Icon(
                          message.isRead ? Icons.done_all : Icons.done,
                          size: 14,
                          color:
                              message.isRead
                                  ? Colors.blue.shade200
                                  : Colors.white70,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (isFromCurrentUser) ...[
            const SizedBox(width: AppConstants.smallPadding),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey.shade300,
              backgroundImage:
                  message.sender.profileImage != null &&
                          message.sender.profileImage!.isNotEmpty
                      ? NetworkImage(
                        _getFullImageUrl(message.sender.profileImage!),
                      )
                      : null,
              child:
                  message.sender.profileImage == null ||
                          message.sender.profileImage!.isEmpty
                      ? Text(
                        _getInitials(message.sender.fullName),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                      : null,
            ),
          ],
        ],
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

  String _getFullImageUrl(String imagePath) {
    // If the path already contains http, return as is
    if (imagePath.startsWith('http')) {
      return imagePath;
    }
    // If the path starts with /, add the base URL
    if (imagePath.startsWith('/')) {
      return '${ApiConstants.baseUrl}$imagePath';
    }
    // Otherwise, add both base URL and /
    return '${ApiConstants.baseUrl}/$imagePath';
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
