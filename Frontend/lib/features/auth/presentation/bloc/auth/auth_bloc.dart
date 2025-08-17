import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/entities/user.dart';

// Events
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String fullName;
  final String phone;
  final String userType;
  final String password1;
  final String password2;

  const RegisterEvent({
    required this.email,
    required this.fullName,
    required this.phone,
    required this.userType,
    required this.password1,
    required this.password2,
  });

  @override
  List<Object?> get props => [
    email,
    fullName,
    phone,
    userType,
    password1,
    password2,
  ];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LogoutEvent extends AuthEvent {}

// States
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;
  final String message;

  const AuthSuccess({required this.user, required this.message});

  @override
  List<Object?> get props => [user, message];
}

class RegisterSuccess extends AuthState {
  final User user;
  final String message;

  const RegisterSuccess({required this.user, required this.message});

  @override
  List<Object?> get props => [user, message];
}

class AuthFailure extends AuthState {
  final String errorMessage;

  const AuthFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

// BLoC
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await _authRepository.register(
      email: event.email,
      fullName: event.fullName,
      phone: event.phone,
      userType: event.userType,
      password1: event.password1,
      password2: event.password2,
    );

    result.fold(
      (failure) => emit(AuthFailure(errorMessage: failure.message)),
      (user) => emit(RegisterSuccess(user: user, message: 'تم التسجيل بنجاح')),
    );
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await _authRepository.login(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) => emit(AuthFailure(errorMessage: failure.message)),
      (user) => emit(AuthSuccess(user: user, message: 'تم تسجيل الدخول بنجاح')),
    );
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await _authRepository.logout();

    result.fold((failure) => emit(AuthFailure(errorMessage: failure.message)), (
      _,
    ) {
      emit(AuthInitial());
    });
  }
}
