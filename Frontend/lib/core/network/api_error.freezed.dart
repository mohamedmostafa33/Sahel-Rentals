// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiError {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String message, int statusCode, String? errorCode, dynamic data)
        $default, {
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message, int statusCode) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message, Map<String, List<String>>? errors)
        validation,
    required TResult Function(String message) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String message, int statusCode, String? errorCode, dynamic data)?
        $default, {
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message, int statusCode)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message, Map<String, List<String>>? errors)?
        validation,
    TResult? Function(String message)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String message, int statusCode, String? errorCode, dynamic data)?
        $default, {
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message, int statusCode)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message, Map<String, List<String>>? errors)?
        validation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApiError value) $default, {
    required TResult Function(NetworkError value) network,
    required TResult Function(TimeoutError value) timeout,
    required TResult Function(ServerError value) server,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(ValidationError value) validation,
    required TResult Function(UnknownError value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApiError value)? $default, {
    TResult? Function(NetworkError value)? network,
    TResult? Function(TimeoutError value)? timeout,
    TResult? Function(ServerError value)? server,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(UnknownError value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApiError value)? $default, {
    TResult Function(NetworkError value)? network,
    TResult Function(TimeoutError value)? timeout,
    TResult Function(ServerError value)? server,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(ValidationError value)? validation,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiErrorCopyWith<ApiError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorCopyWith<$Res> {
  factory $ApiErrorCopyWith(ApiError value, $Res Function(ApiError) then) =
      _$ApiErrorCopyWithImpl<$Res, ApiError>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ApiErrorCopyWithImpl<$Res, $Val extends ApiError>
    implements $ApiErrorCopyWith<$Res> {
  _$ApiErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiErrorImplCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$$ApiErrorImplCopyWith(
          _$ApiErrorImpl value, $Res Function(_$ApiErrorImpl) then) =
      __$$ApiErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int statusCode, String? errorCode, dynamic data});
}

/// @nodoc
class __$$ApiErrorImplCopyWithImpl<$Res>
    extends _$ApiErrorCopyWithImpl<$Res, _$ApiErrorImpl>
    implements _$$ApiErrorImplCopyWith<$Res> {
  __$$ApiErrorImplCopyWithImpl(
      _$ApiErrorImpl _value, $Res Function(_$ApiErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = null,
    Object? errorCode = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ApiErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$ApiErrorImpl implements _ApiError {
  const _$ApiErrorImpl(
      {required this.message, this.statusCode = 0, this.errorCode, this.data});

  @override
  final String message;
  @override
  @JsonKey()
  final int statusCode;
  @override
  final String? errorCode;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'ApiError(message: $message, statusCode: $statusCode, errorCode: $errorCode, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode, errorCode,
      const DeepCollectionEquality().hash(data));

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorImplCopyWith<_$ApiErrorImpl> get copyWith =>
      __$$ApiErrorImplCopyWithImpl<_$ApiErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String message, int statusCode, String? errorCode, dynamic data)
        $default, {
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message, int statusCode) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message, Map<String, List<String>>? errors)
        validation,
    required TResult Function(String message) unknown,
  }) {
    return $default(message, statusCode, errorCode, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String message, int statusCode, String? errorCode, dynamic data)?
        $default, {
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message, int statusCode)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message, Map<String, List<String>>? errors)?
        validation,
    TResult? Function(String message)? unknown,
  }) {
    return $default?.call(message, statusCode, errorCode, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String message, int statusCode, String? errorCode, dynamic data)?
        $default, {
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message, int statusCode)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message, Map<String, List<String>>? errors)?
        validation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(message, statusCode, errorCode, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApiError value) $default, {
    required TResult Function(NetworkError value) network,
    required TResult Function(TimeoutError value) timeout,
    required TResult Function(ServerError value) server,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(ValidationError value) validation,
    required TResult Function(UnknownError value) unknown,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApiError value)? $default, {
    TResult? Function(NetworkError value)? network,
    TResult? Function(TimeoutError value)? timeout,
    TResult? Function(ServerError value)? server,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApiError value)? $default, {
    TResult Function(NetworkError value)? network,
    TResult Function(TimeoutError value)? timeout,
    TResult Function(ServerError value)? server,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(ValidationError value)? validation,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ApiError implements ApiError {
  const factory _ApiError(
      {required final String message,
      final int statusCode,
      final String? errorCode,
      final dynamic data}) = _$ApiErrorImpl;

  @override
  String get message;
  int get statusCode;
  String? get errorCode;
  dynamic get data;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiErrorImplCopyWith<_$ApiErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
          _$NetworkErrorImpl value, $Res Function(_$NetworkErrorImpl) then) =
      __$$NetworkErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$ApiErrorCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
      _$NetworkErrorImpl _value, $Res Function(_$NetworkErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkErrorImpl implements NetworkError {
  const _$NetworkErrorImpl({this.message = 'Network connection error'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'ApiError.network(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      __$$NetworkErrorImplCopyWithImpl<_$NetworkErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String message, int statusCode, String? errorCode, dynamic data)
        $default, {
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message, int statusCode) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message, Map<String, List<String>>? errors)
        validation,
    required TResult Function(String message) unknown,
  }) {
    return network(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String message, int statusCode, String? errorCode, dynamic data)?
        $default, {
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message, int statusCode)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message, Map<String, List<String>>? errors)?
        validation,
    TResult? Function(String message)? unknown,
  }) {
    return network?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String message, int statusCode, String? errorCode, dynamic data)?
        $default, {
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message, int statusCode)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message, Map<String, List<String>>? errors)?
        validation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApiError value) $default, {
    required TResult Function(NetworkError value) network,
    required TResult Function(TimeoutError value) timeout,
    required TResult Function(ServerError value) server,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(ValidationError value) validation,
    required TResult Function(UnknownError value) unknown,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApiError value)? $default, {
    TResult? Function(NetworkError value)? network,
    TResult? Function(TimeoutError value)? timeout,
    TResult? Function(ServerError value)? server,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApiError value)? $default, {
    TResult Function(NetworkError value)? network,
    TResult Function(TimeoutError value)? timeout,
    TResult Function(ServerError value)? server,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(ValidationError value)? validation,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkError implements ApiError {
  const factory NetworkError({final String message}) = _$NetworkErrorImpl;

  @override
  String get message;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeoutErrorImplCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$$TimeoutErrorImplCopyWith(
          _$TimeoutErrorImpl value, $Res Function(_$TimeoutErrorImpl) then) =
      __$$TimeoutErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TimeoutErrorImplCopyWithImpl<$Res>
    extends _$ApiErrorCopyWithImpl<$Res, _$TimeoutErrorImpl>
    implements _$$TimeoutErrorImplCopyWith<$Res> {
  __$$TimeoutErrorImplCopyWithImpl(
      _$TimeoutErrorImpl _value, $Res Function(_$TimeoutErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TimeoutErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TimeoutErrorImpl implements TimeoutError {
  const _$TimeoutErrorImpl({this.message = 'Request timeout'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'ApiError.timeout(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeoutErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeoutErrorImplCopyWith<_$TimeoutErrorImpl> get copyWith =>
      __$$TimeoutErrorImplCopyWithImpl<_$TimeoutErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String message, int statusCode, String? errorCode, dynamic data)
        $default, {
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message, int statusCode) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message, Map<String, List<String>>? errors)
        validation,
    required TResult Function(String message) unknown,
  }) {
    return timeout(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String message, int statusCode, String? errorCode, dynamic data)?
        $default, {
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message, int statusCode)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message, Map<String, List<String>>? errors)?
        validation,
    TResult? Function(String message)? unknown,
  }) {
    return timeout?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String message, int statusCode, String? errorCode, dynamic data)?
        $default, {
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message, int statusCode)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message, Map<String, List<String>>? errors)?
        validation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApiError value) $default, {
    required TResult Function(NetworkError value) network,
    required TResult Function(TimeoutError value) timeout,
    required TResult Function(ServerError value) server,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(ValidationError value) validation,
    required TResult Function(UnknownError value) unknown,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApiError value)? $default, {
    TResult? Function(NetworkError value)? network,
    TResult? Function(TimeoutError value)? timeout,
    TResult? Function(ServerError value)? server,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApiError value)? $default, {
    TResult Function(NetworkError value)? network,
    TResult Function(TimeoutError value)? timeout,
    TResult Function(ServerError value)? server,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(ValidationError value)? validation,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class TimeoutError implements ApiError {
  const factory TimeoutError({final String message}) = _$TimeoutErrorImpl;

  @override
  String get message;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeoutErrorImplCopyWith<_$TimeoutErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int statusCode});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$ApiErrorCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = null,
  }) {
    return _then(_$ServerErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ServerErrorImpl implements ServerError {
  const _$ServerErrorImpl(
      {this.message = 'Server error', this.statusCode = 500});

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final int statusCode;

  @override
  String toString() {
    return 'ApiError.server(message: $message, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode);

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String message, int statusCode, String? errorCode, dynamic data)
        $default, {
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message, int statusCode) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message, Map<String, List<String>>? errors)
        validation,
    required TResult Function(String message) unknown,
  }) {
    return server(message, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String message, int statusCode, String? errorCode, dynamic data)?
        $default, {
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message, int statusCode)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message, Map<String, List<String>>? errors)?
        validation,
    TResult? Function(String message)? unknown,
  }) {
    return server?.call(message, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String message, int statusCode, String? errorCode, dynamic data)?
        $default, {
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message, int statusCode)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message, Map<String, List<String>>? errors)?
        validation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApiError value) $default, {
    required TResult Function(NetworkError value) network,
    required TResult Function(TimeoutError value) timeout,
    required TResult Function(ServerError value) server,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(ValidationError value) validation,
    required TResult Function(UnknownError value) unknown,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApiError value)? $default, {
    TResult? Function(NetworkError value)? network,
    TResult? Function(TimeoutError value)? timeout,
    TResult? Function(ServerError value)? server,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApiError value)? $default, {
    TResult Function(NetworkError value)? network,
    TResult Function(TimeoutError value)? timeout,
    TResult Function(ServerError value)? server,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(ValidationError value)? validation,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerError implements ApiError {
  const factory ServerError({final String message, final int statusCode}) =
      _$ServerErrorImpl;

  @override
  String get message;
  int get statusCode;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedErrorImplCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$$UnauthorizedErrorImplCopyWith(_$UnauthorizedErrorImpl value,
          $Res Function(_$UnauthorizedErrorImpl) then) =
      __$$UnauthorizedErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnauthorizedErrorImplCopyWithImpl<$Res>
    extends _$ApiErrorCopyWithImpl<$Res, _$UnauthorizedErrorImpl>
    implements _$$UnauthorizedErrorImplCopyWith<$Res> {
  __$$UnauthorizedErrorImplCopyWithImpl(_$UnauthorizedErrorImpl _value,
      $Res Function(_$UnauthorizedErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnauthorizedErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnauthorizedErrorImpl implements UnauthorizedError {
  const _$UnauthorizedErrorImpl({this.message = 'Unauthorized access'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'ApiError.unauthorized(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedErrorImplCopyWith<_$UnauthorizedErrorImpl> get copyWith =>
      __$$UnauthorizedErrorImplCopyWithImpl<_$UnauthorizedErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String message, int statusCode, String? errorCode, dynamic data)
        $default, {
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message, int statusCode) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message, Map<String, List<String>>? errors)
        validation,
    required TResult Function(String message) unknown,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String message, int statusCode, String? errorCode, dynamic data)?
        $default, {
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message, int statusCode)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message, Map<String, List<String>>? errors)?
        validation,
    TResult? Function(String message)? unknown,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String message, int statusCode, String? errorCode, dynamic data)?
        $default, {
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message, int statusCode)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message, Map<String, List<String>>? errors)?
        validation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApiError value) $default, {
    required TResult Function(NetworkError value) network,
    required TResult Function(TimeoutError value) timeout,
    required TResult Function(ServerError value) server,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(ValidationError value) validation,
    required TResult Function(UnknownError value) unknown,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApiError value)? $default, {
    TResult? Function(NetworkError value)? network,
    TResult? Function(TimeoutError value)? timeout,
    TResult? Function(ServerError value)? server,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApiError value)? $default, {
    TResult Function(NetworkError value)? network,
    TResult Function(TimeoutError value)? timeout,
    TResult Function(ServerError value)? server,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(ValidationError value)? validation,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedError implements ApiError {
  const factory UnauthorizedError({final String message}) =
      _$UnauthorizedErrorImpl;

  @override
  String get message;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthorizedErrorImplCopyWith<_$UnauthorizedErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationErrorImplCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$$ValidationErrorImplCopyWith(_$ValidationErrorImpl value,
          $Res Function(_$ValidationErrorImpl) then) =
      __$$ValidationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Map<String, List<String>>? errors});
}

/// @nodoc
class __$$ValidationErrorImplCopyWithImpl<$Res>
    extends _$ApiErrorCopyWithImpl<$Res, _$ValidationErrorImpl>
    implements _$$ValidationErrorImplCopyWith<$Res> {
  __$$ValidationErrorImplCopyWithImpl(
      _$ValidationErrorImpl _value, $Res Function(_$ValidationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? errors = freezed,
  }) {
    return _then(_$ValidationErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
    ));
  }
}

/// @nodoc

class _$ValidationErrorImpl implements ValidationError {
  const _$ValidationErrorImpl(
      {this.message = 'Validation failed',
      final Map<String, List<String>>? errors})
      : _errors = errors;

  @override
  @JsonKey()
  final String message;
  final Map<String, List<String>>? _errors;
  @override
  Map<String, List<String>>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ApiError.validation(message: $message, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_errors));

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      __$$ValidationErrorImplCopyWithImpl<_$ValidationErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String message, int statusCode, String? errorCode, dynamic data)
        $default, {
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message, int statusCode) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message, Map<String, List<String>>? errors)
        validation,
    required TResult Function(String message) unknown,
  }) {
    return validation(message, errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String message, int statusCode, String? errorCode, dynamic data)?
        $default, {
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message, int statusCode)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message, Map<String, List<String>>? errors)?
        validation,
    TResult? Function(String message)? unknown,
  }) {
    return validation?.call(message, errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String message, int statusCode, String? errorCode, dynamic data)?
        $default, {
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message, int statusCode)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message, Map<String, List<String>>? errors)?
        validation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message, errors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApiError value) $default, {
    required TResult Function(NetworkError value) network,
    required TResult Function(TimeoutError value) timeout,
    required TResult Function(ServerError value) server,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(ValidationError value) validation,
    required TResult Function(UnknownError value) unknown,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApiError value)? $default, {
    TResult? Function(NetworkError value)? network,
    TResult? Function(TimeoutError value)? timeout,
    TResult? Function(ServerError value)? server,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApiError value)? $default, {
    TResult Function(NetworkError value)? network,
    TResult Function(TimeoutError value)? timeout,
    TResult Function(ServerError value)? server,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(ValidationError value)? validation,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ValidationError implements ApiError {
  const factory ValidationError(
      {final String message,
      final Map<String, List<String>>? errors}) = _$ValidationErrorImpl;

  @override
  String get message;
  Map<String, List<String>>? get errors;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownErrorImplCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$$UnknownErrorImplCopyWith(
          _$UnknownErrorImpl value, $Res Function(_$UnknownErrorImpl) then) =
      __$$UnknownErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnknownErrorImplCopyWithImpl<$Res>
    extends _$ApiErrorCopyWithImpl<$Res, _$UnknownErrorImpl>
    implements _$$UnknownErrorImplCopyWith<$Res> {
  __$$UnknownErrorImplCopyWithImpl(
      _$UnknownErrorImpl _value, $Res Function(_$UnknownErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnknownErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnknownErrorImpl implements UnknownError {
  const _$UnknownErrorImpl({this.message = 'Unknown error occurred'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'ApiError.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      __$$UnknownErrorImplCopyWithImpl<_$UnknownErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String message, int statusCode, String? errorCode, dynamic data)
        $default, {
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message, int statusCode) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message, Map<String, List<String>>? errors)
        validation,
    required TResult Function(String message) unknown,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String message, int statusCode, String? errorCode, dynamic data)?
        $default, {
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message, int statusCode)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message, Map<String, List<String>>? errors)?
        validation,
    TResult? Function(String message)? unknown,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String message, int statusCode, String? errorCode, dynamic data)?
        $default, {
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message, int statusCode)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message, Map<String, List<String>>? errors)?
        validation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApiError value) $default, {
    required TResult Function(NetworkError value) network,
    required TResult Function(TimeoutError value) timeout,
    required TResult Function(ServerError value) server,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(ValidationError value) validation,
    required TResult Function(UnknownError value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApiError value)? $default, {
    TResult? Function(NetworkError value)? network,
    TResult? Function(TimeoutError value)? timeout,
    TResult? Function(ServerError value)? server,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApiError value)? $default, {
    TResult Function(NetworkError value)? network,
    TResult Function(TimeoutError value)? timeout,
    TResult Function(ServerError value)? server,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(ValidationError value)? validation,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownError implements ApiError {
  const factory UnknownError({final String message}) = _$UnknownErrorImpl;

  @override
  String get message;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
