part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;
  const factory ChatState.loading() = _Loading;
  const factory ChatState.loaded(ChatRoom chatRoom, List<Message> messages) =
      _Loaded;
  const factory ChatState.refreshing(
    ChatRoom chatRoom,
    List<Message> messages,
  ) = _Refreshing;
  const factory ChatState.sendingMessage(
    ChatRoom chatRoom,
    List<Message> messages,
  ) = _SendingMessage;
  const factory ChatState.sendMessageFailure(
    ChatRoom chatRoom,
    List<Message> messages,
    String error,
  ) = _SendMessageFailure;
  const factory ChatState.failure(String message) = _Failure;
}
