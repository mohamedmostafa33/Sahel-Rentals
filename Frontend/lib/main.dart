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
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth/reset_password_bloc.dart';
import 'features/auth/presentation/bloc/profile/profile_bloc.dart';
import 'features/auth/presentation/bloc/profile/profile_image_bloc.dart';
import 'features/auth/presentation/bloc/app/app_auth_bloc.dart';
import 'features/chalets/presentation/bloc/chalet_management_bloc.dart';
import 'features/chalets/presentation/bloc/chalet_browse_bloc.dart';
import 'features/chalets/data/datasources/chalet_remote_data_source.dart';
import 'features/chalets/data/repositories/chalet_repository_impl.dart';
import 'features/chalets/domain/usecases/get_owner_chalets.dart';
import 'features/chalets/domain/usecases/get_chalet_details.dart';
import 'features/chalets/domain/usecases/create_chalet.dart' as UseCases;
import 'features/chalets/domain/usecases/update_chalet.dart' as UseCases;
import 'features/chalets/domain/usecases/delete_chalet.dart' as UseCases;
import 'features/chalets/domain/usecases/get_public_chalets.dart';
import 'features/chalets/domain/usecases/get_public_chalet_details.dart';
import 'features/chalets/domain/usecases/search_public_chalets.dart';
import 'features/chat/presentation/bloc/chat_rooms_bloc.dart';
import 'features/chat/domain/usecases/get_chat_rooms.dart';
import 'features/chat/domain/usecases/create_or_get_chat_room.dart';
import 'features/chat/data/datasources/chat_remote_data_source.dart';
import 'features/chat/data/repositories/chat_repository_impl.dart';
import 'features/favorites/presentation/bloc/favorites_bloc.dart';
import 'features/favorites/data/datasources/favorites_remote_data_source.dart';
import 'features/favorites/data/repositories/favorites_repository_impl.dart';
import 'features/favorites/domain/usecases/get_favorites.dart';
import 'features/favorites/domain/usecases/add_favorite.dart';
import 'features/favorites/domain/usecases/remove_favorite.dart';

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
          create:
              (context) =>
                  LanguageBloc(LanguageStorage(AppConfig.prefs))
                    ..add(LoadLanguageEvent()),
        ),
        BlocProvider<AppAuthBloc>(
          create: (context) => AppAuthBloc()..add(CheckAuthStatus()),
        ),
        BlocProvider<AuthBloc>(
          create:
              (context) => AuthBloc(
                AuthRepositoryImpl(AuthRemoteDataSourceImpl(ApiClient())),
              ),
        ),
        BlocProvider<ResetPasswordBloc>(
          create:
              (context) => ResetPasswordBloc(
                AuthRepositoryImpl(AuthRemoteDataSourceImpl(ApiClient())),
              ),
        ),
        BlocProvider<ProfileBloc>(
          create:
              (context) => ProfileBloc(
                AuthRepositoryImpl(AuthRemoteDataSourceImpl(ApiClient())),
              ),
        ),
        BlocProvider<ProfileImageBloc>(
          create:
              (context) => ProfileImageBloc(
                AuthRepositoryImpl(AuthRemoteDataSourceImpl(ApiClient())),
              ),
        ),
        BlocProvider<ChaletManagementBloc>(
          create: (context) {
            final dataSource = ChaletRemoteDataSource(ApiClient().dio);
            final repository = ChaletRepositoryImpl(dataSource);
            return ChaletManagementBloc(
              getOwnerChalets: GetOwnerChalets(repository),
              getChaletDetails: GetChaletDetails(repository),
              createChalet: UseCases.CreateChalet(repository),
              updateChalet: UseCases.UpdateChalet(repository),
              deleteChalet: UseCases.DeleteChalet(repository),
              chaletRepository: repository,
            );
          },
        ),
        BlocProvider<ChaletBrowseBloc>(
          create: (context) {
            final dataSource = ChaletRemoteDataSource(ApiClient().dio);
            final repository = ChaletRepositoryImpl(dataSource);
            return ChaletBrowseBloc(
              getPublicChalets: GetPublicChalets(repository),
              getPublicChaletDetails: GetPublicChaletDetails(repository),
              searchPublicChalets: SearchPublicChalets(repository),
            );
          },
        ),
        BlocProvider<ChatRoomsBloc>(
          create: (context) {
            final dataSource = ChatRemoteDataSource(ApiClient().dio);
            final repository = ChatRepositoryImpl(remoteDataSource: dataSource);
            return ChatRoomsBloc(
              getChatRooms: GetChatRooms(repository),
              createOrGetChatRoom: CreateOrGetChatRoom(repository),
            );
          },
        ),
        BlocProvider<FavoritesBloc>(
          create: (context) {
            final ds = FavoritesRemoteDataSource(ApiClient().dio);
            final repo = FavoritesRepositoryImpl(remoteDataSource: ds);
            return FavoritesBloc(
              getFavorites: GetFavorites(repo),
              addFavorite: AddFavorite(repo),
              removeFavorite: RemoveFavorite(repo),
            )..add(LoadFavoritesEvent());
          },
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
            supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (context, child) {
              return Directionality(
                textDirection:
                    currentLocale.languageCode == 'ar'
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
