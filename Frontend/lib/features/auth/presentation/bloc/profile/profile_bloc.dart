import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/entities/user.dart';

// Events
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final String fullName;
  final String phone;

  const UpdateProfileEvent({
    required this.fullName,
    required this.phone,
  });

  @override
  List<Object?> get props => [fullName, phone];
}

class DeleteAccountEvent extends ProfileEvent {}

class LogoutEvent extends ProfileEvent {}

// States
abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final User user;

  const ProfileLoaded({required this.user});

  @override
  List<Object?> get props => [user];
}

class ProfileUpdated extends ProfileState {
  final User user;
  final String message;

  const ProfileUpdated({
    required this.user,
    required this.message,
  });

  @override
  List<Object?> get props => [user, message];
}

class ProfileDeleted extends ProfileState {
  final String message;

  const ProfileDeleted({required this.message});

  @override
  List<Object?> get props => [message];
}

class ProfileLoggedOut extends ProfileState {}

class ProfileFailure extends ProfileState {
  final String errorMessage;

  const ProfileFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

// BLoC
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepository _authRepository;

  ProfileBloc(this._authRepository) : super(ProfileInitial()) {
    on<LoadProfileEvent>(_onLoadProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
    on<DeleteAccountEvent>(_onDeleteAccount);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLoadProfile(
    LoadProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    
    final result = await _authRepository.getUserProfile();
    
    result.fold(
      (failure) {
        print('❌ ProfileBloc - Error: ${failure.message}');
        emit(ProfileFailure(errorMessage: failure.message));
      },
      (user) {
        print('🎯 ProfileBloc - User loaded: ${user.fullName}, ${user.email}, ${user.phone}, ${user.accountType}');
        emit(ProfileLoaded(user: user));
      },
    );
  }

  Future<void> _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    
    final result = await _authRepository.updateProfile(
      fullName: event.fullName,
      phone: event.phone,
    );

    result.fold(
      (failure) => emit(ProfileFailure(errorMessage: failure.message)),
      (user) => emit(ProfileUpdated(
        user: user,
        message: 'تم تحديث البيانات بنجاح',
      )),
    );
  }

  Future<void> _onDeleteAccount(
    DeleteAccountEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    
    print('🗑️ Starting account deletion...');
    final result = await _authRepository.deleteAccount();
    
    result.fold(
      (failure) {
        print('❌ Account deletion failed: ${failure.message}');
        emit(ProfileFailure(errorMessage: 'فشل في حذف الحساب: ${failure.message}'));
      },
      (_) {
        print('✅ Account deleted successfully');
        emit(ProfileDeleted(
          message: 'تم حذف الحساب بنجاح',
        ));
      },
    );
  }

  Future<void> _onLogout(
    LogoutEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    
    print('🚪 Starting logout...');
    final result = await _authRepository.logout();
    
    result.fold(
      (failure) {
        print('❌ Logout failed: ${failure.message}');
        // Even if API fails, treat as successful logout
        emit(ProfileLoggedOut());
      },
      (_) {
        print('✅ Logout successful');
        emit(ProfileLoggedOut());
      },
    );
  }
}
