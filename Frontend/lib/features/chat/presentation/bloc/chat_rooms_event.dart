part of 'chat_rooms_bloc.dart';

@freezed
class ChatRoomsEvent with _$ChatRoomsEvent {
  const factory ChatRoomsEvent.loadChatRooms() = _LoadChatRooms;
  const factory ChatRoomsEvent.createOrGetChatRoom({
    int? chaletId,
    int? ownerId,
  }) = _CreateOrGetChatRoom;
  const factory ChatRoomsEvent.refreshChatRooms() = _RefreshChatRooms;
}
