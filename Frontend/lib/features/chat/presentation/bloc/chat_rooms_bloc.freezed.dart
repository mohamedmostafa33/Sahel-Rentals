// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_rooms_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatRoomsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChatRooms,
    required TResult Function(int? chaletId, int? ownerId) createOrGetChatRoom,
    required TResult Function() refreshChatRooms,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChatRooms,
    TResult? Function(int? chaletId, int? ownerId)? createOrGetChatRoom,
    TResult? Function()? refreshChatRooms,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChatRooms,
    TResult Function(int? chaletId, int? ownerId)? createOrGetChatRoom,
    TResult Function()? refreshChatRooms,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadChatRooms value) loadChatRooms,
    required TResult Function(_CreateOrGetChatRoom value) createOrGetChatRoom,
    required TResult Function(_RefreshChatRooms value) refreshChatRooms,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadChatRooms value)? loadChatRooms,
    TResult? Function(_CreateOrGetChatRoom value)? createOrGetChatRoom,
    TResult? Function(_RefreshChatRooms value)? refreshChatRooms,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadChatRooms value)? loadChatRooms,
    TResult Function(_CreateOrGetChatRoom value)? createOrGetChatRoom,
    TResult Function(_RefreshChatRooms value)? refreshChatRooms,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomsEventCopyWith<$Res> {
  factory $ChatRoomsEventCopyWith(
          ChatRoomsEvent value, $Res Function(ChatRoomsEvent) then) =
      _$ChatRoomsEventCopyWithImpl<$Res, ChatRoomsEvent>;
}

/// @nodoc
class _$ChatRoomsEventCopyWithImpl<$Res, $Val extends ChatRoomsEvent>
    implements $ChatRoomsEventCopyWith<$Res> {
  _$ChatRoomsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRoomsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadChatRoomsImplCopyWith<$Res> {
  factory _$$LoadChatRoomsImplCopyWith(
          _$LoadChatRoomsImpl value, $Res Function(_$LoadChatRoomsImpl) then) =
      __$$LoadChatRoomsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadChatRoomsImplCopyWithImpl<$Res>
    extends _$ChatRoomsEventCopyWithImpl<$Res, _$LoadChatRoomsImpl>
    implements _$$LoadChatRoomsImplCopyWith<$Res> {
  __$$LoadChatRoomsImplCopyWithImpl(
      _$LoadChatRoomsImpl _value, $Res Function(_$LoadChatRoomsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRoomsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadChatRoomsImpl implements _LoadChatRooms {
  const _$LoadChatRoomsImpl();

  @override
  String toString() {
    return 'ChatRoomsEvent.loadChatRooms()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadChatRoomsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChatRooms,
    required TResult Function(int? chaletId, int? ownerId) createOrGetChatRoom,
    required TResult Function() refreshChatRooms,
  }) {
    return loadChatRooms();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChatRooms,
    TResult? Function(int? chaletId, int? ownerId)? createOrGetChatRoom,
    TResult? Function()? refreshChatRooms,
  }) {
    return loadChatRooms?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChatRooms,
    TResult Function(int? chaletId, int? ownerId)? createOrGetChatRoom,
    TResult Function()? refreshChatRooms,
    required TResult orElse(),
  }) {
    if (loadChatRooms != null) {
      return loadChatRooms();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadChatRooms value) loadChatRooms,
    required TResult Function(_CreateOrGetChatRoom value) createOrGetChatRoom,
    required TResult Function(_RefreshChatRooms value) refreshChatRooms,
  }) {
    return loadChatRooms(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadChatRooms value)? loadChatRooms,
    TResult? Function(_CreateOrGetChatRoom value)? createOrGetChatRoom,
    TResult? Function(_RefreshChatRooms value)? refreshChatRooms,
  }) {
    return loadChatRooms?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadChatRooms value)? loadChatRooms,
    TResult Function(_CreateOrGetChatRoom value)? createOrGetChatRoom,
    TResult Function(_RefreshChatRooms value)? refreshChatRooms,
    required TResult orElse(),
  }) {
    if (loadChatRooms != null) {
      return loadChatRooms(this);
    }
    return orElse();
  }
}

abstract class _LoadChatRooms implements ChatRoomsEvent {
  const factory _LoadChatRooms() = _$LoadChatRoomsImpl;
}

/// @nodoc
abstract class _$$CreateOrGetChatRoomImplCopyWith<$Res> {
  factory _$$CreateOrGetChatRoomImplCopyWith(_$CreateOrGetChatRoomImpl value,
          $Res Function(_$CreateOrGetChatRoomImpl) then) =
      __$$CreateOrGetChatRoomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? chaletId, int? ownerId});
}

/// @nodoc
class __$$CreateOrGetChatRoomImplCopyWithImpl<$Res>
    extends _$ChatRoomsEventCopyWithImpl<$Res, _$CreateOrGetChatRoomImpl>
    implements _$$CreateOrGetChatRoomImplCopyWith<$Res> {
  __$$CreateOrGetChatRoomImplCopyWithImpl(_$CreateOrGetChatRoomImpl _value,
      $Res Function(_$CreateOrGetChatRoomImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRoomsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chaletId = freezed,
    Object? ownerId = freezed,
  }) {
    return _then(_$CreateOrGetChatRoomImpl(
      chaletId: freezed == chaletId
          ? _value.chaletId
          : chaletId // ignore: cast_nullable_to_non_nullable
              as int?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CreateOrGetChatRoomImpl implements _CreateOrGetChatRoom {
  const _$CreateOrGetChatRoomImpl({this.chaletId, this.ownerId});

  @override
  final int? chaletId;
  @override
  final int? ownerId;

  @override
  String toString() {
    return 'ChatRoomsEvent.createOrGetChatRoom(chaletId: $chaletId, ownerId: $ownerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrGetChatRoomImpl &&
            (identical(other.chaletId, chaletId) ||
                other.chaletId == chaletId) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chaletId, ownerId);

  /// Create a copy of ChatRoomsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrGetChatRoomImplCopyWith<_$CreateOrGetChatRoomImpl> get copyWith =>
      __$$CreateOrGetChatRoomImplCopyWithImpl<_$CreateOrGetChatRoomImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChatRooms,
    required TResult Function(int? chaletId, int? ownerId) createOrGetChatRoom,
    required TResult Function() refreshChatRooms,
  }) {
    return createOrGetChatRoom(chaletId, ownerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChatRooms,
    TResult? Function(int? chaletId, int? ownerId)? createOrGetChatRoom,
    TResult? Function()? refreshChatRooms,
  }) {
    return createOrGetChatRoom?.call(chaletId, ownerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChatRooms,
    TResult Function(int? chaletId, int? ownerId)? createOrGetChatRoom,
    TResult Function()? refreshChatRooms,
    required TResult orElse(),
  }) {
    if (createOrGetChatRoom != null) {
      return createOrGetChatRoom(chaletId, ownerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadChatRooms value) loadChatRooms,
    required TResult Function(_CreateOrGetChatRoom value) createOrGetChatRoom,
    required TResult Function(_RefreshChatRooms value) refreshChatRooms,
  }) {
    return createOrGetChatRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadChatRooms value)? loadChatRooms,
    TResult? Function(_CreateOrGetChatRoom value)? createOrGetChatRoom,
    TResult? Function(_RefreshChatRooms value)? refreshChatRooms,
  }) {
    return createOrGetChatRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadChatRooms value)? loadChatRooms,
    TResult Function(_CreateOrGetChatRoom value)? createOrGetChatRoom,
    TResult Function(_RefreshChatRooms value)? refreshChatRooms,
    required TResult orElse(),
  }) {
    if (createOrGetChatRoom != null) {
      return createOrGetChatRoom(this);
    }
    return orElse();
  }
}

abstract class _CreateOrGetChatRoom implements ChatRoomsEvent {
  const factory _CreateOrGetChatRoom(
      {final int? chaletId, final int? ownerId}) = _$CreateOrGetChatRoomImpl;

  int? get chaletId;
  int? get ownerId;

  /// Create a copy of ChatRoomsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateOrGetChatRoomImplCopyWith<_$CreateOrGetChatRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshChatRoomsImplCopyWith<$Res> {
  factory _$$RefreshChatRoomsImplCopyWith(_$RefreshChatRoomsImpl value,
          $Res Function(_$RefreshChatRoomsImpl) then) =
      __$$RefreshChatRoomsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshChatRoomsImplCopyWithImpl<$Res>
    extends _$ChatRoomsEventCopyWithImpl<$Res, _$RefreshChatRoomsImpl>
    implements _$$RefreshChatRoomsImplCopyWith<$Res> {
  __$$RefreshChatRoomsImplCopyWithImpl(_$RefreshChatRoomsImpl _value,
      $Res Function(_$RefreshChatRoomsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRoomsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshChatRoomsImpl implements _RefreshChatRooms {
  const _$RefreshChatRoomsImpl();

  @override
  String toString() {
    return 'ChatRoomsEvent.refreshChatRooms()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshChatRoomsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChatRooms,
    required TResult Function(int? chaletId, int? ownerId) createOrGetChatRoom,
    required TResult Function() refreshChatRooms,
  }) {
    return refreshChatRooms();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChatRooms,
    TResult? Function(int? chaletId, int? ownerId)? createOrGetChatRoom,
    TResult? Function()? refreshChatRooms,
  }) {
    return refreshChatRooms?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChatRooms,
    TResult Function(int? chaletId, int? ownerId)? createOrGetChatRoom,
    TResult Function()? refreshChatRooms,
    required TResult orElse(),
  }) {
    if (refreshChatRooms != null) {
      return refreshChatRooms();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadChatRooms value) loadChatRooms,
    required TResult Function(_CreateOrGetChatRoom value) createOrGetChatRoom,
    required TResult Function(_RefreshChatRooms value) refreshChatRooms,
  }) {
    return refreshChatRooms(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadChatRooms value)? loadChatRooms,
    TResult? Function(_CreateOrGetChatRoom value)? createOrGetChatRoom,
    TResult? Function(_RefreshChatRooms value)? refreshChatRooms,
  }) {
    return refreshChatRooms?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadChatRooms value)? loadChatRooms,
    TResult Function(_CreateOrGetChatRoom value)? createOrGetChatRoom,
    TResult Function(_RefreshChatRooms value)? refreshChatRooms,
    required TResult orElse(),
  }) {
    if (refreshChatRooms != null) {
      return refreshChatRooms(this);
    }
    return orElse();
  }
}

abstract class _RefreshChatRooms implements ChatRoomsEvent {
  const factory _RefreshChatRooms() = _$RefreshChatRoomsImpl;
}

/// @nodoc
mixin _$ChatRoomsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ChatRoom> chatRooms) loaded,
    required TResult Function(List<ChatRoom> chatRooms) refreshing,
    required TResult Function() creatingChatRoom,
    required TResult Function(ChatRoom chatRoom) chatRoomCreated,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ChatRoom> chatRooms)? loaded,
    TResult? Function(List<ChatRoom> chatRooms)? refreshing,
    TResult? Function()? creatingChatRoom,
    TResult? Function(ChatRoom chatRoom)? chatRoomCreated,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ChatRoom> chatRooms)? loaded,
    TResult Function(List<ChatRoom> chatRooms)? refreshing,
    TResult Function()? creatingChatRoom,
    TResult Function(ChatRoom chatRoom)? chatRoomCreated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_CreatingChatRoom value) creatingChatRoom,
    required TResult Function(_ChatRoomCreated value) chatRoomCreated,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Refreshing value)? refreshing,
    TResult? Function(_CreatingChatRoom value)? creatingChatRoom,
    TResult? Function(_ChatRoomCreated value)? chatRoomCreated,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_CreatingChatRoom value)? creatingChatRoom,
    TResult Function(_ChatRoomCreated value)? chatRoomCreated,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomsStateCopyWith<$Res> {
  factory $ChatRoomsStateCopyWith(
          ChatRoomsState value, $Res Function(ChatRoomsState) then) =
      _$ChatRoomsStateCopyWithImpl<$Res, ChatRoomsState>;
}

/// @nodoc
class _$ChatRoomsStateCopyWithImpl<$Res, $Val extends ChatRoomsState>
    implements $ChatRoomsStateCopyWith<$Res> {
  _$ChatRoomsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRoomsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ChatRoomsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRoomsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ChatRoomsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ChatRoom> chatRooms) loaded,
    required TResult Function(List<ChatRoom> chatRooms) refreshing,
    required TResult Function() creatingChatRoom,
    required TResult Function(ChatRoom chatRoom) chatRoomCreated,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ChatRoom> chatRooms)? loaded,
    TResult? Function(List<ChatRoom> chatRooms)? refreshing,
    TResult? Function()? creatingChatRoom,
    TResult? Function(ChatRoom chatRoom)? chatRoomCreated,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ChatRoom> chatRooms)? loaded,
    TResult Function(List<ChatRoom> chatRooms)? refreshing,
    TResult Function()? creatingChatRoom,
    TResult Function(ChatRoom chatRoom)? chatRoomCreated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_CreatingChatRoom value) creatingChatRoom,
    required TResult Function(_ChatRoomCreated value) chatRoomCreated,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Refreshing value)? refreshing,
    TResult? Function(_CreatingChatRoom value)? creatingChatRoom,
    TResult? Function(_ChatRoomCreated value)? chatRoomCreated,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_CreatingChatRoom value)? creatingChatRoom,
    TResult Function(_ChatRoomCreated value)? chatRoomCreated,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ChatRoomsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ChatRoomsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRoomsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ChatRoomsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ChatRoom> chatRooms) loaded,
    required TResult Function(List<ChatRoom> chatRooms) refreshing,
    required TResult Function() creatingChatRoom,
    required TResult Function(ChatRoom chatRoom) chatRoomCreated,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ChatRoom> chatRooms)? loaded,
    TResult? Function(List<ChatRoom> chatRooms)? refreshing,
    TResult? Function()? creatingChatRoom,
    TResult? Function(ChatRoom chatRoom)? chatRoomCreated,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ChatRoom> chatRooms)? loaded,
    TResult Function(List<ChatRoom> chatRooms)? refreshing,
    TResult Function()? creatingChatRoom,
    TResult Function(ChatRoom chatRoom)? chatRoomCreated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_CreatingChatRoom value) creatingChatRoom,
    required TResult Function(_ChatRoomCreated value) chatRoomCreated,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Refreshing value)? refreshing,
    TResult? Function(_CreatingChatRoom value)? creatingChatRoom,
    TResult? Function(_ChatRoomCreated value)? chatRoomCreated,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_CreatingChatRoom value)? creatingChatRoom,
    TResult Function(_ChatRoomCreated value)? chatRoomCreated,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ChatRoomsState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ChatRoom> chatRooms});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ChatRoomsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRoomsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRooms = null,
  }) {
    return _then(_$LoadedImpl(
      null == chatRooms
          ? _value._chatRooms
          : chatRooms // ignore: cast_nullable_to_non_nullable
              as List<ChatRoom>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<ChatRoom> chatRooms) : _chatRooms = chatRooms;

  final List<ChatRoom> _chatRooms;
  @override
  List<ChatRoom> get chatRooms {
    if (_chatRooms is EqualUnmodifiableListView) return _chatRooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatRooms);
  }

  @override
  String toString() {
    return 'ChatRoomsState.loaded(chatRooms: $chatRooms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._chatRooms, _chatRooms));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chatRooms));

  /// Create a copy of ChatRoomsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ChatRoom> chatRooms) loaded,
    required TResult Function(List<ChatRoom> chatRooms) refreshing,
    required TResult Function() creatingChatRoom,
    required TResult Function(ChatRoom chatRoom) chatRoomCreated,
    required TResult Function(String message) failure,
  }) {
    return loaded(chatRooms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ChatRoom> chatRooms)? loaded,
    TResult? Function(List<ChatRoom> chatRooms)? refreshing,
    TResult? Function()? creatingChatRoom,
    TResult? Function(ChatRoom chatRoom)? chatRoomCreated,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(chatRooms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ChatRoom> chatRooms)? loaded,
    TResult Function(List<ChatRoom> chatRooms)? refreshing,
    TResult Function()? creatingChatRoom,
    TResult Function(ChatRoom chatRoom)? chatRoomCreated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(chatRooms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_CreatingChatRoom value) creatingChatRoom,
    required TResult Function(_ChatRoomCreated value) chatRoomCreated,
    required TResult Function(_Failure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Refreshing value)? refreshing,
    TResult? Function(_CreatingChatRoom value)? creatingChatRoom,
    TResult? Function(_ChatRoomCreated value)? chatRoomCreated,
    TResult? Function(_Failure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_CreatingChatRoom value)? creatingChatRoom,
    TResult Function(_ChatRoomCreated value)? chatRoomCreated,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ChatRoomsState {
  const factory _Loaded(final List<ChatRoom> chatRooms) = _$LoadedImpl;

  List<ChatRoom> get chatRooms;

  /// Create a copy of ChatRoomsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshingImplCopyWith<$Res> {
  factory _$$RefreshingImplCopyWith(
          _$RefreshingImpl value, $Res Function(_$RefreshingImpl) then) =
      __$$RefreshingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ChatRoom> chatRooms});
}

/// @nodoc
class __$$RefreshingImplCopyWithImpl<$Res>
    extends _$ChatRoomsStateCopyWithImpl<$Res, _$RefreshingImpl>
    implements _$$RefreshingImplCopyWith<$Res> {
  __$$RefreshingImplCopyWithImpl(
      _$RefreshingImpl _value, $Res Function(_$RefreshingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRoomsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRooms = null,
  }) {
    return _then(_$RefreshingImpl(
      null == chatRooms
          ? _value._chatRooms
          : chatRooms // ignore: cast_nullable_to_non_nullable
              as List<ChatRoom>,
    ));
  }
}

/// @nodoc

class _$RefreshingImpl implements _Refreshing {
  const _$RefreshingImpl(final List<ChatRoom> chatRooms)
      : _chatRooms = chatRooms;

  final List<ChatRoom> _chatRooms;
  @override
  List<ChatRoom> get chatRooms {
    if (_chatRooms is EqualUnmodifiableListView) return _chatRooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatRooms);
  }

  @override
  String toString() {
    return 'ChatRoomsState.refreshing(chatRooms: $chatRooms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshingImpl &&
            const DeepCollectionEquality()
                .equals(other._chatRooms, _chatRooms));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chatRooms));

  /// Create a copy of ChatRoomsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshingImplCopyWith<_$RefreshingImpl> get copyWith =>
      __$$RefreshingImplCopyWithImpl<_$RefreshingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ChatRoom> chatRooms) loaded,
    required TResult Function(List<ChatRoom> chatRooms) refreshing,
    required TResult Function() creatingChatRoom,
    required TResult Function(ChatRoom chatRoom) chatRoomCreated,
    required TResult Function(String message) failure,
  }) {
    return refreshing(chatRooms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ChatRoom> chatRooms)? loaded,
    TResult? Function(List<ChatRoom> chatRooms)? refreshing,
    TResult? Function()? creatingChatRoom,
    TResult? Function(ChatRoom chatRoom)? chatRoomCreated,
    TResult? Function(String message)? failure,
  }) {
    return refreshing?.call(chatRooms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ChatRoom> chatRooms)? loaded,
    TResult Function(List<ChatRoom> chatRooms)? refreshing,
    TResult Function()? creatingChatRoom,
    TResult Function(ChatRoom chatRoom)? chatRoomCreated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(chatRooms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_CreatingChatRoom value) creatingChatRoom,
    required TResult Function(_ChatRoomCreated value) chatRoomCreated,
    required TResult Function(_Failure value) failure,
  }) {
    return refreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Refreshing value)? refreshing,
    TResult? Function(_CreatingChatRoom value)? creatingChatRoom,
    TResult? Function(_ChatRoomCreated value)? chatRoomCreated,
    TResult? Function(_Failure value)? failure,
  }) {
    return refreshing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_CreatingChatRoom value)? creatingChatRoom,
    TResult Function(_ChatRoomCreated value)? chatRoomCreated,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(this);
    }
    return orElse();
  }
}

abstract class _Refreshing implements ChatRoomsState {
  const factory _Refreshing(final List<ChatRoom> chatRooms) = _$RefreshingImpl;

  List<ChatRoom> get chatRooms;

  /// Create a copy of ChatRoomsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshingImplCopyWith<_$RefreshingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreatingChatRoomImplCopyWith<$Res> {
  factory _$$CreatingChatRoomImplCopyWith(_$CreatingChatRoomImpl value,
          $Res Function(_$CreatingChatRoomImpl) then) =
      __$$CreatingChatRoomImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreatingChatRoomImplCopyWithImpl<$Res>
    extends _$ChatRoomsStateCopyWithImpl<$Res, _$CreatingChatRoomImpl>
    implements _$$CreatingChatRoomImplCopyWith<$Res> {
  __$$CreatingChatRoomImplCopyWithImpl(_$CreatingChatRoomImpl _value,
      $Res Function(_$CreatingChatRoomImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRoomsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreatingChatRoomImpl implements _CreatingChatRoom {
  const _$CreatingChatRoomImpl();

  @override
  String toString() {
    return 'ChatRoomsState.creatingChatRoom()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreatingChatRoomImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ChatRoom> chatRooms) loaded,
    required TResult Function(List<ChatRoom> chatRooms) refreshing,
    required TResult Function() creatingChatRoom,
    required TResult Function(ChatRoom chatRoom) chatRoomCreated,
    required TResult Function(String message) failure,
  }) {
    return creatingChatRoom();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ChatRoom> chatRooms)? loaded,
    TResult? Function(List<ChatRoom> chatRooms)? refreshing,
    TResult? Function()? creatingChatRoom,
    TResult? Function(ChatRoom chatRoom)? chatRoomCreated,
    TResult? Function(String message)? failure,
  }) {
    return creatingChatRoom?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ChatRoom> chatRooms)? loaded,
    TResult Function(List<ChatRoom> chatRooms)? refreshing,
    TResult Function()? creatingChatRoom,
    TResult Function(ChatRoom chatRoom)? chatRoomCreated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (creatingChatRoom != null) {
      return creatingChatRoom();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_CreatingChatRoom value) creatingChatRoom,
    required TResult Function(_ChatRoomCreated value) chatRoomCreated,
    required TResult Function(_Failure value) failure,
  }) {
    return creatingChatRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Refreshing value)? refreshing,
    TResult? Function(_CreatingChatRoom value)? creatingChatRoom,
    TResult? Function(_ChatRoomCreated value)? chatRoomCreated,
    TResult? Function(_Failure value)? failure,
  }) {
    return creatingChatRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_CreatingChatRoom value)? creatingChatRoom,
    TResult Function(_ChatRoomCreated value)? chatRoomCreated,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (creatingChatRoom != null) {
      return creatingChatRoom(this);
    }
    return orElse();
  }
}

abstract class _CreatingChatRoom implements ChatRoomsState {
  const factory _CreatingChatRoom() = _$CreatingChatRoomImpl;
}

/// @nodoc
abstract class _$$ChatRoomCreatedImplCopyWith<$Res> {
  factory _$$ChatRoomCreatedImplCopyWith(_$ChatRoomCreatedImpl value,
          $Res Function(_$ChatRoomCreatedImpl) then) =
      __$$ChatRoomCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatRoom chatRoom});
}

/// @nodoc
class __$$ChatRoomCreatedImplCopyWithImpl<$Res>
    extends _$ChatRoomsStateCopyWithImpl<$Res, _$ChatRoomCreatedImpl>
    implements _$$ChatRoomCreatedImplCopyWith<$Res> {
  __$$ChatRoomCreatedImplCopyWithImpl(
      _$ChatRoomCreatedImpl _value, $Res Function(_$ChatRoomCreatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRoomsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoom = null,
  }) {
    return _then(_$ChatRoomCreatedImpl(
      null == chatRoom
          ? _value.chatRoom
          : chatRoom // ignore: cast_nullable_to_non_nullable
              as ChatRoom,
    ));
  }
}

/// @nodoc

class _$ChatRoomCreatedImpl implements _ChatRoomCreated {
  const _$ChatRoomCreatedImpl(this.chatRoom);

  @override
  final ChatRoom chatRoom;

  @override
  String toString() {
    return 'ChatRoomsState.chatRoomCreated(chatRoom: $chatRoom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomCreatedImpl &&
            (identical(other.chatRoom, chatRoom) ||
                other.chatRoom == chatRoom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatRoom);

  /// Create a copy of ChatRoomsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomCreatedImplCopyWith<_$ChatRoomCreatedImpl> get copyWith =>
      __$$ChatRoomCreatedImplCopyWithImpl<_$ChatRoomCreatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ChatRoom> chatRooms) loaded,
    required TResult Function(List<ChatRoom> chatRooms) refreshing,
    required TResult Function() creatingChatRoom,
    required TResult Function(ChatRoom chatRoom) chatRoomCreated,
    required TResult Function(String message) failure,
  }) {
    return chatRoomCreated(chatRoom);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ChatRoom> chatRooms)? loaded,
    TResult? Function(List<ChatRoom> chatRooms)? refreshing,
    TResult? Function()? creatingChatRoom,
    TResult? Function(ChatRoom chatRoom)? chatRoomCreated,
    TResult? Function(String message)? failure,
  }) {
    return chatRoomCreated?.call(chatRoom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ChatRoom> chatRooms)? loaded,
    TResult Function(List<ChatRoom> chatRooms)? refreshing,
    TResult Function()? creatingChatRoom,
    TResult Function(ChatRoom chatRoom)? chatRoomCreated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (chatRoomCreated != null) {
      return chatRoomCreated(chatRoom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_CreatingChatRoom value) creatingChatRoom,
    required TResult Function(_ChatRoomCreated value) chatRoomCreated,
    required TResult Function(_Failure value) failure,
  }) {
    return chatRoomCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Refreshing value)? refreshing,
    TResult? Function(_CreatingChatRoom value)? creatingChatRoom,
    TResult? Function(_ChatRoomCreated value)? chatRoomCreated,
    TResult? Function(_Failure value)? failure,
  }) {
    return chatRoomCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_CreatingChatRoom value)? creatingChatRoom,
    TResult Function(_ChatRoomCreated value)? chatRoomCreated,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (chatRoomCreated != null) {
      return chatRoomCreated(this);
    }
    return orElse();
  }
}

abstract class _ChatRoomCreated implements ChatRoomsState {
  const factory _ChatRoomCreated(final ChatRoom chatRoom) =
      _$ChatRoomCreatedImpl;

  ChatRoom get chatRoom;

  /// Create a copy of ChatRoomsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoomCreatedImplCopyWith<_$ChatRoomCreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$ChatRoomsStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRoomsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ChatRoomsState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ChatRoomsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ChatRoom> chatRooms) loaded,
    required TResult Function(List<ChatRoom> chatRooms) refreshing,
    required TResult Function() creatingChatRoom,
    required TResult Function(ChatRoom chatRoom) chatRoomCreated,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ChatRoom> chatRooms)? loaded,
    TResult? Function(List<ChatRoom> chatRooms)? refreshing,
    TResult? Function()? creatingChatRoom,
    TResult? Function(ChatRoom chatRoom)? chatRoomCreated,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ChatRoom> chatRooms)? loaded,
    TResult Function(List<ChatRoom> chatRooms)? refreshing,
    TResult Function()? creatingChatRoom,
    TResult Function(ChatRoom chatRoom)? chatRoomCreated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_CreatingChatRoom value) creatingChatRoom,
    required TResult Function(_ChatRoomCreated value) chatRoomCreated,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Refreshing value)? refreshing,
    TResult? Function(_CreatingChatRoom value)? creatingChatRoom,
    TResult? Function(_ChatRoomCreated value)? chatRoomCreated,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_CreatingChatRoom value)? creatingChatRoom,
    TResult Function(_ChatRoomCreated value)? chatRoomCreated,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements ChatRoomsState {
  const factory _Failure(final String message) = _$FailureImpl;

  String get message;

  /// Create a copy of ChatRoomsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
