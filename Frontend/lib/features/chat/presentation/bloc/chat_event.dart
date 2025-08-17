part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.loadMessages() = _LoadMessages;
  const factory ChatEvent.sendMessage(String content, {int? chaletId}) =
      _SendMessage;
  const factory ChatEvent.refreshMessages() = _RefreshMessages;
}
