import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/message.dart';
import '../repositories/chat_repository.dart';

class SendMessage implements UseCase<Message, SendMessageParams> {
  final ChatRepository repository;

  SendMessage(this.repository);

  @override
  Future<Either<Failure, Message>> call(SendMessageParams params) async {
    return await repository.sendMessage(
      chatRoomId: params.chatRoomId,
      content: params.content,
      chaletId: params.chaletId,
    );
  }
}

class SendMessageParams extends Equatable {
  final int chatRoomId;
  final String content;
  final int? chaletId;

  const SendMessageParams({
    required this.chatRoomId,
    required this.content,
    this.chaletId,
  });

  @override
  List<Object?> get props => [chatRoomId, content, chaletId];
}
