import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;
  
  RegisterUseCase(this.repository);
  
  Future<Either<Failure, User>> call(RegisterParams params) async {
    return await repository.register(
      email: params.email,
      fullName: params.fullName,
      phone: params.phone,
      userType: params.userType,
      password1: params.password1,
      password2: params.password2,
    );
  }
}

class RegisterParams {
  final String email;
  final String fullName;
  final String phone;
  final String userType;
  final String password1;
  final String password2;
  
  RegisterParams({
    required this.email,
    required this.fullName,
    required this.phone,
    required this.userType,
    required this.password1,
    required this.password2,
  });
}
