import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/models/auth_models.dart';
import '../../../../core/storage/token_storage.dart';

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
  final UserModel user;

  const ProfileLoaded({required this.user});

  @override
  List<Object?> get props => [user];
}

class ProfileUpdated extends ProfileState {
  final UserModel user;
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
    
    try {
      final user = await _authRepository.getUserProfile();
      print('🎯 ProfileBloc - User loaded: ${user.fullName}, ${user.email}, ${user.phone}, ${user.accountType}');
      emit(ProfileLoaded(user: user));
    } catch (e) {
      print('❌ ProfileBloc - Error: $e');
      emit(ProfileFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    
    try {
      final user = await _authRepository.updateProfile(
        fullName: event.fullName,
        phone: event.phone,
      );

      emit(ProfileUpdated(
        user: user,
        message: 'تم تحديث البيانات بنجاح',
      ));
    } catch (e) {
      emit(ProfileFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _onDeleteAccount(
    DeleteAccountEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    
    try {
      await _authRepository.deleteAccount();
      await TokenStorage.clearTokens();
      
      emit(const ProfileDeleted(
        message: 'تم حذف الحساب بنجاح',
      ));
    } catch (e) {
      emit(ProfileFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _onLogout(
    LogoutEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      await TokenStorage.clearTokens();
      // TODO: Call logout API if needed
      emit(ProfileLoggedOut());
    } catch (e) {
      emit(ProfileFailure(errorMessage: e.toString()));
    }
  }
}
