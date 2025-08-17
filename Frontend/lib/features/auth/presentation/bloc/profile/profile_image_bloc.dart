import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/repositories/auth_repository.dart';

// Events
abstract class ProfileImageEvent extends Equatable {
  const ProfileImageEvent();

  @override
  List<Object?> get props => [];
}

class UploadProfileImageEvent extends ProfileImageEvent {
  final File imageFile;

  const UploadProfileImageEvent({required this.imageFile});

  @override
  List<Object?> get props => [imageFile];
}

class DeleteProfileImageEvent extends ProfileImageEvent {}

class LoadProfileImageEvent extends ProfileImageEvent {}

class ResetProfileImageEvent extends ProfileImageEvent {}

// States
abstract class ProfileImageState extends Equatable {
  const ProfileImageState();

  @override
  List<Object?> get props => [];
}

class ProfileImageInitial extends ProfileImageState {}

class ProfileImageLoading extends ProfileImageState {}

class ProfileImageUploading extends ProfileImageState {
  final double progress;

  const ProfileImageUploading({this.progress = 0.0});

  @override
  List<Object?> get props => [progress];
}

class ProfileImageLoaded extends ProfileImageState {
  final String? imageUrl;

  const ProfileImageLoaded({this.imageUrl});

  @override
  List<Object?> get props => [imageUrl];
}

class ProfileImageUploadSuccess extends ProfileImageState {
  final String imageUrl;
  final String message;

  const ProfileImageUploadSuccess({
    required this.imageUrl,
    required this.message,
  });

  @override
  List<Object?> get props => [imageUrl, message];
}

class ProfileImageDeleted extends ProfileImageState {
  final String message;

  const ProfileImageDeleted({required this.message});

  @override
  List<Object?> get props => [message];
}

class ProfileImageDeleteSuccess extends ProfileImageState {
  final String message;

  const ProfileImageDeleteSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class ProfileImageFailure extends ProfileImageState {
  final String message;

  const ProfileImageFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

// BLoC
class ProfileImageBloc extends Bloc<ProfileImageEvent, ProfileImageState> {
  final AuthRepository _authRepository;

  ProfileImageBloc(this._authRepository) : super(ProfileImageInitial()) {
    on<UploadProfileImageEvent>(_onUploadProfileImage);
    on<DeleteProfileImageEvent>(_onDeleteProfileImage);
    on<LoadProfileImageEvent>(_onLoadProfileImage);
    on<ResetProfileImageEvent>(_onResetProfileImage);
  }

  Future<void> _onUploadProfileImage(
    UploadProfileImageEvent event,
    Emitter<ProfileImageState> emit,
  ) async {
    emit(const ProfileImageUploading(progress: 0.0));

    // Simulate progress for better UX
    emit(const ProfileImageUploading(progress: 0.3));

    final result = await _authRepository.uploadProfileImage(event.imageFile);

    emit(const ProfileImageUploading(progress: 0.8));

    result.fold(
      (failure) {
        print('❌ ProfileImageBloc - Upload failed: ${failure.message}');
        emit(
          ProfileImageFailure(message: 'فشل في رفع الصورة: ${failure.message}'),
        );
      },
      (imageUrl) {
        emit(
          ProfileImageUploadSuccess(
            imageUrl: imageUrl, // Now we have the actual image URL
            message: 'تم رفع الصورة بنجاح',
          ),
        );
      },
    );
  }

  Future<void> _onDeleteProfileImage(
    DeleteProfileImageEvent event,
    Emitter<ProfileImageState> emit,
  ) async {
    emit(ProfileImageLoading());

    final result = await _authRepository.deleteProfileImage();

    result.fold(
      (failure) {
        print('❌ ProfileImageBloc - Delete failed: ${failure.message}');
        emit(
          ProfileImageFailure(message: 'فشل في حذف الصورة: ${failure.message}'),
        );
      },
      (_) {
        emit(ProfileImageDeleted(message: 'تم حذف الصورة بنجاح'));
      },
    );
  }

  Future<void> _onLoadProfileImage(
    LoadProfileImageEvent event,
    Emitter<ProfileImageState> emit,
  ) async {
    emit(ProfileImageLoading());

    final result = await _authRepository.getUserProfile();

    result.fold(
      (failure) {
        print('❌ ProfileImageBloc - Load failed: ${failure.message}');
        emit(
          ProfileImageFailure(
            message: 'فشل في تحميل الصورة: ${failure.message}',
          ),
        );
      },
      (user) {
        emit(ProfileImageLoaded(imageUrl: user.profileImage));
      },
    );
  }

  void _onResetProfileImage(
    ResetProfileImageEvent event,
    Emitter<ProfileImageState> emit,
  ) {
    // Reset to initial state to clear any cached image data
    emit(ProfileImageInitial());
  }
}
