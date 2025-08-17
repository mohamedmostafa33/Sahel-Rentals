import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/storage/token_storage.dart';
import '../models/auth_models.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> register({
    required String email,
    required String fullName,
    required String phone,
    required String userType,
    required String password1,
    required String password2,
  });

  Future<AuthResponse> login({required String email, required String password});

  Future<Map<String, dynamic>> logout();

  Future<Map<String, dynamic>> requestPasswordReset({required String email});

  Future<Map<String, dynamic>> confirmPasswordReset({
    required String email,
    required String otp,
    required String newPassword,
    required String confirmPassword,
  });

  // Profile methods
  Future<UserModel> getUserProfile();
  Future<UserModel> updateProfile({
    required String fullName,
    required String phone,
  });
  Future<Map<String, dynamic>> deleteAccount();

  // Profile Image methods
  Future<Map<String, dynamic>> uploadProfileImage(File imageFile);
  Future<Map<String, dynamic>> deleteProfileImage();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
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

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.login,
        data: {'email': email, 'password': password},
      );

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> logout() async {
    try {
      print('🚪 Logging out...');

      // Get refresh token
      final refreshToken = await TokenStorage.getRefreshToken();

      if (refreshToken == null) {
        print('⚠️ No refresh token found, proceeding with logout anyway');
        return {'message': 'تم تسجيل الخروج بنجاح'};
      }

      final response = await _apiClient.post(
        ApiConstants.logout,
        data: {'refresh': refreshToken},
      );

      print('✅ Logout successful: ${response.data}');
      return response.data ?? {'message': 'تم تسجيل الخروج بنجاح'};
    } on DioException catch (e) {
      print('❌ Logout failed: ${e.message}');
      throw _handleApiError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> requestPasswordReset({
    required String email,
  }) async {
    try {
      print('🔄 Requesting password reset for: $email');

      final response = await _apiClient.post(
        ApiConstants.resetPasswordRequest,
        data: {'email': email},
      );

      print('✅ Password reset request successful: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      print('❌ Password reset request failed: ${e.message}');
      throw _handleApiError(e);
    }
  }

  @override
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

  // Profile methods
  @override
  Future<UserModel> getUserProfile() async {
    try {
      print('🚀 Getting user profile...');

      final response = await _apiClient.get(ApiConstants.profile);

      print('✅ Profile loaded: ${response.data}');
      // Extract user object from response
      return UserModel.fromJson(response.data['user']);
    } on DioException catch (e) {
      print('❌ Get profile failed: ${e.message}');
      throw _handleApiError(e);
    }
  }

  @override
  Future<UserModel> updateProfile({
    required String fullName,
    required String phone,
  }) async {
    try {
      print('🚀 Updating profile...');

      final response = await _apiClient.put(
        ApiConstants.profile,
        data: {'full_name': fullName, 'phone': phone},
      );

      print('✅ Profile updated: ${response.data}');
      // Extract user object from response
      return UserModel.fromJson(response.data['user']);
    } on DioException catch (e) {
      print('❌ Update profile failed: ${e.message}');
      throw _handleApiError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> deleteAccount() async {
    try {
      print('🗑️ Deleting account...');

      final response = await _apiClient.delete(ApiConstants.deleteAccount);

      print('✅ Account deleted: ${response.data}');

      // Handle null response (204 No Content)
      if (response.data == null) {
        return {
          'message': 'تم حذف الحساب بنجاح',
          'detail': 'تم حذف جميع بياناتك نهائياً',
        };
      }

      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('❌ Delete account failed: ${e.message}');
      throw _handleApiError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> uploadProfileImage(File imageFile) async {
    try {
      print('📸 Uploading profile image...');

      String fileName = imageFile.path.split('/').last;
      FormData formData = FormData.fromMap({
        'profile_image': await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
      });

      final response = await _apiClient.post(
        ApiConstants.profileImage,
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      print('✅ Profile image uploaded: ${response.data}');
      return response.data ?? {'message': 'تم رفع الصورة بنجاح'};
    } on DioException catch (e) {
      print('❌ Upload profile image failed: ${e.message}');
      throw _handleApiError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> deleteProfileImage() async {
    try {
      print('🗑️ Deleting profile image...');

      final response = await _apiClient.delete(ApiConstants.profileImage);

      print('✅ Profile image deleted: ${response.data}');
      return response.data ?? {'message': 'تم حذف الصورة بنجاح'};
    } on DioException catch (e) {
      print('❌ Delete profile image failed: ${e.message}');
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
