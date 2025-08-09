import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/app/app_config.dart';
import 'config/theme/theme_config.dart';
import 'config/routes/routes_config.dart';
import 'core/network/api_client.dart';
import 'core/language/language_bloc.dart';
import 'core/language/app_localizations.dart';
import 'core/storage/language_storage.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/data/services/auth_api_service.dart';
import 'features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth/reset_password_bloc.dart';
import 'features/auth/presentation/bloc/profile/profile_bloc.dart';
import 'features/auth/presentation/bloc/profile/profile_image_bloc.dart';
import 'features/auth/presentation/bloc/app/app_auth_bloc.dart';
import 'features/chalets/presentation/bloc/chalet_management_bloc.dart';
import 'features/chalets/presentation/bloc/chalet_browse_bloc.dart';
import 'features/chalets/data/services/chalet_api_service.dart';

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
        BlocProvider<LanguageBloc>(
          create: (context) => LanguageBloc(
            LanguageStorage(AppConfig.prefs),
          )..add(LoadLanguageEvent()),
        ),
        BlocProvider<AppAuthBloc>(
          create: (context) => AppAuthBloc()..add(CheckAuthStatus()),
        ),
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
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(
            AuthRepositoryImpl(
              AuthApiService(
                ApiClient(),
              ),
            ),
          ),
        ),
        BlocProvider<ProfileImageBloc>(
          create: (context) => ProfileImageBloc(
            AuthRepositoryImpl(
              AuthApiService(
                ApiClient(),
              ),
            ),
          ),
        ),
        BlocProvider<ChaletManagementBloc>(
          create: (context) => ChaletManagementBloc(
            ChaletRepository(
              ChaletApiService(
                ApiClient().dio,
              ),
            ),
          ),
        ),
        BlocProvider<ChaletBrowseBloc>(
          create: (context) => ChaletBrowseBloc(
            ChaletRepository(
              ChaletApiService(
                ApiClient().dio,
              ),
            ),
          ),
        ),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, languageState) {
          Locale currentLocale = const Locale('ar', 'EG');
          if (languageState is LanguageLoaded) {
            currentLocale = languageState.locale;
          }
          
          return MaterialApp.router(
            title: 'Sahel Rentals',
            debugShowCheckedModeBanner: false,
            theme: ThemeConfig.lightTheme,
            darkTheme: ThemeConfig.darkTheme,
            themeMode: ThemeMode.system,
            routerConfig: RoutesConfig.router,
            locale: currentLocale,
            supportedLocales: const [
              Locale('ar', 'EG'),
              Locale('en', 'US'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (context, child) {
              return Directionality(
                textDirection: currentLocale.languageCode == 'ar' 
                    ? TextDirection.rtl 
                    : TextDirection.ltr,
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
