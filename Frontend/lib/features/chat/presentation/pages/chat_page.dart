import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/language/app_localizations.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/storage/token_storage.dart';
import '../../domain/entities/chat_room.dart';
import '../bloc/chat_bloc.dart';
import '../widgets/message_bubble.dart';
import '../widgets/message_input.dart';

class ChatPage extends StatefulWidget {
  final ChatRoom chatRoom;

  const ChatPage({super.key, required this.chatRoom});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  int? _currentUserId;

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }

  Future<void> _initializeChat() async {
    await _loadCurrentUser();
    if (mounted) {
      context.read<ChatBloc>().add(const ChatEvent.loadMessages());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _loadCurrentUser() async {
    final userId = await TokenStorage.getUserId();
    if (mounted) {
      setState(() {
        _currentUserId = userId;
      });
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _sendMessage() {
    final content = _messageController.text.trim();
    if (content.isNotEmpty) {
      context.read<ChatBloc>().add(
        ChatEvent.sendMessage(
          content,
          chaletId: widget.chatRoom.lastChalet?.id,
        ),
      );
      _messageController.clear();
      _scrollToBottom();
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final otherParticipant = widget.chatRoom.getOtherParticipant(
      _currentUserId ?? 0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              otherParticipant.fullName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (widget.chatRoom.lastChalet != null)
              Text(
                widget.chatRoom.lastChalet!.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
          ],
        ),
        elevation: 0,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1E88E5), Color(0xFF1565C0)],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatBloc, ChatState>(
              listener: (context, state) {
                state.whenOrNull(
                  loaded: (chatRoom, messages) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _scrollToBottom();
                    });
                  },
                  sendMessageFailure: (chatRoom, messages, error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(error),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  failure: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.when(
                  initial: () => _buildLoadingState(),
                  loading: () => _buildLoadingState(),
                  loaded: (chatRoom, messages) => _buildMessagesList(messages),
                  refreshing:
                      (chatRoom, messages) =>
                          _buildMessagesList(messages, isRefreshing: true),
                  sendingMessage:
                      (chatRoom, messages) => _buildMessagesList(messages),
                  sendMessageFailure:
                      (chatRoom, messages, error) =>
                          _buildMessagesList(messages),
                  failure:
                      (message) => _buildErrorState(message, localizations),
                );
              },
            ),
          ),
          MessageInput(
            controller: _messageController,
            onSend: _sendMessage,
            onRefresh: () {
              context.read<ChatBloc>().add(const ChatEvent.refreshMessages());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildMessagesList(
    List<dynamic> messages, {
    bool isRefreshing = false,
  }) {
    if (messages.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Text(
              AppLocalizations.of(context)!.translate('no_messages_yet'),
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<ChatBloc>().add(const ChatEvent.refreshMessages());
      },
      child: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            reverse: true,
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              final isFromCurrentUser =
                  _currentUserId != null && message.sender.id == _currentUserId;
              return MessageBubble(
                message: message,
                isFromCurrentUser: isFromCurrentUser,
              );
            },
          ),
          if (isRefreshing)
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(),
            ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message, AppLocalizations localizations) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
          const SizedBox(height: AppConstants.defaultPadding),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppConstants.defaultPadding),
          ElevatedButton(
            onPressed: () {
              context.read<ChatBloc>().add(const ChatEvent.loadMessages());
            },
            child: Text(localizations.translate('retry')),
          ),
        ],
      ),
    );
  }
}
