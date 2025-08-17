import 'package:freezed_annotation/freezed_annotation.dart';
import 'api_error.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ApiError error) = Failure<T>;
}

extension ApiResultX<T> on ApiResult<T> {
  /// Returns data if success, null if failure
  T? get dataOrNull => when(success: (data) => data, failure: (_) => null);

  /// Returns error if failure, null if success
  ApiError? get errorOrNull =>
      when(success: (_) => null, failure: (error) => error);

  /// Returns true if result is success
  bool get isSuccess => when(success: (_) => true, failure: (_) => false);

  /// Returns true if result is failure
  bool get isFailure => when(success: (_) => false, failure: (_) => true);
}
