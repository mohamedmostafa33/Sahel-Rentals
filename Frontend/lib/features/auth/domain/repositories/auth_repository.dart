import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> register({
    required String email,
    required String fullName,
    required String phone,
    required String userType,
    required String password1,
    required String password2,
  });

  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, Map<String, dynamic>>> requestPasswordReset({
    required String email,
  });

  Future<Either<Failure, Map<String, dynamic>>> confirmPasswordReset({
    required String email,
    required String otp,
    required String newPassword,
    required String confirmPassword,
  });

  // Profile methods
  Future<Either<Failure, User>> getUserProfile();
  Future<Either<Failure, User>> updateProfile({
    required String fullName,
    required String phone,
  });
  Future<Either<Failure, void>> deleteAccount();

  // Profile Image methods
  Future<Either<Failure, String>> uploadProfileImage(File imageFile);
  Future<Either<Failure, void>> deleteProfileImage();
}
