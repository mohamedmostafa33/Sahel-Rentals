import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, User>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String? phone,
  });
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, User>> getCurrentUser();
  Future<Either<Failure, bool>> isLoggedIn();
  
  // Profile methods
  Future<Either<Failure, User>> getUserProfile();
  Future<Either<Failure, User>> updateProfile({
    required String fullName,
    required String phone,
  });
  Future<Either<Failure, void>> deleteAccount();
}
