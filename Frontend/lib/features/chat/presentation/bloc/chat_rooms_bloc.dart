import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/chat_room.dart';
import '../../domain/usecases/get_chat_rooms.dart';
import '../../domain/usecases/create_or_get_chat_room.dart';

part 'chat_rooms_event.dart';
part 'chat_rooms_state.dart';
part 'chat_rooms_bloc.freezed.dart';

class ChatRoomsBloc extends Bloc<ChatRoomsEvent, ChatRoomsState> {
  final GetChatRooms _getChatRooms;
  final CreateOrGetChatRoom _createOrGetChatRoom;

  ChatRoomsBloc({
    required GetChatRooms getChatRooms,
    required CreateOrGetChatRoom createOrGetChatRoom,
  }) : _getChatRooms = getChatRooms,
       _createOrGetChatRoom = createOrGetChatRoom,
       super(const ChatRoomsState.initial()) {
    on<ChatRoomsEvent>((event, emit) async {
      await event.when(
        loadChatRooms: () => _onLoadChatRooms(emit),
        createOrGetChatRoom:
            (chaletId, ownerId) =>
                _onCreateOrGetChatRoom(emit, chaletId, ownerId),
        refreshChatRooms: () => _onRefreshChatRooms(emit),
      );
    });
  }

  Future<void> _onLoadChatRooms(Emitter<ChatRoomsState> emit) async {
    emit(const ChatRoomsState.loading());

    final result = await _getChatRooms(NoParams());

    result.fold(
      (failure) => emit(ChatRoomsState.failure(failure.message)),
      (chatRooms) => emit(ChatRoomsState.loaded(chatRooms)),
    );
  }

  Future<void> _onCreateOrGetChatRoom(
    Emitter<ChatRoomsState> emit,
    int? chaletId,
    int? ownerId,
  ) async {
    emit(const ChatRoomsState.creatingChatRoom());

    try {
      final result = await _createOrGetChatRoom(
        CreateOrGetChatRoomParams(chaletId: chaletId, ownerId: ownerId),
      );

      result.fold(
        (failure) => emit(ChatRoomsState.failure(failure.message)),
        (chatRoom) => emit(ChatRoomsState.chatRoomCreated(chatRoom)),
      );
    } catch (e) {
      emit(ChatRoomsState.failure('Unexpected error occurred: $e'));
    }
  }

  Future<void> _onRefreshChatRooms(Emitter<ChatRoomsState> emit) async {
    // Keep current state while refreshing
    final currentState = state;
    if (currentState is _Loaded) {
      emit(ChatRoomsState.refreshing(currentState.chatRooms));
    }

    final result = await _getChatRooms(NoParams());

    result.fold(
      (failure) => emit(ChatRoomsState.failure(failure.message)),
      (chatRooms) => emit(ChatRoomsState.loaded(chatRooms)),
    );
  }
}
