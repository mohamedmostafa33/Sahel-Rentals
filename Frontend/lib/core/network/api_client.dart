import 'package:dio/dio.dart';
import '../constants/api_constants.dart';
import '../storage/token_storage.dart';

class ApiClient {
  late final Dio _dio;

  // Endpoints that don't require authentication
  static const List<String> _publicEndpoints = [
    '/api/accounts/login/',
    '/api/accounts/register/',
    '/api/accounts/refresh/',
    '/api/accounts/reset-password/',
    '/api/accounts/reset-password-confirm/',
    '/api/chalets/browse/',
  ];

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(
          milliseconds: ApiConstants.connectionTimeout,
        ),
        receiveTimeout: const Duration(
          milliseconds: ApiConstants.receiveTimeout,
        ),
        headers: ApiConstants.defaultHeaders,
      ),
    );

    _initializeInterceptors();
  }

  // Getter to access the Dio instance for external use
  Dio get dio => _dio;

  void _initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Only add auth token for protected endpoints
          final isPublicEndpoint = _publicEndpoints.any(
            (endpoint) => options.path.contains(endpoint),
          );

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
          print(
            '✅ RESPONSE: ${response.statusCode} from ${response.requestOptions.uri}',
          );
          print('📥 Data: ${response.data}');
          handler.next(response);
        },
        onError: (error, handler) async {
          print('❌ ERROR: ${error.type} - ${error.message}');
          print('📍 URL: ${error.requestOptions.uri}');
          print(
            '🔍 Error Details: ${error.response?.data ?? 'No additional details'}',
          );

          // Handle token expiration with refresh
          if (error.response?.statusCode == 401 &&
              error.response?.data != null &&
              error.response!.data.toString().contains('token_not_valid')) {
            print('🔄 Token expired, trying to refresh...');

            // Try to refresh token
            final refreshed = await _refreshToken();

            if (refreshed) {
              // Retry the original request with new token
              print('✅ Token refreshed, retrying request...');

              final options = error.requestOptions;
              final newToken = await TokenStorage.getAccessToken();
              if (newToken != null) {
                options.headers['Authorization'] = 'Bearer $newToken';
              }

              try {
                final response = await _dio.fetch(options);
                handler.resolve(response);
                return;
              } catch (e) {
                print('❌ Retry failed: $e');
              }
            } else {
              print('❌ Token refresh failed, clearing tokens...');
              await TokenStorage.clearTokens();
            }
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

  // Token refresh method
  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await TokenStorage.getRefreshToken();
      if (refreshToken == null) {
        print('❌ No refresh token available');
        return false;
      }

      print('🔄 Refreshing token with: ${refreshToken.substring(0, 20)}...');

      final response = await _dio.post(
        ApiConstants.refreshToken,
        data: {'refresh': refreshToken},
        options: Options(headers: ApiConstants.defaultHeaders),
      );

      if (response.statusCode == 200) {
        final newAccessToken = response.data['access'];

        // Save new access token
        await TokenStorage.saveAccessToken(newAccessToken);

        print('✅ Token refreshed successfully');
        return true;
      }

      return false;
    } catch (e) {
      print('❌ Token refresh failed: $e');
      return false;
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
