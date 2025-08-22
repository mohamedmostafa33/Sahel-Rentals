import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/reset_password_confirm_page.dart';
import '../../features/auth/presentation/pages/profile_page.dart';
import '../../features/auth/presentation/pages/welcome_profile_screen.dart';
import '../../features/auth/domain/entities/user.dart';
import '../../features/chalets/presentation/pages/chalet_browse_page.dart';
import '../../features/chalets/presentation/pages/chalet_detail_page.dart';
import '../../features/chalets/presentation/pages/chalet_management_page.dart';
import '../../features/chalets/presentation/pages/add_chalet_page.dart';
import '../../features/chalets/presentation/pages/edit_chalet_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/chat/presentation/pages/chat_rooms_page.dart';
import '../../features/chat/presentation/pages/chat_page.dart';
import '../../features/chat/presentation/bloc/chat_bloc.dart';
import '../../features/chat/domain/entities/chat_room.dart';
import '../../features/chat/domain/usecases/get_messages.dart';
import '../../features/chat/domain/usecases/send_message.dart';
import '../../features/chat/data/datasources/chat_remote_data_source.dart';
import '../../features/chat/data/repositories/chat_repository_impl.dart';
import '../../core/network/api_client.dart';
import '../../shared/widgets/splash_screen.dart';
import '../../core/storage/token_storage.dart';
import '../../features/favorites/presentation/pages/favorites_page.dart';
import '../../features/favorites/presentation/bloc/favorites_bloc.dart';
import '../../features/favorites/domain/usecases/get_favorites.dart';
import '../../features/favorites/domain/usecases/add_favorite.dart';
import '../../features/favorites/domain/usecases/remove_favorite.dart';
import '../../features/favorites/data/datasources/favorites_remote_data_source.dart';
import '../../features/favorites/data/repositories/favorites_repository_impl.dart';

class RoutesConfig {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPasswordConfirm = '/reset-password-confirm';
  static const String welcomeProfile = '/welcome-profile';
  static const String home = '/home';
  static const String chalets = '/chalets';
  static const String chaletDetail = '/chalets/:id';
  static const String chaletManagement = '/chalet-management';
  static const String addChalet = '/add-chalet';
  static const String editChalet = '/edit-chalet/:id';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String chatRooms = '/chat-rooms';
  static const String chat = '/chat/:id';
  static const String favorites = '/favorites';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    redirect: (context, state) async {
      final isLoggedIn = await TokenStorage.isLoggedIn();
      final isTokenExpired = await TokenStorage.isTokenExpired();

      // Public routes that don't require authentication
      const publicRoutes = [
        splash,
        login,
        register,
        forgotPassword,
        resetPasswordConfirm,
      ];

      final isPublicRoute =
          publicRoutes.contains(state.matchedLocation) ||
          state.matchedLocation.startsWith('/reset-password-confirm');

      // If user is not logged in or token is expired, redirect to login
      // unless they're already on a public route
      if ((!isLoggedIn || isTokenExpired) && !isPublicRoute) {
        return login;
      }

      // If user is logged in and on login page, redirect to home
      if (isLoggedIn && !isTokenExpired && state.matchedLocation == login) {
        return home;
      }

      // Allow navigation
      return null;
    },
    routes: [
      // Splash Screen
      GoRoute(
        path: splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // Auth Routes
      GoRoute(
        path: login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: register,
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: forgotPassword,
        name: 'forgotPassword',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: resetPasswordConfirm,
        name: 'resetPasswordConfirm',
        builder: (context, state) {
          final email = state.extra as String;
          return ResetPasswordConfirmPage(email: email);
        },
      ),

      // Welcome Profile Setup
      GoRoute(
        path: welcomeProfile,
        name: 'welcomeProfile',
        builder: (context, state) {
          final user = state.extra as User;
          return WelcomeProfileScreen(user: user);
        },
      ),

      // Main App Routes
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => const ChaletsPage(),
      ),
      GoRoute(
        path: chalets,
        name: 'chalets',
        builder: (context, state) => const ChaletsPage(),
      ),
      GoRoute(
        path: chaletDetail,
        name: 'chaletDetail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ChaletDetailPage(chaletId: int.parse(id));
        },
      ),

      // Chalet Management Route (for owners)
      GoRoute(
        path: chaletManagement,
        name: 'chaletManagement',
        builder: (context, state) => const ChaletManagementPage(),
      ),

      // Add Chalet Route
      GoRoute(
        path: addChalet,
        name: 'addChalet',
        builder: (context, state) => const AddChaletPage(),
      ),

      // Edit Chalet Route
      GoRoute(
        path: editChalet,
        name: 'editChalet',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return EditChaletPage(chaletId: int.parse(id));
        },
      ),

      // Profile Route
      GoRoute(
        path: profile,
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),

      // Favorites Route
      GoRoute(
        path: favorites,
        name: 'favorites',
        builder: (context, state) => const FavoritesPage(),
      ),

      // Settings Route
      GoRoute(
        path: settings,
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),

      // Chat Routes
      GoRoute(
        path: chatRooms,
        name: 'chatRooms',
        builder: (context, state) => const ChatRoomsPage(),
      ),
      GoRoute(
        path: chat,
        name: 'chat',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final chatRoom = state.extra as ChatRoom;

          return BlocProvider(
            create: (context) {
              final dataSource = ChatRemoteDataSource(ApiClient().dio);
              final repository = ChatRepositoryImpl(
                remoteDataSource: dataSource,
              );
              return ChatBloc(
                getMessages: GetMessages(repository),
                sendMessage: SendMessage(repository),
                chatRoom: chatRoom,
              );
            },
            child: ChatPage(chatRoom: chatRoom),
          );
        },
      ),
    ],

    // Error handler
    errorBuilder:
        (context, state) => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'صفحة غير موجودة',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'المسار: ${state.error}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.go(home),
                  child: const Text('العودة للرئيسية'),
                ),
              ],
            ),
          ),
        ),
  );
}
