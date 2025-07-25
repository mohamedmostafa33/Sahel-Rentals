import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/auth_models.dart';

class AuthApiService {
  final ApiClient _apiClient;

  AuthApiService(this._apiClient);

  Future<AuthResponse> register({
    required String email,
    required String fullName,
    required String phone,
    required String userType,
    required String password1,
    required String password2,
  }) async {
    try {
      print('🚀 Starting register request...');
      print('📍 URL: ${ApiConstants.baseUrl}${ApiConstants.register}');
      
      final requestData = {
        'email': email,
        'full_name': fullName,
        'phone': phone.isEmpty ? null : phone,
        'user_type': userType,
        'password1': password1,
        'password2': password2,
      };
      
      print('📝 Request data: $requestData');
      
      final response = await _apiClient.post(
        ApiConstants.register,
        data: requestData,
      );

      print('✅ Response received: ${response.data}');
      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      print('❌ API Error: ${e.message}');
      print('❌ Error response: ${e.response?.data}');
      throw _handleApiError(e);
    } catch (e) {
      print('❌ Unexpected error: $e');
      rethrow;
    }
  }

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  Future<Map<String, dynamic>> requestPasswordReset({
    required String email,
  }) async {
    try {
      print('🔄 Requesting password reset for: $email');
      
      final response = await _apiClient.post(
        ApiConstants.resetPasswordRequest,
        data: {
          'email': email,
        },
      );

      print('✅ Password reset request successful: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      print('❌ Password reset request failed: ${e.message}');
      throw _handleApiError(e);
    }
  }

  Future<Map<String, dynamic>> confirmPasswordReset({
    required String email,
    required String otp,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      print('🔄 Confirming password reset for: $email');
      print('🔐 OTP: $otp');
      
      final response = await _apiClient.post(
        ApiConstants.resetPasswordConfirm,
        data: {
          'email': email,
          'otp': otp,
          'new_password': newPassword,
          'confirm_password': confirmPassword,
        },
      );

      print('✅ Password reset confirmed: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      print('❌ Password reset confirmation failed: ${e.message}');
      throw _handleApiError(e);
    }
  }

  String _handleApiError(DioException e) {
    if (e.response?.statusCode == 400) {
      final errors = e.response?.data;
      if (errors is Map<String, dynamic>) {
        // Extract first error message
        for (final field in errors.keys) {
          if (errors[field] is List && errors[field].isNotEmpty) {
            return errors[field][0].toString();
          }
        }
      }
      return 'خطأ في البيانات المدخلة';
    } else if (e.response?.statusCode == 500) {
      return 'خطأ في الخادم، يرجى المحاولة لاحقاً';
    } else if (e.type == DioExceptionType.connectionTimeout) {
      return 'انتهت مهلة الاتصال';
    } else if (e.type == DioExceptionType.connectionError) {
      return 'لا يوجد اتصال بالإنترنت';
    }
    return 'حدث خطأ غير متوقع';
  }
}
