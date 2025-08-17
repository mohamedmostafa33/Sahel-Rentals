import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/chat_room.dart';
import '../repositories/chat_repository.dart';

class CreateOrGetChatRoom
    implements UseCase<ChatRoom, CreateOrGetChatRoomParams> {
  final ChatRepository repository;

  CreateOrGetChatRoom(this.repository);

  @override
  Future<Either<Failure, ChatRoom>> call(
    CreateOrGetChatRoomParams params,
  ) async {
    if (params.chaletId != null) {
      return await repository.createOrGetChatRoom(chaletId: params.chaletId!);
    } else if (params.ownerId != null) {
      return await repository.createOrGetChatRoomWithOwner(
        ownerId: params.ownerId!,
      );
    } else {
      return Left(
        InvalidInputFailure('Either chaletId or ownerId must be provided'),
      );
    }
  }
}

class CreateOrGetChatRoomParams extends Equatable {
  final int? chaletId;
  final int? ownerId;

  const CreateOrGetChatRoomParams({this.chaletId, this.ownerId});

  @override
  List<Object?> get props => [chaletId, ownerId];
}
