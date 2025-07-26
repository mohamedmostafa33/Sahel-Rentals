import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/register_page.dart';
import '../features/auth/presentation/pages/forgot_password_page.dart';
import '../features/auth/presentation/pages/reset_password_confirm_page.dart';
import '../features/auth/presentation/pages/profile_page.dart';
import '../features/chalets/presentation/pages/chalets_page.dart';
import '../features/chalets/presentation/pages/chalet_detail_page.dart';
import '../shared/widgets/splash_screen.dart';

class RoutesConfig {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPasswordConfirm = '/reset-password-confirm';
  static const String home = '/home';
  static const String chalets = '/chalets';
  static const String chaletDetail = '/chalets/:id';
  static const String profile = '/profile';
  
  static final GoRouter router = GoRouter(
    initialLocation: splash,
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
      
      // Profile Route
      GoRoute(
        path: profile,
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),
    ],
    
    // Error handler
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
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
