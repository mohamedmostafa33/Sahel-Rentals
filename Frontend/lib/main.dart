import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/app_config.dart';
import 'config/theme_config.dart';
import 'config/routes_config.dart';
import 'core/network/api_client.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'features/auth/data/services/auth_api_service.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/reset_password_bloc.dart';
// import 'core/utils/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize app configuration
  await AppConfig.init();
  
  // Set up BLoC observer for debugging (commented out for now)
  // Bloc.observer = AppBlocObserver();
  
  runApp(const SahelRentalsApp());
}

class SahelRentalsApp extends StatelessWidget {
  const SahelRentalsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            AuthRepositoryImpl(
              AuthApiService(
                ApiClient(),
              ),
            ),
          ),
        ),
        BlocProvider<ResetPasswordBloc>(
          create: (context) => ResetPasswordBloc(
            AuthRepositoryImpl(
              AuthApiService(
                ApiClient(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Sahel Rentals',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.lightTheme,
        darkTheme: ThemeConfig.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: RoutesConfig.router,
        // Add Arabic RTL support
        locale: const Locale('ar', 'EG'),
        supportedLocales: const [
          Locale('ar', 'EG'),
          Locale('en', 'US'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
      ),
    );
  }
}
