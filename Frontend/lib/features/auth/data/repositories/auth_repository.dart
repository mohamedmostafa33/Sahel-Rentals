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
}
