import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/language/app_localizations.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/storage/token_storage.dart';
import '../bloc/chat_rooms_bloc.dart';
import '../widgets/chat_room_card.dart';
import '../widgets/empty_chat_rooms.dart';

class ChatRoomsPage extends StatefulWidget {
  const ChatRoomsPage({super.key});

  @override
  State<ChatRoomsPage> createState() => _ChatRoomsPageState();
}

class _ChatRoomsPageState extends State<ChatRoomsPage> {
  int? _currentUserId;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
    context.read<ChatRoomsBloc>().add(const ChatRoomsEvent.loadChatRooms());
  }

  Future<void> _loadCurrentUser() async {
    final userId = await TokenStorage.getUserId();
    if (mounted) {
      setState(() {
        _currentUserId = userId;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('chat_rooms')),
        elevation: 0,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              context.go('/home');
            },
            icon: const Icon(Icons.home),
            tooltip: localizations.translate('back_to_home'),
          ),
        ],
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
      body: BlocConsumer<ChatRoomsBloc, ChatRoomsState>(
        listener: (context, state) {
          state.whenOrNull(
            failure: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
            chatRoomCreated: (chatRoom) {
              // Navigate to the chat room
              context.push('/chat/${chatRoom.id}', extra: chatRoom);
            },
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => _buildLoadingState(),
            loading: () => _buildLoadingState(),
            loaded: (chatRooms) => _buildLoadedState(chatRooms, localizations),
            refreshing:
                (chatRooms) => _buildLoadedState(
                  chatRooms,
                  localizations,
                  isRefreshing: true,
                ),
            creatingChatRoom: () => _buildLoadingState(),
            chatRoomCreated: (chatRoom) => _buildLoadingState(),
            failure: (message) => _buildErrorState(message, localizations),
          );
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildLoadedState(
    List<dynamic> chatRooms,
    AppLocalizations localizations, {
    bool isRefreshing = false,
  }) {
    if (chatRooms.isEmpty) {
      return EmptyChatRooms(
        onRefresh: () {
          context.read<ChatRoomsBloc>().add(
            const ChatRoomsEvent.refreshChatRooms(),
          );
        },
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<ChatRoomsBloc>().add(
          const ChatRoomsEvent.refreshChatRooms(),
        );
      },
      child: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            itemCount: chatRooms.length,
            itemBuilder: (context, index) {
              final chatRoom = chatRooms[index];
              return ChatRoomCard(
                chatRoom: chatRoom,
                currentUserId: _currentUserId ?? 0,
                onTap: () {
                  context.push('/chat/${chatRoom.id}', extra: chatRoom);
                },
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
              context.read<ChatRoomsBloc>().add(
                const ChatRoomsEvent.loadChatRooms(),
              );
            },
            child: Text(localizations.translate('retry')),
          ),
        ],
      ),
    );
  }
}
