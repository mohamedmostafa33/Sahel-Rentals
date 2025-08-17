import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';

@freezed
class ApiError with _$ApiError {
  const factory ApiError({
    required String message,
    @Default(0) int statusCode,
    String? errorCode,
    dynamic data,
  }) = _ApiError;

  const factory ApiError.network({
    @Default('Network connection error') String message,
  }) = NetworkError;

  const factory ApiError.timeout({@Default('Request timeout') String message}) =
      TimeoutError;

  const factory ApiError.server({
    @Default('Server error') String message,
    @Default(500) int statusCode,
  }) = ServerError;

  const factory ApiError.unauthorized({
    @Default('Unauthorized access') String message,
  }) = UnauthorizedError;

  const factory ApiError.validation({
    @Default('Validation failed') String message,
    Map<String, List<String>>? errors,
  }) = ValidationError;

  const factory ApiError.unknown({
    @Default('Unknown error occurred') String message,
  }) = UnknownError;
}
