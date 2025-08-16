import 'package:equatable/equatable.dart';
import 'chat_user.dart';
import 'chat_chalet.dart';

class Message extends Equatable {
  final int id;
  final ChatUser sender;
  final ChatChalet? chalet;
  final String content;
  final DateTime createdAt;
  final bool isRead;

  const Message({
    required this.id,
    required this.sender,
    this.chalet,
    required this.content,
    required this.createdAt,
    required this.isRead,
  });

  @override
  List<Object?> get props => [id, sender, chalet, content, createdAt, isRead];

  Message copyWith({
    int? id,
    ChatUser? sender,
    ChatChalet? chalet,
    String? content,
    DateTime? createdAt,
    bool? isRead,
  }) {
    return Message(
      id: id ?? this.id,
      sender: sender ?? this.sender,
      chalet: chalet ?? this.chalet,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
    );
  }

  bool get isFromCurrentUser =>
      false; // This will be determined in the presentation layer
}
