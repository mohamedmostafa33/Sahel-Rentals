import 'package:dio/dio.dart';
import 'api_error.dart';

class ApiErrorHandler {
  static ApiError handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    }

    if (error is Exception) {
      return ApiError.unknown(message: error.toString());
    }

    return ApiError.unknown(message: 'An unexpected error occurred');
  }

  static ApiError _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ApiError.timeout();

      case DioExceptionType.connectionError:
        return const ApiError.network();

      case DioExceptionType.badResponse:
        return _handleResponseError(error);

      case DioExceptionType.cancel:
        return const ApiError(message: 'Request cancelled');

      default:
        return const ApiError.unknown();
    }
  }

  static ApiError _handleResponseError(DioException error) {
    final statusCode = error.response?.statusCode ?? 0;
    final data = error.response?.data;

    switch (statusCode) {
      case 400:
        return _handleValidationError(data);
      case 401:
        return const ApiError.unauthorized();
      case 403:
        return const ApiError(message: 'Access forbidden', statusCode: 403);
      case 404:
        return const ApiError(message: 'Resource not found', statusCode: 404);
      case 422:
        return _handleValidationError(data);
      case 500:
        return const ApiError.server();
      default:
        return ApiError(
          message: 'HTTP Error: $statusCode',
          statusCode: statusCode,
          data: data,
        );
    }
  }

  static ApiError _handleValidationError(dynamic data) {
    if (data is Map<String, dynamic>) {
      // Check for different validation error formats
      if (data.containsKey('errors')) {
        final errors = data['errors'] as Map<String, dynamic>?;
        final convertedErrors = <String, List<String>>{};

        errors?.forEach((key, value) {
          if (value is List) {
            convertedErrors[key] = value.map((e) => e.toString()).toList();
          } else {
            convertedErrors[key] = [value.toString()];
          }
        });

        return ApiError.validation(
          message: data['message']?.toString() ?? 'Validation failed',
          errors: convertedErrors,
        );
      }

      if (data.containsKey('message')) {
        return ApiError.validation(message: data['message'].toString());
      }

      // Handle field-specific errors
      final fieldErrors = <String, List<String>>{};
      data.forEach((key, value) {
        if (value is List) {
          fieldErrors[key] = value.map((e) => e.toString()).toList();
        } else {
          fieldErrors[key] = [value.toString()];
        }
      });

      if (fieldErrors.isNotEmpty) {
        return ApiError.validation(errors: fieldErrors);
      }
    }

    return const ApiError.validation();
  }
}
