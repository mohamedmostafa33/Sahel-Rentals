part of 'chat_rooms_bloc.dart';

@freezed
class ChatRoomsState with _$ChatRoomsState {
  const factory ChatRoomsState.initial() = _Initial;
  const factory ChatRoomsState.loading() = _Loading;
  const factory ChatRoomsState.loaded(List<ChatRoom> chatRooms) = _Loaded;
  const factory ChatRoomsState.refreshing(List<ChatRoom> chatRooms) =
      _Refreshing;
  const factory ChatRoomsState.creatingChatRoom() = _CreatingChatRoom;
  const factory ChatRoomsState.chatRoomCreated(ChatRoom chatRoom) =
      _ChatRoomCreated;
  const factory ChatRoomsState.failure(String message) = _Failure;
}
