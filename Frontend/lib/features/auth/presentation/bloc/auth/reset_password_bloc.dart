import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/repositories/auth_repository_impl.dart';

// Events
abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object?> get props => [];
}

class RequestPasswordResetEvent extends ResetPasswordEvent {
  final String email;

  const RequestPasswordResetEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class ConfirmPasswordResetEvent extends ResetPasswordEvent {
  final String email;
  final String otp;
  final String newPassword;
  final String confirmPassword;

  const ConfirmPasswordResetEvent({
    required this.email,
    required this.otp,
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [email, otp, newPassword, confirmPassword];
}

// States
abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object?> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordOtpSent extends ResetPasswordState {
  final String message;

  const ResetPasswordOtpSent({required this.message});

  @override
  List<Object?> get props => [message];
}

class ResetPasswordSuccess extends ResetPasswordState {
  final String message;

  const ResetPasswordSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class ResetPasswordFailure extends ResetPasswordState {
  final String errorMessage;

  const ResetPasswordFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

// BLoC
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthRepository _authRepository;

  ResetPasswordBloc(this._authRepository) : super(ResetPasswordInitial()) {
    on<RequestPasswordResetEvent>(_onRequestPasswordReset);
    on<ConfirmPasswordResetEvent>(_onConfirmPasswordReset);
  }

  Future<void> _onRequestPasswordReset(
    RequestPasswordResetEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(ResetPasswordLoading());
    
    try {
      final response = await _authRepository.requestPasswordReset(
        email: event.email,
      );

      emit(ResetPasswordOtpSent(
        message: response['message'] ?? 'تم إرسال رمز التحقق إلى بريدك الإلكتروني',
      ));
    } catch (e) {
      emit(ResetPasswordFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _onConfirmPasswordReset(
    ConfirmPasswordResetEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(ResetPasswordLoading());
    
    try {
      final response = await _authRepository.confirmPasswordReset(
        email: event.email,
        otp: event.otp,
        newPassword: event.newPassword,
        confirmPassword: event.confirmPassword,
      );

      emit(ResetPasswordSuccess(
        message: response['message'] ?? 'تم تغيير كلمة المرور بنجاح',
      ));
    } catch (e) {
      emit(ResetPasswordFailure(errorMessage: e.toString()));
    }
  }
}
