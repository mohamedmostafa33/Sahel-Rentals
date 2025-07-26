import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/api_constants.dart';
import '../storage/token_storage.dart';

class ApiClient {
  late final Dio _dio;
  
  // Endpoints that don't require authentication
  static const List<String> _publicEndpoints = [
    '/api/accounts/login/',
    '/api/accounts/register/',
    '/api/accounts/reset-password/',
    '/api/accounts/reset-password-confirm/',
  ];
  
  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(milliseconds: ApiConstants.connectionTimeout),
        receiveTimeout: const Duration(milliseconds: ApiConstants.receiveTimeout),
        headers: ApiConstants.defaultHeaders,
      ),
    );
    
    _initializeInterceptors();
  }
  
  void _initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Only add auth token for protected endpoints
          final isPublicEndpoint = _publicEndpoints.any((endpoint) => 
            options.path.contains(endpoint));
          
          if (!isPublicEndpoint) {
            final token = await TokenStorage.getAccessToken();
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }
          
          print('🚀 REQUEST: ${options.method} ${options.uri}');
          print('📤 Headers: ${options.headers}');
          print('📤 Data: ${options.data}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          print('✅ RESPONSE: ${response.statusCode} from ${response.requestOptions.uri}');
          print('📥 Data: ${response.data}');
          handler.next(response);
        },
        onError: (error, handler) async {
          print('❌ ERROR: ${error.type} - ${error.message}');
          print('📍 URL: ${error.requestOptions.uri}');
          print('🔍 Error Details: ${error.response?.data ?? 'No additional details'}');
          
          // Handle token expiration
          if (error.response?.statusCode == 401 && 
              error.response?.data != null &&
              error.response!.data.toString().contains('token_not_valid')) {
            print('🔄 Token expired, clearing tokens...');
            await TokenStorage.clearTokens();
          }
          
          if (error.type == DioExceptionType.connectionTimeout) {
            print('🕐 Connection Timeout - Check if server is running');
          } else if (error.type == DioExceptionType.connectionError) {
            print('🔌 Connection Error - Check IP and port');
          }
          handler.next(error);
        },
      ),
    );
  }
  
  // GET request
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }
  
  // POST request
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }
  
  // PUT request
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }
  
  // DELETE request
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }
  
  // Set authorization token (for backwards compatibility)
  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }
  
  // Remove authorization token
  void removeAuthToken() {
    _dio.options.headers.remove('Authorization');
  }
}
