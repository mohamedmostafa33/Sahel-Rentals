import 'package:equatable/equatable.dart';
import 'chat_user.dart';
import 'chat_chalet.dart';
import 'message.dart';

class ChatRoom extends Equatable {
  final int id;
  final ChatUser renter;
  final ChatUser owner;
  final ChatChalet? lastChalet;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Message? lastMessage;
  final int unreadCount;

  const ChatRoom({
    required this.id,
    required this.renter,
    required this.owner,
    this.lastChalet,
    required this.createdAt,
    required this.updatedAt,
    this.lastMessage,
    required this.unreadCount,
  });

  @override
  List<Object?> get props => [
    id,
    renter,
    owner,
    lastChalet,
    createdAt,
    updatedAt,
    lastMessage,
    unreadCount,
  ];

  ChatRoom copyWith({
    int? id,
    ChatUser? renter,
    ChatUser? owner,
    ChatChalet? lastChalet,
    DateTime? createdAt,
    DateTime? updatedAt,
    Message? lastMessage,
    int? unreadCount,
  }) {
    return ChatRoom(
      id: id ?? this.id,
      renter: renter ?? this.renter,
      owner: owner ?? this.owner,
      lastChalet: lastChalet ?? this.lastChalet,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastMessage: lastMessage ?? this.lastMessage,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }

  // Get the other participant (not the current user)
  ChatUser getOtherParticipant(int currentUserId) {
    return renter.id == currentUserId ? owner : renter;
  }

  // Get chat title
  String getChatTitle(int currentUserId) {
    final otherParticipant = getOtherParticipant(currentUserId);
    return otherParticipant.fullName;
  }
}
