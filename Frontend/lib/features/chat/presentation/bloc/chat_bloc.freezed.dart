// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMessages,
    required TResult Function(String content, int? chaletId) sendMessage,
    required TResult Function() refreshMessages,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMessages,
    TResult? Function(String content, int? chaletId)? sendMessage,
    TResult? Function()? refreshMessages,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMessages,
    TResult Function(String content, int? chaletId)? sendMessage,
    TResult Function()? refreshMessages,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMessages value) loadMessages,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_RefreshMessages value) refreshMessages,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMessages value)? loadMessages,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_RefreshMessages value)? refreshMessages,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMessages value)? loadMessages,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_RefreshMessages value)? refreshMessages,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadMessagesImplCopyWith<$Res> {
  factory _$$LoadMessagesImplCopyWith(
    _$LoadMessagesImpl value,
    $Res Function(_$LoadMessagesImpl) then,
  ) = __$$LoadMessagesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMessagesImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$LoadMessagesImpl>
    implements _$$LoadMessagesImplCopyWith<$Res> {
  __$$LoadMessagesImplCopyWithImpl(
    _$LoadMessagesImpl _value,
    $Res Function(_$LoadMessagesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadMessagesImpl implements _LoadMessages {
  const _$LoadMessagesImpl();

  @override
  String toString() {
    return 'ChatEvent.loadMessages()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMessagesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMessages,
    required TResult Function(String content, int? chaletId) sendMessage,
    required TResult Function() refreshMessages,
  }) {
    return loadMessages();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMessages,
    TResult? Function(String content, int? chaletId)? sendMessage,
    TResult? Function()? refreshMessages,
  }) {
    return loadMessages?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMessages,
    TResult Function(String content, int? chaletId)? sendMessage,
    TResult Function()? refreshMessages,
    required TResult orElse(),
  }) {
    if (loadMessages != null) {
      return loadMessages();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMessages value) loadMessages,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_RefreshMessages value) refreshMessages,
  }) {
    return loadMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMessages value)? loadMessages,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_RefreshMessages value)? refreshMessages,
  }) {
    return loadMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMessages value)? loadMessages,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_RefreshMessages value)? refreshMessages,
    required TResult orElse(),
  }) {
    if (loadMessages != null) {
      return loadMessages(this);
    }
    return orElse();
  }
}

abstract class _LoadMessages implements ChatEvent {
  const factory _LoadMessages() = _$LoadMessagesImpl;
}

/// @nodoc
abstract class _$$SendMessageImplCopyWith<$Res> {
  factory _$$SendMessageImplCopyWith(
    _$SendMessageImpl value,
    $Res Function(_$SendMessageImpl) then,
  ) = __$$SendMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String content, int? chaletId});
}

/// @nodoc
class __$$SendMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SendMessageImpl>
    implements _$$SendMessageImplCopyWith<$Res> {
  __$$SendMessageImplCopyWithImpl(
    _$SendMessageImpl _value,
    $Res Function(_$SendMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null, Object? chaletId = freezed}) {
    return _then(
      _$SendMessageImpl(
        null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                as String,
        chaletId:
            freezed == chaletId
                ? _value.chaletId
                : chaletId // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc

class _$SendMessageImpl implements _SendMessage {
  const _$SendMessageImpl(this.content, {this.chaletId});

  @override
  final String content;
  @override
  final int? chaletId;

  @override
  String toString() {
    return 'ChatEvent.sendMessage(content: $content, chaletId: $chaletId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.chaletId, chaletId) ||
                other.chaletId == chaletId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content, chaletId);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      __$$SendMessageImplCopyWithImpl<_$SendMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMessages,
    required TResult Function(String content, int? chaletId) sendMessage,
    required TResult Function() refreshMessages,
  }) {
    return sendMessage(content, chaletId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMessages,
    TResult? Function(String content, int? chaletId)? sendMessage,
    TResult? Function()? refreshMessages,
  }) {
    return sendMessage?.call(content, chaletId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMessages,
    TResult Function(String content, int? chaletId)? sendMessage,
    TResult Function()? refreshMessages,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(content, chaletId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMessages value) loadMessages,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_RefreshMessages value) refreshMessages,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMessages value)? loadMessages,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_RefreshMessages value)? refreshMessages,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMessages value)? loadMessages,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_RefreshMessages value)? refreshMessages,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class _SendMessage implements ChatEvent {
  const factory _SendMessage(final String content, {final int? chaletId}) =
      _$SendMessageImpl;

  String get content;
  int? get chaletId;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshMessagesImplCopyWith<$Res> {
  factory _$$RefreshMessagesImplCopyWith(
    _$RefreshMessagesImpl value,
    $Res Function(_$RefreshMessagesImpl) then,
  ) = __$$RefreshMessagesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshMessagesImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$RefreshMessagesImpl>
    implements _$$RefreshMessagesImplCopyWith<$Res> {
  __$$RefreshMessagesImplCopyWithImpl(
    _$RefreshMessagesImpl _value,
    $Res Function(_$RefreshMessagesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshMessagesImpl implements _RefreshMessages {
  const _$RefreshMessagesImpl();

  @override
  String toString() {
    return 'ChatEvent.refreshMessages()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshMessagesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMessages,
    required TResult Function(String content, int? chaletId) sendMessage,
    required TResult Function() refreshMessages,
  }) {
    return refreshMessages();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMessages,
    TResult? Function(String content, int? chaletId)? sendMessage,
    TResult? Function()? refreshMessages,
  }) {
    return refreshMessages?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMessages,
    TResult Function(String content, int? chaletId)? sendMessage,
    TResult Function()? refreshMessages,
    required TResult orElse(),
  }) {
    if (refreshMessages != null) {
      return refreshMessages();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMessages value) loadMessages,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_RefreshMessages value) refreshMessages,
  }) {
    return refreshMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMessages value)? loadMessages,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_RefreshMessages value)? refreshMessages,
  }) {
    return refreshMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMessages value)? loadMessages,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_RefreshMessages value)? refreshMessages,
    required TResult orElse(),
  }) {
    if (refreshMessages != null) {
      return refreshMessages(this);
    }
    return orElse();
  }
}

abstract class _RefreshMessages implements ChatEvent {
  const factory _RefreshMessages() = _$RefreshMessagesImpl;
}

/// @nodoc
mixin _$ChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ChatRoom chatRoom, List<Message> messages) loaded,
    required TResult Function(ChatRoom chatRoom, List<Message> messages)
    refreshing,
    required TResult Function(ChatRoom chatRoom, List<Message> messages)
    sendingMessage,
    required TResult Function(
      ChatRoom chatRoom,
      List<Message> messages,
      String error,
    )
    sendMessageFailure,
    required TResult Function(String message) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)? loaded,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)? refreshing,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)?
    sendingMessage,
    TResult? Function(ChatRoom chatRoom, List<Message> messages, String error)?
    sendMessageFailure,
    TResult? Function(String message)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? loaded,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? refreshing,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? sendingMessage,
    TResult Function(ChatRoom chatRoom, List<Message> messages, String error)?
    sendMessageFailure,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_SendingMessage value) sendingMessage,
    required TResult Function(_SendMessageFailure value) sendMessageFailure,
    required TResult Function(_Failure value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Refreshing value)? refreshing,
    TResult? Function(_SendingMessage value)? sendingMessage,
    TResult? Function(_SendMessageFailure value)? sendMessageFailure,
    TResult? Function(_Failure value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_SendingMessage value)? sendingMessage,
    TResult Function(_SendMessageFailure value)? sendMessageFailure,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ChatState.initial()';
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
    required TResult Function(ChatRoom chatRoom, List<Message> messages) loaded,
    required TResult Function(ChatRoom chatRoom, List<Message> messages)
    refreshing,
    required TResult Function(ChatRoom chatRoom, List<Message> messages)
    sendingMessage,
    required TResult Function(
      ChatRoom chatRoom,
      List<Message> messages,
      String error,
    )
    sendMessageFailure,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)? loaded,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)? refreshing,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)?
    sendingMessage,
    TResult? Function(ChatRoom chatRoom, List<Message> messages, String error)?
    sendMessageFailure,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? loaded,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? refreshing,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? sendingMessage,
    TResult Function(ChatRoom chatRoom, List<Message> messages, String error)?
    sendMessageFailure,
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
    required TResult Function(_SendingMessage value) sendingMessage,
    required TResult Function(_SendMessageFailure value) sendMessageFailure,
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
    TResult? Function(_SendingMessage value)? sendingMessage,
    TResult? Function(_SendMessageFailure value)? sendMessageFailure,
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
    TResult Function(_SendingMessage value)? sendingMessage,
    TResult Function(_SendMessageFailure value)? sendMessageFailure,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ChatState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ChatState.loading()';
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
    required TResult Function(ChatRoom chatRoom, List<Message> messages) loaded,
    required TResult Function(ChatRoom chatRoom, List<Message> messages)
    refreshing,
    required TResult Function(ChatRoom chatRoom, List<Message> messages)
    sendingMessage,
    required TResult Function(
      ChatRoom chatRoom,
      List<Message> messages,
      String error,
    )
    sendMessageFailure,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)? loaded,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)? refreshing,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)?
    sendingMessage,
    TResult? Function(ChatRoom chatRoom, List<Message> messages, String error)?
    sendMessageFailure,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? loaded,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? refreshing,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? sendingMessage,
    TResult Function(ChatRoom chatRoom, List<Message> messages, String error)?
    sendMessageFailure,
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
    required TResult Function(_SendingMessage value) sendingMessage,
    required TResult Function(_SendMessageFailure value) sendMessageFailure,
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
    TResult? Function(_SendingMessage value)? sendingMessage,
    TResult? Function(_SendMessageFailure value)? sendMessageFailure,
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
    TResult Function(_SendingMessage value)? sendingMessage,
    TResult Function(_SendMessageFailure value)? sendMessageFailure,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ChatState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatRoom chatRoom, List<Message> messages});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? chatRoom = null, Object? messages = null}) {
    return _then(
      _$LoadedImpl(
        null == chatRoom
            ? _value.chatRoom
            : chatRoom // ignore: cast_nullable_to_non_nullable
                as ChatRoom,
        null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                as List<Message>,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.chatRoom, final List<Message> messages)
    : _messages = messages;

  @override
  final ChatRoom chatRoom;
  final List<Message> _messages;
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatState.loaded(chatRoom: $chatRoom, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.chatRoom, chatRoom) ||
                other.chatRoom == chatRoom) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    chatRoom,
    const DeepCollectionEquality().hash(_messages),
  );

  /// Create a copy of ChatState
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
    required TResult Function(ChatRoom chatRoom, List<Message> messages) loaded,
    required TResult Function(ChatRoom chatRoom, List<Message> messages)
    refreshing,
    required TResult Function(ChatRoom chatRoom, List<Message> messages)
    sendingMessage,
    required TResult Function(
      ChatRoom chatRoom,
      List<Message> messages,
      String error,
    )
    sendMessageFailure,
    required TResult Function(String message) failure,
  }) {
    return loaded(chatRoom, messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)? loaded,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)? refreshing,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)?
    sendingMessage,
    TResult? Function(ChatRoom chatRoom, List<Message> messages, String error)?
    sendMessageFailure,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(chatRoom, messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? loaded,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? refreshing,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? sendingMessage,
    TResult Function(ChatRoom chatRoom, List<Message> messages, String error)?
    sendMessageFailure,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(chatRoom, messages);
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
    required TResult Function(_SendingMessage value) sendingMessage,
    required TResult Function(_SendMessageFailure value) sendMessageFailure,
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
    TResult? Function(_SendingMessage value)? sendingMessage,
    TResult? Function(_SendMessageFailure value)? sendMessageFailure,
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
    TResult Function(_SendingMessage value)? sendingMessage,
    TResult Function(_SendMessageFailure value)? sendMessageFailure,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ChatState {
  const factory _Loaded(final ChatRoom chatRoom, final List<Message> messages) =
      _$LoadedImpl;

  ChatRoom get chatRoom;
  List<Message> get messages;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshingImplCopyWith<$Res> {
  factory _$$RefreshingImplCopyWith(
    _$RefreshingImpl value,
    $Res Function(_$RefreshingImpl) then,
  ) = __$$RefreshingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatRoom chatRoom, List<Message> messages});
}

/// @nodoc
class __$$RefreshingImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$RefreshingImpl>
    implements _$$RefreshingImplCopyWith<$Res> {
  __$$RefreshingImplCopyWithImpl(
    _$RefreshingImpl _value,
    $Res Function(_$RefreshingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? chatRoom = null, Object? messages = null}) {
    return _then(
      _$RefreshingImpl(
        null == chatRoom
            ? _value.chatRoom
            : chatRoom // ignore: cast_nullable_to_non_nullable
                as ChatRoom,
        null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                as List<Message>,
      ),
    );
  }
}

/// @nodoc

class _$RefreshingImpl implements _Refreshing {
  const _$RefreshingImpl(this.chatRoom, final List<Message> messages)
    : _messages = messages;

  @override
  final ChatRoom chatRoom;
  final List<Message> _messages;
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatState.refreshing(chatRoom: $chatRoom, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshingImpl &&
            (identical(other.chatRoom, chatRoom) ||
                other.chatRoom == chatRoom) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    chatRoom,
    const DeepCollectionEquality().hash(_messages),
  );

  /// Create a copy of ChatState
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
    required TResult Function(ChatRoom chatRoom, List<Message> messages) loaded,
    required TResult Function(ChatRoom chatRoom, List<Message> messages)
    refreshing,
    required TResult Function(ChatRoom chatRoom, List<Message> messages)
    sendingMessage,
    required TResult Function(
      ChatRoom chatRoom,
      List<Message> messages,
      String error,
    )
    sendMessageFailure,
    required TResult Function(String message) failure,
  }) {
    return refreshing(chatRoom, messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)? loaded,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)? refreshing,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)?
    sendingMessage,
    TResult? Function(ChatRoom chatRoom, List<Message> messages, String error)?
    sendMessageFailure,
    TResult? Function(String message)? failure,
  }) {
    return refreshing?.call(chatRoom, messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? loaded,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? refreshing,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? sendingMessage,
    TResult Function(ChatRoom chatRoom, List<Message> messages, String error)?
    sendMessageFailure,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(chatRoom, messages);
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
    required TResult Function(_SendingMessage value) sendingMessage,
    required TResult Function(_SendMessageFailure value) sendMessageFailure,
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
    TResult? Function(_SendingMessage value)? sendingMessage,
    TResult? Function(_SendMessageFailure value)? sendMessageFailure,
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
    TResult Function(_SendingMessage value)? sendingMessage,
    TResult Function(_SendMessageFailure value)? sendMessageFailure,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(this);
    }
    return orElse();
  }
}

abstract class _Refreshing implements ChatState {
  const factory _Refreshing(
    final ChatRoom chatRoom,
    final List<Message> messages,
  ) = _$RefreshingImpl;

  ChatRoom get chatRoom;
  List<Message> get messages;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshingImplCopyWith<_$RefreshingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendingMessageImplCopyWith<$Res> {
  factory _$$SendingMessageImplCopyWith(
    _$SendingMessageImpl value,
    $Res Function(_$SendingMessageImpl) then,
  ) = __$$SendingMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatRoom chatRoom, List<Message> messages});
}

/// @nodoc
class __$$SendingMessageImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$SendingMessageImpl>
    implements _$$SendingMessageImplCopyWith<$Res> {
  __$$SendingMessageImplCopyWithImpl(
    _$SendingMessageImpl _value,
    $Res Function(_$SendingMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? chatRoom = null, Object? messages = null}) {
    return _then(
      _$SendingMessageImpl(
        null == chatRoom
            ? _value.chatRoom
            : chatRoom // ignore: cast_nullable_to_non_nullable
                as ChatRoom,
        null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                as List<Message>,
      ),
    );
  }
}

/// @nodoc

class _$SendingMessageImpl implements _SendingMessage {
  const _$SendingMessageImpl(this.chatRoom, final List<Message> messages)
    : _messages = messages;

  @override
  final ChatRoom chatRoom;
  final List<Message> _messages;
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatState.sendingMessage(chatRoom: $chatRoom, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendingMessageImpl &&
            (identical(other.chatRoom, chatRoom) ||
                other.chatRoom == chatRoom) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    chatRoom,
    const DeepCollectionEquality().hash(_messages),
  );

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendingMessageImplCopyWith<_$SendingMessageImpl> get copyWith =>
      __$$SendingMessageImplCopyWithImpl<_$SendingMessageImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ChatRoom chatRoom, List<Message> messages) loaded,
    required TResult Function(ChatRoom chatRoom, List<Message> messages)
    refreshing,
    required TResult Function(ChatRoom chatRoom, List<Message> messages)
    sendingMessage,
    required TResult Function(
      ChatRoom chatRoom,
      List<Message> messages,
      String error,
    )
    sendMessageFailure,
    required TResult Function(String message) failure,
  }) {
    return sendingMessage(chatRoom, messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)? loaded,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)? refreshing,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)?
    sendingMessage,
    TResult? Function(ChatRoom chatRoom, List<Message> messages, String error)?
    sendMessageFailure,
    TResult? Function(String message)? failure,
  }) {
    return sendingMessage?.call(chatRoom, messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? loaded,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? refreshing,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? sendingMessage,
    TResult Function(ChatRoom chatRoom, List<Message> messages, String error)?
    sendMessageFailure,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (sendingMessage != null) {
      return sendingMessage(chatRoom, messages);
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
    required TResult Function(_SendingMessage value) sendingMessage,
    required TResult Function(_SendMessageFailure value) sendMessageFailure,
    required TResult Function(_Failure value) failure,
  }) {
    return sendingMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Refreshing value)? refreshing,
    TResult? Function(_SendingMessage value)? sendingMessage,
    TResult? Function(_SendMessageFailure value)? sendMessageFailure,
    TResult? Function(_Failure value)? failure,
  }) {
    return sendingMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_SendingMessage value)? sendingMessage,
    TResult Function(_SendMessageFailure value)? sendMessageFailure,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (sendingMessage != null) {
      return sendingMessage(this);
    }
    return orElse();
  }
}

abstract class _SendingMessage implements ChatState {
  const factory _SendingMessage(
    final ChatRoom chatRoom,
    final List<Message> messages,
  ) = _$SendingMessageImpl;

  ChatRoom get chatRoom;
  List<Message> get messages;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendingMessageImplCopyWith<_$SendingMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendMessageFailureImplCopyWith<$Res> {
  factory _$$SendMessageFailureImplCopyWith(
    _$SendMessageFailureImpl value,
    $Res Function(_$SendMessageFailureImpl) then,
  ) = __$$SendMessageFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatRoom chatRoom, List<Message> messages, String error});
}

/// @nodoc
class __$$SendMessageFailureImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$SendMessageFailureImpl>
    implements _$$SendMessageFailureImplCopyWith<$Res> {
  __$$SendMessageFailureImplCopyWithImpl(
    _$SendMessageFailureImpl _value,
    $Res Function(_$SendMessageFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoom = null,
    Object? messages = null,
    Object? error = null,
  }) {
    return _then(
      _$SendMessageFailureImpl(
        null == chatRoom
            ? _value.chatRoom
            : chatRoom // ignore: cast_nullable_to_non_nullable
                as ChatRoom,
        null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                as List<Message>,
        null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$SendMessageFailureImpl implements _SendMessageFailure {
  const _$SendMessageFailureImpl(
    this.chatRoom,
    final List<Message> messages,
    this.error,
  ) : _messages = messages;

  @override
  final ChatRoom chatRoom;
  final List<Message> _messages;
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final String error;

  @override
  String toString() {
    return 'ChatState.sendMessageFailure(chatRoom: $chatRoom, messages: $messages, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageFailureImpl &&
            (identical(other.chatRoom, chatRoom) ||
                other.chatRoom == chatRoom) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    chatRoom,
    const DeepCollectionEquality().hash(_messages),
    error,
  );

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageFailureImplCopyWith<_$SendMessageFailureImpl> get copyWith =>
      __$$SendMessageFailureImplCopyWithImpl<_$SendMessageFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ChatRoom chatRoom, List<Message> messages) loaded,
    required TResult Function(ChatRoom chatRoom, List<Message> messages)
    refreshing,
    required TResult Function(ChatRoom chatRoom, List<Message> messages)
    sendingMessage,
    required TResult Function(
      ChatRoom chatRoom,
      List<Message> messages,
      String error,
    )
    sendMessageFailure,
    required TResult Function(String message) failure,
  }) {
    return sendMessageFailure(chatRoom, messages, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)? loaded,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)? refreshing,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)?
    sendingMessage,
    TResult? Function(ChatRoom chatRoom, List<Message> messages, String error)?
    sendMessageFailure,
    TResult? Function(String message)? failure,
  }) {
    return sendMessageFailure?.call(chatRoom, messages, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? loaded,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? refreshing,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? sendingMessage,
    TResult Function(ChatRoom chatRoom, List<Message> messages, String error)?
    sendMessageFailure,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (sendMessageFailure != null) {
      return sendMessageFailure(chatRoom, messages, error);
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
    required TResult Function(_SendingMessage value) sendingMessage,
    required TResult Function(_SendMessageFailure value) sendMessageFailure,
    required TResult Function(_Failure value) failure,
  }) {
    return sendMessageFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Refreshing value)? refreshing,
    TResult? Function(_SendingMessage value)? sendingMessage,
    TResult? Function(_SendMessageFailure value)? sendMessageFailure,
    TResult? Function(_Failure value)? failure,
  }) {
    return sendMessageFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_SendingMessage value)? sendingMessage,
    TResult Function(_SendMessageFailure value)? sendMessageFailure,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (sendMessageFailure != null) {
      return sendMessageFailure(this);
    }
    return orElse();
  }
}

abstract class _SendMessageFailure implements ChatState {
  const factory _SendMessageFailure(
    final ChatRoom chatRoom,
    final List<Message> messages,
    final String error,
  ) = _$SendMessageFailureImpl;

  ChatRoom get chatRoom;
  List<Message> get messages;
  String get error;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendMessageFailureImplCopyWith<_$SendMessageFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
    _$FailureImpl value,
    $Res Function(_$FailureImpl) then,
  ) = __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
    _$FailureImpl _value,
    $Res Function(_$FailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$FailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ChatState.failure(message: $message)';
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

  /// Create a copy of ChatState
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
    required TResult Function(ChatRoom chatRoom, List<Message> messages) loaded,
    required TResult Function(ChatRoom chatRoom, List<Message> messages)
    refreshing,
    required TResult Function(ChatRoom chatRoom, List<Message> messages)
    sendingMessage,
    required TResult Function(
      ChatRoom chatRoom,
      List<Message> messages,
      String error,
    )
    sendMessageFailure,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)? loaded,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)? refreshing,
    TResult? Function(ChatRoom chatRoom, List<Message> messages)?
    sendingMessage,
    TResult? Function(ChatRoom chatRoom, List<Message> messages, String error)?
    sendMessageFailure,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? loaded,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? refreshing,
    TResult Function(ChatRoom chatRoom, List<Message> messages)? sendingMessage,
    TResult Function(ChatRoom chatRoom, List<Message> messages, String error)?
    sendMessageFailure,
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
    required TResult Function(_SendingMessage value) sendingMessage,
    required TResult Function(_SendMessageFailure value) sendMessageFailure,
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
    TResult? Function(_SendingMessage value)? sendingMessage,
    TResult? Function(_SendMessageFailure value)? sendMessageFailure,
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
    TResult Function(_SendingMessage value)? sendingMessage,
    TResult Function(_SendMessageFailure value)? sendMessageFailure,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements ChatState {
  const factory _Failure(final String message) = _$FailureImpl;

  String get message;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
