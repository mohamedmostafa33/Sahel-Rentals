import '../services/auth_api_service.dart';
import '../models/auth_models.dart';

abstract class AuthRepository {
  Future<AuthResponse> register({
    required String email,
    required String fullName,
    required String phone,
    required String userType,
    required String password1,
    required String password2,
  });

  Future<AuthResponse> login({
    required String email,
    required String password,
  });

  Future<Map<String, dynamic>> requestPasswordReset({
    required String email,
  });

  Future<Map<String, dynamic>> confirmPasswordReset({
    required String email,
    required String otp,
    required String newPassword,
    required String confirmPassword,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<AuthResponse> register({
    required String email,
    required String fullName,
    required String phone,
    required String userType,
    required String password1,
    required String password2,
  }) async {
    return await _authApiService.register(
      email: email,
      fullName: fullName,
      phone: phone,
      userType: userType,
      password1: password1,
      password2: password2,
    );
  }

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    return await _authApiService.login(
      email: email,
      password: password,
    );
  }

  @override
  Future<Map<String, dynamic>> requestPasswordReset({
    required String email,
  }) async {
    return await _authApiService.requestPasswordReset(email: email);
  }

  @override
  Future<Map<String, dynamic>> confirmPasswordReset({
    required String email,
    required String otp,
    required String newPassword,
    required String confirmPassword,
  }) async {
    return await _authApiService.confirmPasswordReset(
      email: email,
      otp: otp,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
  }
}
