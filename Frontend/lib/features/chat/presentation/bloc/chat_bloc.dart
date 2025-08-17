import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/message.dart';
import '../../domain/entities/chat_room.dart';
import '../../domain/usecases/get_messages.dart';
import '../../domain/usecases/send_message.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetMessages _getMessages;
  final SendMessage _sendMessage;
  late final ChatRoom _chatRoom;

  ChatBloc({
    required GetMessages getMessages,
    required SendMessage sendMessage,
    required ChatRoom chatRoom,
  }) : _getMessages = getMessages,
       _sendMessage = sendMessage,
       _chatRoom = chatRoom,
       super(const ChatState.initial()) {
    on<ChatEvent>((event, emit) async {
      await event.when(
        loadMessages: () => _onLoadMessages(emit),
        sendMessage:
            (content, chaletId) => _onSendMessage(emit, content, chaletId),
        refreshMessages: () => _onRefreshMessages(emit),
      );
    });
  }

  ChatRoom get chatRoom => _chatRoom;

  Future<void> _onLoadMessages(Emitter<ChatState> emit) async {
    emit(const ChatState.loading());

    final result = await _getMessages(
      GetMessagesParams(chatRoomId: _chatRoom.id),
    );

    result.fold(
      (failure) {
        print('❌ ChatBloc: Failed to load messages: ${failure.message}');
        emit(ChatState.failure(failure.message));
      },
      (messages) {
        print('✅ ChatBloc: Loaded ${messages.length} messages');
        for (int i = 0; i < messages.length; i++) {
          final msg = messages[i];
          print(
            '  Message $i: sender=${msg.sender.fullName}, profileImage="${msg.sender.profileImage}"',
          );
        }
        emit(ChatState.loaded(_chatRoom, messages));
      },
    );
  }

  Future<void> _onSendMessage(
    Emitter<ChatState> emit,
    String content,
    int? chaletId,
  ) async {
    final currentState = state;
    if (currentState is _Loaded) {
      emit(ChatState.sendingMessage(_chatRoom, currentState.messages));
    }

    final result = await _sendMessage(
      SendMessageParams(
        chatRoomId: _chatRoom.id,
        content: content,
        chaletId: chaletId,
      ),
    );

    result.fold(
      (failure) {
        print('❌ ChatBloc: Failed to send message: ${failure.message}');
        if (currentState is _Loaded) {
          emit(
            ChatState.sendMessageFailure(
              _chatRoom,
              currentState.messages,
              failure.message,
            ),
          );
        } else {
          emit(ChatState.failure(failure.message));
        }
      },
      (message) {
        print('✅ ChatBloc: Message sent successfully');
        print(
          '  New message sender: ${message.sender.fullName}, profileImage: "${message.sender.profileImage}"',
        );
        if (currentState is _Loaded) {
          final updatedMessages = [message, ...currentState.messages];
          emit(ChatState.loaded(_chatRoom, updatedMessages));
        } else {
          // Reload messages if we don't have current state
          add(const ChatEvent.loadMessages());
        }
      },
    );
  }

  Future<void> _onRefreshMessages(Emitter<ChatState> emit) async {
    final currentState = state;
    if (currentState is _Loaded) {
      emit(ChatState.refreshing(_chatRoom, currentState.messages));
    }

    final result = await _getMessages(
      GetMessagesParams(chatRoomId: _chatRoom.id),
    );

    result.fold(
      (failure) => emit(ChatState.failure(failure.message)),
      (messages) => emit(ChatState.loaded(_chatRoom, messages)),
    );
  }
}
