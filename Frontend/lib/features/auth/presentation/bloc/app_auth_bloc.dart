import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/storage/token_storage.dart';

// Events
abstract class AppAuthEvent extends Equatable {
  const AppAuthEvent();

  @override
  List<Object?> get props => [];
}

class CheckAuthStatus extends AppAuthEvent {}

class AppLogout extends AppAuthEvent {}

// States
abstract class AppAuthState extends Equatable {
  const AppAuthState();

  @override
  List<Object?> get props => [];
}

class AppAuthLoading extends AppAuthState {}

class AppAuthenticated extends AppAuthState {
  final Map<String, String?> userInfo;

  const AppAuthenticated({required this.userInfo});

  @override
  List<Object?> get props => [userInfo];
}

class AppUnauthenticated extends AppAuthState {}

// BLoC
class AppAuthBloc extends Bloc<AppAuthEvent, AppAuthState> {
  AppAuthBloc() : super(AppAuthLoading()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<AppLogout>(_onAppLogout);
  }

  Future<void> _onCheckAuthStatus(CheckAuthStatus event, Emitter<AppAuthState> emit) async {
    emit(AppAuthLoading());
    
    try {
      final isLoggedIn = await TokenStorage.isLoggedIn();
      
      if (isLoggedIn && !await TokenStorage.isTokenExpired()) {
        final userInfo = await TokenStorage.getUserInfo();
        emit(AppAuthenticated(userInfo: userInfo));
      } else {
        // Clear expired tokens
        await TokenStorage.clearTokens();
        emit(AppUnauthenticated());
      }
    } catch (e) {
      emit(AppUnauthenticated());
    }
  }

  Future<void> _onAppLogout(AppLogout event, Emitter<AppAuthState> emit) async {
    await TokenStorage.clearTokens();
    emit(AppUnauthenticated());
  }
}
