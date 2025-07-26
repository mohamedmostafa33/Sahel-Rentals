import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
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
      print('📍 URL: ${ApiEndpoints.baseUrl}${ApiEndpoints.register}');
      
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
        ApiEndpoints.register,
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
        ApiEndpoints.login,
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
