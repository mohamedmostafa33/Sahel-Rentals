import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/repositories/auth_repository_impl.dart';

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
  }

  Future<void> _onUploadProfileImage(
    UploadProfileImageEvent event,
    Emitter<ProfileImageState> emit,
  ) async {
    emit(const ProfileImageUploading(progress: 0.0));
    
    try {
      // Simulate progress for better UX
      emit(const ProfileImageUploading(progress: 0.3));
      
      final response = await _authRepository.uploadProfileImage(event.imageFile);
      
      emit(const ProfileImageUploading(progress: 0.8));
      
      emit(ProfileImageUploadSuccess(
        imageUrl: response['profile_image_url'] ?? '',
        message: response['message'] ?? 'تم رفع الصورة بنجاح',
      ));
      
    } catch (e) {
      print('❌ ProfileImageBloc - Upload failed: $e');
      emit(ProfileImageFailure(
        message: 'فشل في رفع الصورة: ${e.toString()}',
      ));
    }
  }

  Future<void> _onDeleteProfileImage(
    DeleteProfileImageEvent event,
    Emitter<ProfileImageState> emit,
  ) async {
    emit(ProfileImageLoading());
    
    try {
      final response = await _authRepository.deleteProfileImage();
      
      emit(ProfileImageDeleted(
        message: response['message'] ?? 'تم حذف الصورة بنجاح',
      ));
      
    } catch (e) {
      print('❌ ProfileImageBloc - Delete failed: $e');
      emit(ProfileImageFailure(
        message: 'فشل في حذف الصورة: ${e.toString()}',
      ));
    }
  }

  Future<void> _onLoadProfileImage(
    LoadProfileImageEvent event,
    Emitter<ProfileImageState> emit,
  ) async {
    emit(ProfileImageLoading());
    
    try {
      // Get current user profile which includes image URL
      final user = await _authRepository.getUserProfile();
      
      emit(ProfileImageLoaded(imageUrl: user.profileImageUrl));
      
    } catch (e) {
      print('❌ ProfileImageBloc - Load failed: $e');
      emit(ProfileImageFailure(
        message: 'فشل في تحميل الصورة: ${e.toString()}',
      ));
    }
  }
}
