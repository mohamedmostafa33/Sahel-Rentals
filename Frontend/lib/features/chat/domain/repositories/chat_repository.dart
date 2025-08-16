import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/chat_room.dart';
import '../entities/message.dart';

abstract class ChatRepository {
  /// Get all chat rooms for the current user
  Future<Either<Failure, List<ChatRoom>>> getChatRooms();

  /// Create or get a chat room for a chalet
  Future<Either<Failure, ChatRoom>> createOrGetChatRoom({
    required int chaletId,
  });

  /// Create or get a chat room directly with an owner
  Future<Either<Failure, ChatRoom>> createOrGetChatRoomWithOwner({
    required int ownerId,
  });

  /// Get messages for a specific chat room
  Future<Either<Failure, List<Message>>> getMessages(int chatRoomId);

  /// Send a message in a chat room
  Future<Either<Failure, Message>> sendMessage({
    required int chatRoomId,
    required String content,
    int? chaletId,
  });
}
