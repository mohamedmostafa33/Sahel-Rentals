// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chalet_browse_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChaletBrowseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() loadMoreChalets,
    required TResult Function() refreshChalets,
    required TResult Function(int chaletId) loadChaletDetail,
    required TResult Function(String query) searchChalets,
    required TResult Function() restoreChaletsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? loadMoreChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(int chaletId)? loadChaletDetail,
    TResult? Function(String query)? searchChalets,
    TResult? Function()? restoreChaletsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? loadMoreChalets,
    TResult Function()? refreshChalets,
    TResult Function(int chaletId)? loadChaletDetail,
    TResult Function(String query)? searchChalets,
    TResult Function()? restoreChaletsList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChaletsEvent value) loadChalets,
    required TResult Function(LoadMoreChaletsEvent value) loadMoreChalets,
    required TResult Function(RefreshChaletsEvent value) refreshChalets,
    required TResult Function(LoadChaletDetailEvent value) loadChaletDetail,
    required TResult Function(SearchChaletsEvent value) searchChalets,
    required TResult Function(RestoreChaletsListEvent value) restoreChaletsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChaletsEvent value)? loadChalets,
    TResult? Function(LoadMoreChaletsEvent value)? loadMoreChalets,
    TResult? Function(RefreshChaletsEvent value)? refreshChalets,
    TResult? Function(LoadChaletDetailEvent value)? loadChaletDetail,
    TResult? Function(SearchChaletsEvent value)? searchChalets,
    TResult? Function(RestoreChaletsListEvent value)? restoreChaletsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChaletsEvent value)? loadChalets,
    TResult Function(LoadMoreChaletsEvent value)? loadMoreChalets,
    TResult Function(RefreshChaletsEvent value)? refreshChalets,
    TResult Function(LoadChaletDetailEvent value)? loadChaletDetail,
    TResult Function(SearchChaletsEvent value)? searchChalets,
    TResult Function(RestoreChaletsListEvent value)? restoreChaletsList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChaletBrowseEventCopyWith<$Res> {
  factory $ChaletBrowseEventCopyWith(
          ChaletBrowseEvent value, $Res Function(ChaletBrowseEvent) then) =
      _$ChaletBrowseEventCopyWithImpl<$Res, ChaletBrowseEvent>;
}

/// @nodoc
class _$ChaletBrowseEventCopyWithImpl<$Res, $Val extends ChaletBrowseEvent>
    implements $ChaletBrowseEventCopyWith<$Res> {
  _$ChaletBrowseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChaletBrowseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadChaletsEventImplCopyWith<$Res> {
  factory _$$LoadChaletsEventImplCopyWith(_$LoadChaletsEventImpl value,
          $Res Function(_$LoadChaletsEventImpl) then) =
      __$$LoadChaletsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadChaletsEventImplCopyWithImpl<$Res>
    extends _$ChaletBrowseEventCopyWithImpl<$Res, _$LoadChaletsEventImpl>
    implements _$$LoadChaletsEventImplCopyWith<$Res> {
  __$$LoadChaletsEventImplCopyWithImpl(_$LoadChaletsEventImpl _value,
      $Res Function(_$LoadChaletsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletBrowseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadChaletsEventImpl implements LoadChaletsEvent {
  const _$LoadChaletsEventImpl();

  @override
  String toString() {
    return 'ChaletBrowseEvent.loadChalets()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadChaletsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() loadMoreChalets,
    required TResult Function() refreshChalets,
    required TResult Function(int chaletId) loadChaletDetail,
    required TResult Function(String query) searchChalets,
    required TResult Function() restoreChaletsList,
  }) {
    return loadChalets();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? loadMoreChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(int chaletId)? loadChaletDetail,
    TResult? Function(String query)? searchChalets,
    TResult? Function()? restoreChaletsList,
  }) {
    return loadChalets?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? loadMoreChalets,
    TResult Function()? refreshChalets,
    TResult Function(int chaletId)? loadChaletDetail,
    TResult Function(String query)? searchChalets,
    TResult Function()? restoreChaletsList,
    required TResult orElse(),
  }) {
    if (loadChalets != null) {
      return loadChalets();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChaletsEvent value) loadChalets,
    required TResult Function(LoadMoreChaletsEvent value) loadMoreChalets,
    required TResult Function(RefreshChaletsEvent value) refreshChalets,
    required TResult Function(LoadChaletDetailEvent value) loadChaletDetail,
    required TResult Function(SearchChaletsEvent value) searchChalets,
    required TResult Function(RestoreChaletsListEvent value) restoreChaletsList,
  }) {
    return loadChalets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChaletsEvent value)? loadChalets,
    TResult? Function(LoadMoreChaletsEvent value)? loadMoreChalets,
    TResult? Function(RefreshChaletsEvent value)? refreshChalets,
    TResult? Function(LoadChaletDetailEvent value)? loadChaletDetail,
    TResult? Function(SearchChaletsEvent value)? searchChalets,
    TResult? Function(RestoreChaletsListEvent value)? restoreChaletsList,
  }) {
    return loadChalets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChaletsEvent value)? loadChalets,
    TResult Function(LoadMoreChaletsEvent value)? loadMoreChalets,
    TResult Function(RefreshChaletsEvent value)? refreshChalets,
    TResult Function(LoadChaletDetailEvent value)? loadChaletDetail,
    TResult Function(SearchChaletsEvent value)? searchChalets,
    TResult Function(RestoreChaletsListEvent value)? restoreChaletsList,
    required TResult orElse(),
  }) {
    if (loadChalets != null) {
      return loadChalets(this);
    }
    return orElse();
  }
}

abstract class LoadChaletsEvent implements ChaletBrowseEvent {
  const factory LoadChaletsEvent() = _$LoadChaletsEventImpl;
}

/// @nodoc
abstract class _$$LoadMoreChaletsEventImplCopyWith<$Res> {
  factory _$$LoadMoreChaletsEventImplCopyWith(_$LoadMoreChaletsEventImpl value,
          $Res Function(_$LoadMoreChaletsEventImpl) then) =
      __$$LoadMoreChaletsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreChaletsEventImplCopyWithImpl<$Res>
    extends _$ChaletBrowseEventCopyWithImpl<$Res, _$LoadMoreChaletsEventImpl>
    implements _$$LoadMoreChaletsEventImplCopyWith<$Res> {
  __$$LoadMoreChaletsEventImplCopyWithImpl(_$LoadMoreChaletsEventImpl _value,
      $Res Function(_$LoadMoreChaletsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletBrowseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadMoreChaletsEventImpl implements LoadMoreChaletsEvent {
  const _$LoadMoreChaletsEventImpl();

  @override
  String toString() {
    return 'ChaletBrowseEvent.loadMoreChalets()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreChaletsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() loadMoreChalets,
    required TResult Function() refreshChalets,
    required TResult Function(int chaletId) loadChaletDetail,
    required TResult Function(String query) searchChalets,
    required TResult Function() restoreChaletsList,
  }) {
    return loadMoreChalets();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? loadMoreChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(int chaletId)? loadChaletDetail,
    TResult? Function(String query)? searchChalets,
    TResult? Function()? restoreChaletsList,
  }) {
    return loadMoreChalets?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? loadMoreChalets,
    TResult Function()? refreshChalets,
    TResult Function(int chaletId)? loadChaletDetail,
    TResult Function(String query)? searchChalets,
    TResult Function()? restoreChaletsList,
    required TResult orElse(),
  }) {
    if (loadMoreChalets != null) {
      return loadMoreChalets();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChaletsEvent value) loadChalets,
    required TResult Function(LoadMoreChaletsEvent value) loadMoreChalets,
    required TResult Function(RefreshChaletsEvent value) refreshChalets,
    required TResult Function(LoadChaletDetailEvent value) loadChaletDetail,
    required TResult Function(SearchChaletsEvent value) searchChalets,
    required TResult Function(RestoreChaletsListEvent value) restoreChaletsList,
  }) {
    return loadMoreChalets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChaletsEvent value)? loadChalets,
    TResult? Function(LoadMoreChaletsEvent value)? loadMoreChalets,
    TResult? Function(RefreshChaletsEvent value)? refreshChalets,
    TResult? Function(LoadChaletDetailEvent value)? loadChaletDetail,
    TResult? Function(SearchChaletsEvent value)? searchChalets,
    TResult? Function(RestoreChaletsListEvent value)? restoreChaletsList,
  }) {
    return loadMoreChalets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChaletsEvent value)? loadChalets,
    TResult Function(LoadMoreChaletsEvent value)? loadMoreChalets,
    TResult Function(RefreshChaletsEvent value)? refreshChalets,
    TResult Function(LoadChaletDetailEvent value)? loadChaletDetail,
    TResult Function(SearchChaletsEvent value)? searchChalets,
    TResult Function(RestoreChaletsListEvent value)? restoreChaletsList,
    required TResult orElse(),
  }) {
    if (loadMoreChalets != null) {
      return loadMoreChalets(this);
    }
    return orElse();
  }
}

abstract class LoadMoreChaletsEvent implements ChaletBrowseEvent {
  const factory LoadMoreChaletsEvent() = _$LoadMoreChaletsEventImpl;
}

/// @nodoc
abstract class _$$RefreshChaletsEventImplCopyWith<$Res> {
  factory _$$RefreshChaletsEventImplCopyWith(_$RefreshChaletsEventImpl value,
          $Res Function(_$RefreshChaletsEventImpl) then) =
      __$$RefreshChaletsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshChaletsEventImplCopyWithImpl<$Res>
    extends _$ChaletBrowseEventCopyWithImpl<$Res, _$RefreshChaletsEventImpl>
    implements _$$RefreshChaletsEventImplCopyWith<$Res> {
  __$$RefreshChaletsEventImplCopyWithImpl(_$RefreshChaletsEventImpl _value,
      $Res Function(_$RefreshChaletsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletBrowseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshChaletsEventImpl implements RefreshChaletsEvent {
  const _$RefreshChaletsEventImpl();

  @override
  String toString() {
    return 'ChaletBrowseEvent.refreshChalets()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshChaletsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() loadMoreChalets,
    required TResult Function() refreshChalets,
    required TResult Function(int chaletId) loadChaletDetail,
    required TResult Function(String query) searchChalets,
    required TResult Function() restoreChaletsList,
  }) {
    return refreshChalets();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? loadMoreChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(int chaletId)? loadChaletDetail,
    TResult? Function(String query)? searchChalets,
    TResult? Function()? restoreChaletsList,
  }) {
    return refreshChalets?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? loadMoreChalets,
    TResult Function()? refreshChalets,
    TResult Function(int chaletId)? loadChaletDetail,
    TResult Function(String query)? searchChalets,
    TResult Function()? restoreChaletsList,
    required TResult orElse(),
  }) {
    if (refreshChalets != null) {
      return refreshChalets();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChaletsEvent value) loadChalets,
    required TResult Function(LoadMoreChaletsEvent value) loadMoreChalets,
    required TResult Function(RefreshChaletsEvent value) refreshChalets,
    required TResult Function(LoadChaletDetailEvent value) loadChaletDetail,
    required TResult Function(SearchChaletsEvent value) searchChalets,
    required TResult Function(RestoreChaletsListEvent value) restoreChaletsList,
  }) {
    return refreshChalets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChaletsEvent value)? loadChalets,
    TResult? Function(LoadMoreChaletsEvent value)? loadMoreChalets,
    TResult? Function(RefreshChaletsEvent value)? refreshChalets,
    TResult? Function(LoadChaletDetailEvent value)? loadChaletDetail,
    TResult? Function(SearchChaletsEvent value)? searchChalets,
    TResult? Function(RestoreChaletsListEvent value)? restoreChaletsList,
  }) {
    return refreshChalets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChaletsEvent value)? loadChalets,
    TResult Function(LoadMoreChaletsEvent value)? loadMoreChalets,
    TResult Function(RefreshChaletsEvent value)? refreshChalets,
    TResult Function(LoadChaletDetailEvent value)? loadChaletDetail,
    TResult Function(SearchChaletsEvent value)? searchChalets,
    TResult Function(RestoreChaletsListEvent value)? restoreChaletsList,
    required TResult orElse(),
  }) {
    if (refreshChalets != null) {
      return refreshChalets(this);
    }
    return orElse();
  }
}

abstract class RefreshChaletsEvent implements ChaletBrowseEvent {
  const factory RefreshChaletsEvent() = _$RefreshChaletsEventImpl;
}

/// @nodoc
abstract class _$$LoadChaletDetailEventImplCopyWith<$Res> {
  factory _$$LoadChaletDetailEventImplCopyWith(
          _$LoadChaletDetailEventImpl value,
          $Res Function(_$LoadChaletDetailEventImpl) then) =
      __$$LoadChaletDetailEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int chaletId});
}

/// @nodoc
class __$$LoadChaletDetailEventImplCopyWithImpl<$Res>
    extends _$ChaletBrowseEventCopyWithImpl<$Res, _$LoadChaletDetailEventImpl>
    implements _$$LoadChaletDetailEventImplCopyWith<$Res> {
  __$$LoadChaletDetailEventImplCopyWithImpl(_$LoadChaletDetailEventImpl _value,
      $Res Function(_$LoadChaletDetailEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletBrowseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chaletId = null,
  }) {
    return _then(_$LoadChaletDetailEventImpl(
      null == chaletId
          ? _value.chaletId
          : chaletId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadChaletDetailEventImpl implements LoadChaletDetailEvent {
  const _$LoadChaletDetailEventImpl(this.chaletId);

  @override
  final int chaletId;

  @override
  String toString() {
    return 'ChaletBrowseEvent.loadChaletDetail(chaletId: $chaletId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadChaletDetailEventImpl &&
            (identical(other.chaletId, chaletId) ||
                other.chaletId == chaletId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chaletId);

  /// Create a copy of ChaletBrowseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadChaletDetailEventImplCopyWith<_$LoadChaletDetailEventImpl>
      get copyWith => __$$LoadChaletDetailEventImplCopyWithImpl<
          _$LoadChaletDetailEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() loadMoreChalets,
    required TResult Function() refreshChalets,
    required TResult Function(int chaletId) loadChaletDetail,
    required TResult Function(String query) searchChalets,
    required TResult Function() restoreChaletsList,
  }) {
    return loadChaletDetail(chaletId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? loadMoreChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(int chaletId)? loadChaletDetail,
    TResult? Function(String query)? searchChalets,
    TResult? Function()? restoreChaletsList,
  }) {
    return loadChaletDetail?.call(chaletId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? loadMoreChalets,
    TResult Function()? refreshChalets,
    TResult Function(int chaletId)? loadChaletDetail,
    TResult Function(String query)? searchChalets,
    TResult Function()? restoreChaletsList,
    required TResult orElse(),
  }) {
    if (loadChaletDetail != null) {
      return loadChaletDetail(chaletId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChaletsEvent value) loadChalets,
    required TResult Function(LoadMoreChaletsEvent value) loadMoreChalets,
    required TResult Function(RefreshChaletsEvent value) refreshChalets,
    required TResult Function(LoadChaletDetailEvent value) loadChaletDetail,
    required TResult Function(SearchChaletsEvent value) searchChalets,
    required TResult Function(RestoreChaletsListEvent value) restoreChaletsList,
  }) {
    return loadChaletDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChaletsEvent value)? loadChalets,
    TResult? Function(LoadMoreChaletsEvent value)? loadMoreChalets,
    TResult? Function(RefreshChaletsEvent value)? refreshChalets,
    TResult? Function(LoadChaletDetailEvent value)? loadChaletDetail,
    TResult? Function(SearchChaletsEvent value)? searchChalets,
    TResult? Function(RestoreChaletsListEvent value)? restoreChaletsList,
  }) {
    return loadChaletDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChaletsEvent value)? loadChalets,
    TResult Function(LoadMoreChaletsEvent value)? loadMoreChalets,
    TResult Function(RefreshChaletsEvent value)? refreshChalets,
    TResult Function(LoadChaletDetailEvent value)? loadChaletDetail,
    TResult Function(SearchChaletsEvent value)? searchChalets,
    TResult Function(RestoreChaletsListEvent value)? restoreChaletsList,
    required TResult orElse(),
  }) {
    if (loadChaletDetail != null) {
      return loadChaletDetail(this);
    }
    return orElse();
  }
}

abstract class LoadChaletDetailEvent implements ChaletBrowseEvent {
  const factory LoadChaletDetailEvent(final int chaletId) =
      _$LoadChaletDetailEventImpl;

  int get chaletId;

  /// Create a copy of ChaletBrowseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadChaletDetailEventImplCopyWith<_$LoadChaletDetailEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchChaletsEventImplCopyWith<$Res> {
  factory _$$SearchChaletsEventImplCopyWith(_$SearchChaletsEventImpl value,
          $Res Function(_$SearchChaletsEventImpl) then) =
      __$$SearchChaletsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchChaletsEventImplCopyWithImpl<$Res>
    extends _$ChaletBrowseEventCopyWithImpl<$Res, _$SearchChaletsEventImpl>
    implements _$$SearchChaletsEventImplCopyWith<$Res> {
  __$$SearchChaletsEventImplCopyWithImpl(_$SearchChaletsEventImpl _value,
      $Res Function(_$SearchChaletsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletBrowseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchChaletsEventImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchChaletsEventImpl implements SearchChaletsEvent {
  const _$SearchChaletsEventImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'ChaletBrowseEvent.searchChalets(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchChaletsEventImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of ChaletBrowseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchChaletsEventImplCopyWith<_$SearchChaletsEventImpl> get copyWith =>
      __$$SearchChaletsEventImplCopyWithImpl<_$SearchChaletsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() loadMoreChalets,
    required TResult Function() refreshChalets,
    required TResult Function(int chaletId) loadChaletDetail,
    required TResult Function(String query) searchChalets,
    required TResult Function() restoreChaletsList,
  }) {
    return searchChalets(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? loadMoreChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(int chaletId)? loadChaletDetail,
    TResult? Function(String query)? searchChalets,
    TResult? Function()? restoreChaletsList,
  }) {
    return searchChalets?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? loadMoreChalets,
    TResult Function()? refreshChalets,
    TResult Function(int chaletId)? loadChaletDetail,
    TResult Function(String query)? searchChalets,
    TResult Function()? restoreChaletsList,
    required TResult orElse(),
  }) {
    if (searchChalets != null) {
      return searchChalets(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChaletsEvent value) loadChalets,
    required TResult Function(LoadMoreChaletsEvent value) loadMoreChalets,
    required TResult Function(RefreshChaletsEvent value) refreshChalets,
    required TResult Function(LoadChaletDetailEvent value) loadChaletDetail,
    required TResult Function(SearchChaletsEvent value) searchChalets,
    required TResult Function(RestoreChaletsListEvent value) restoreChaletsList,
  }) {
    return searchChalets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChaletsEvent value)? loadChalets,
    TResult? Function(LoadMoreChaletsEvent value)? loadMoreChalets,
    TResult? Function(RefreshChaletsEvent value)? refreshChalets,
    TResult? Function(LoadChaletDetailEvent value)? loadChaletDetail,
    TResult? Function(SearchChaletsEvent value)? searchChalets,
    TResult? Function(RestoreChaletsListEvent value)? restoreChaletsList,
  }) {
    return searchChalets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChaletsEvent value)? loadChalets,
    TResult Function(LoadMoreChaletsEvent value)? loadMoreChalets,
    TResult Function(RefreshChaletsEvent value)? refreshChalets,
    TResult Function(LoadChaletDetailEvent value)? loadChaletDetail,
    TResult Function(SearchChaletsEvent value)? searchChalets,
    TResult Function(RestoreChaletsListEvent value)? restoreChaletsList,
    required TResult orElse(),
  }) {
    if (searchChalets != null) {
      return searchChalets(this);
    }
    return orElse();
  }
}

abstract class SearchChaletsEvent implements ChaletBrowseEvent {
  const factory SearchChaletsEvent(final String query) =
      _$SearchChaletsEventImpl;

  String get query;

  /// Create a copy of ChaletBrowseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchChaletsEventImplCopyWith<_$SearchChaletsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RestoreChaletsListEventImplCopyWith<$Res> {
  factory _$$RestoreChaletsListEventImplCopyWith(
          _$RestoreChaletsListEventImpl value,
          $Res Function(_$RestoreChaletsListEventImpl) then) =
      __$$RestoreChaletsListEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RestoreChaletsListEventImplCopyWithImpl<$Res>
    extends _$ChaletBrowseEventCopyWithImpl<$Res, _$RestoreChaletsListEventImpl>
    implements _$$RestoreChaletsListEventImplCopyWith<$Res> {
  __$$RestoreChaletsListEventImplCopyWithImpl(
      _$RestoreChaletsListEventImpl _value,
      $Res Function(_$RestoreChaletsListEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletBrowseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RestoreChaletsListEventImpl implements RestoreChaletsListEvent {
  const _$RestoreChaletsListEventImpl();

  @override
  String toString() {
    return 'ChaletBrowseEvent.restoreChaletsList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestoreChaletsListEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() loadMoreChalets,
    required TResult Function() refreshChalets,
    required TResult Function(int chaletId) loadChaletDetail,
    required TResult Function(String query) searchChalets,
    required TResult Function() restoreChaletsList,
  }) {
    return restoreChaletsList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? loadMoreChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(int chaletId)? loadChaletDetail,
    TResult? Function(String query)? searchChalets,
    TResult? Function()? restoreChaletsList,
  }) {
    return restoreChaletsList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? loadMoreChalets,
    TResult Function()? refreshChalets,
    TResult Function(int chaletId)? loadChaletDetail,
    TResult Function(String query)? searchChalets,
    TResult Function()? restoreChaletsList,
    required TResult orElse(),
  }) {
    if (restoreChaletsList != null) {
      return restoreChaletsList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChaletsEvent value) loadChalets,
    required TResult Function(LoadMoreChaletsEvent value) loadMoreChalets,
    required TResult Function(RefreshChaletsEvent value) refreshChalets,
    required TResult Function(LoadChaletDetailEvent value) loadChaletDetail,
    required TResult Function(SearchChaletsEvent value) searchChalets,
    required TResult Function(RestoreChaletsListEvent value) restoreChaletsList,
  }) {
    return restoreChaletsList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChaletsEvent value)? loadChalets,
    TResult? Function(LoadMoreChaletsEvent value)? loadMoreChalets,
    TResult? Function(RefreshChaletsEvent value)? refreshChalets,
    TResult? Function(LoadChaletDetailEvent value)? loadChaletDetail,
    TResult? Function(SearchChaletsEvent value)? searchChalets,
    TResult? Function(RestoreChaletsListEvent value)? restoreChaletsList,
  }) {
    return restoreChaletsList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChaletsEvent value)? loadChalets,
    TResult Function(LoadMoreChaletsEvent value)? loadMoreChalets,
    TResult Function(RefreshChaletsEvent value)? refreshChalets,
    TResult Function(LoadChaletDetailEvent value)? loadChaletDetail,
    TResult Function(SearchChaletsEvent value)? searchChalets,
    TResult Function(RestoreChaletsListEvent value)? restoreChaletsList,
    required TResult orElse(),
  }) {
    if (restoreChaletsList != null) {
      return restoreChaletsList(this);
    }
    return orElse();
  }
}

abstract class RestoreChaletsListEvent implements ChaletBrowseEvent {
  const factory RestoreChaletsListEvent() = _$RestoreChaletsListEventImpl;
}

/// @nodoc
mixin _$ChaletBrowseState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)
        loaded,
    required TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)
        loadingMore,
    required TResult Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)
        chaletDetailLoaded,
    required TResult Function(String errorMessage) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loaded,
    TResult? Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loadingMore,
    TResult? Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)?
        chaletDetailLoaded,
    TResult? Function(String errorMessage)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loaded,
    TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loadingMore,
    TResult Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)?
        chaletDetailLoaded,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChaletBrowseInitial value) initial,
    required TResult Function(ChaletBrowseLoading value) loading,
    required TResult Function(ChaletBrowseLoaded value) loaded,
    required TResult Function(ChaletBrowseLoadingMore value) loadingMore,
    required TResult Function(ChaletDetailLoaded value) chaletDetailLoaded,
    required TResult Function(ChaletBrowseFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChaletBrowseInitial value)? initial,
    TResult? Function(ChaletBrowseLoading value)? loading,
    TResult? Function(ChaletBrowseLoaded value)? loaded,
    TResult? Function(ChaletBrowseLoadingMore value)? loadingMore,
    TResult? Function(ChaletDetailLoaded value)? chaletDetailLoaded,
    TResult? Function(ChaletBrowseFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChaletBrowseInitial value)? initial,
    TResult Function(ChaletBrowseLoading value)? loading,
    TResult Function(ChaletBrowseLoaded value)? loaded,
    TResult Function(ChaletBrowseLoadingMore value)? loadingMore,
    TResult Function(ChaletDetailLoaded value)? chaletDetailLoaded,
    TResult Function(ChaletBrowseFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChaletBrowseStateCopyWith<$Res> {
  factory $ChaletBrowseStateCopyWith(
          ChaletBrowseState value, $Res Function(ChaletBrowseState) then) =
      _$ChaletBrowseStateCopyWithImpl<$Res, ChaletBrowseState>;
}

/// @nodoc
class _$ChaletBrowseStateCopyWithImpl<$Res, $Val extends ChaletBrowseState>
    implements $ChaletBrowseStateCopyWith<$Res> {
  _$ChaletBrowseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChaletBrowseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ChaletBrowseInitialImplCopyWith<$Res> {
  factory _$$ChaletBrowseInitialImplCopyWith(_$ChaletBrowseInitialImpl value,
          $Res Function(_$ChaletBrowseInitialImpl) then) =
      __$$ChaletBrowseInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChaletBrowseInitialImplCopyWithImpl<$Res>
    extends _$ChaletBrowseStateCopyWithImpl<$Res, _$ChaletBrowseInitialImpl>
    implements _$$ChaletBrowseInitialImplCopyWith<$Res> {
  __$$ChaletBrowseInitialImplCopyWithImpl(_$ChaletBrowseInitialImpl _value,
      $Res Function(_$ChaletBrowseInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletBrowseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ChaletBrowseInitialImpl implements ChaletBrowseInitial {
  const _$ChaletBrowseInitialImpl();

  @override
  String toString() {
    return 'ChaletBrowseState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChaletBrowseInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)
        loaded,
    required TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)
        loadingMore,
    required TResult Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)
        chaletDetailLoaded,
    required TResult Function(String errorMessage) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loaded,
    TResult? Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loadingMore,
    TResult? Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)?
        chaletDetailLoaded,
    TResult? Function(String errorMessage)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loaded,
    TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loadingMore,
    TResult Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)?
        chaletDetailLoaded,
    TResult Function(String errorMessage)? failure,
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
    required TResult Function(ChaletBrowseInitial value) initial,
    required TResult Function(ChaletBrowseLoading value) loading,
    required TResult Function(ChaletBrowseLoaded value) loaded,
    required TResult Function(ChaletBrowseLoadingMore value) loadingMore,
    required TResult Function(ChaletDetailLoaded value) chaletDetailLoaded,
    required TResult Function(ChaletBrowseFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChaletBrowseInitial value)? initial,
    TResult? Function(ChaletBrowseLoading value)? loading,
    TResult? Function(ChaletBrowseLoaded value)? loaded,
    TResult? Function(ChaletBrowseLoadingMore value)? loadingMore,
    TResult? Function(ChaletDetailLoaded value)? chaletDetailLoaded,
    TResult? Function(ChaletBrowseFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChaletBrowseInitial value)? initial,
    TResult Function(ChaletBrowseLoading value)? loading,
    TResult Function(ChaletBrowseLoaded value)? loaded,
    TResult Function(ChaletBrowseLoadingMore value)? loadingMore,
    TResult Function(ChaletDetailLoaded value)? chaletDetailLoaded,
    TResult Function(ChaletBrowseFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ChaletBrowseInitial implements ChaletBrowseState {
  const factory ChaletBrowseInitial() = _$ChaletBrowseInitialImpl;
}

/// @nodoc
abstract class _$$ChaletBrowseLoadingImplCopyWith<$Res> {
  factory _$$ChaletBrowseLoadingImplCopyWith(_$ChaletBrowseLoadingImpl value,
          $Res Function(_$ChaletBrowseLoadingImpl) then) =
      __$$ChaletBrowseLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChaletBrowseLoadingImplCopyWithImpl<$Res>
    extends _$ChaletBrowseStateCopyWithImpl<$Res, _$ChaletBrowseLoadingImpl>
    implements _$$ChaletBrowseLoadingImplCopyWith<$Res> {
  __$$ChaletBrowseLoadingImplCopyWithImpl(_$ChaletBrowseLoadingImpl _value,
      $Res Function(_$ChaletBrowseLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletBrowseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ChaletBrowseLoadingImpl implements ChaletBrowseLoading {
  const _$ChaletBrowseLoadingImpl();

  @override
  String toString() {
    return 'ChaletBrowseState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChaletBrowseLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)
        loaded,
    required TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)
        loadingMore,
    required TResult Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)
        chaletDetailLoaded,
    required TResult Function(String errorMessage) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loaded,
    TResult? Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loadingMore,
    TResult? Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)?
        chaletDetailLoaded,
    TResult? Function(String errorMessage)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loaded,
    TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loadingMore,
    TResult Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)?
        chaletDetailLoaded,
    TResult Function(String errorMessage)? failure,
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
    required TResult Function(ChaletBrowseInitial value) initial,
    required TResult Function(ChaletBrowseLoading value) loading,
    required TResult Function(ChaletBrowseLoaded value) loaded,
    required TResult Function(ChaletBrowseLoadingMore value) loadingMore,
    required TResult Function(ChaletDetailLoaded value) chaletDetailLoaded,
    required TResult Function(ChaletBrowseFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChaletBrowseInitial value)? initial,
    TResult? Function(ChaletBrowseLoading value)? loading,
    TResult? Function(ChaletBrowseLoaded value)? loaded,
    TResult? Function(ChaletBrowseLoadingMore value)? loadingMore,
    TResult? Function(ChaletDetailLoaded value)? chaletDetailLoaded,
    TResult? Function(ChaletBrowseFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChaletBrowseInitial value)? initial,
    TResult Function(ChaletBrowseLoading value)? loading,
    TResult Function(ChaletBrowseLoaded value)? loaded,
    TResult Function(ChaletBrowseLoadingMore value)? loadingMore,
    TResult Function(ChaletDetailLoaded value)? chaletDetailLoaded,
    TResult Function(ChaletBrowseFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ChaletBrowseLoading implements ChaletBrowseState {
  const factory ChaletBrowseLoading() = _$ChaletBrowseLoadingImpl;
}

/// @nodoc
abstract class _$$ChaletBrowseLoadedImplCopyWith<$Res> {
  factory _$$ChaletBrowseLoadedImplCopyWith(_$ChaletBrowseLoadedImpl value,
          $Res Function(_$ChaletBrowseLoadedImpl) then) =
      __$$ChaletBrowseLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<PublicChaletModel> chalets, SimplePaginationInfo? paginationInfo});
}

/// @nodoc
class __$$ChaletBrowseLoadedImplCopyWithImpl<$Res>
    extends _$ChaletBrowseStateCopyWithImpl<$Res, _$ChaletBrowseLoadedImpl>
    implements _$$ChaletBrowseLoadedImplCopyWith<$Res> {
  __$$ChaletBrowseLoadedImplCopyWithImpl(_$ChaletBrowseLoadedImpl _value,
      $Res Function(_$ChaletBrowseLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletBrowseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chalets = null,
    Object? paginationInfo = freezed,
  }) {
    return _then(_$ChaletBrowseLoadedImpl(
      null == chalets
          ? _value._chalets
          : chalets // ignore: cast_nullable_to_non_nullable
              as List<PublicChaletModel>,
      freezed == paginationInfo
          ? _value.paginationInfo
          : paginationInfo // ignore: cast_nullable_to_non_nullable
              as SimplePaginationInfo?,
    ));
  }
}

/// @nodoc

class _$ChaletBrowseLoadedImpl implements ChaletBrowseLoaded {
  const _$ChaletBrowseLoadedImpl(
      final List<PublicChaletModel> chalets, this.paginationInfo)
      : _chalets = chalets;

  final List<PublicChaletModel> _chalets;
  @override
  List<PublicChaletModel> get chalets {
    if (_chalets is EqualUnmodifiableListView) return _chalets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chalets);
  }

  @override
  final SimplePaginationInfo? paginationInfo;

  @override
  String toString() {
    return 'ChaletBrowseState.loaded(chalets: $chalets, paginationInfo: $paginationInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChaletBrowseLoadedImpl &&
            const DeepCollectionEquality().equals(other._chalets, _chalets) &&
            (identical(other.paginationInfo, paginationInfo) ||
                other.paginationInfo == paginationInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_chalets), paginationInfo);

  /// Create a copy of ChaletBrowseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChaletBrowseLoadedImplCopyWith<_$ChaletBrowseLoadedImpl> get copyWith =>
      __$$ChaletBrowseLoadedImplCopyWithImpl<_$ChaletBrowseLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)
        loaded,
    required TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)
        loadingMore,
    required TResult Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)
        chaletDetailLoaded,
    required TResult Function(String errorMessage) failure,
  }) {
    return loaded(chalets, paginationInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loaded,
    TResult? Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loadingMore,
    TResult? Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)?
        chaletDetailLoaded,
    TResult? Function(String errorMessage)? failure,
  }) {
    return loaded?.call(chalets, paginationInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loaded,
    TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loadingMore,
    TResult Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)?
        chaletDetailLoaded,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(chalets, paginationInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChaletBrowseInitial value) initial,
    required TResult Function(ChaletBrowseLoading value) loading,
    required TResult Function(ChaletBrowseLoaded value) loaded,
    required TResult Function(ChaletBrowseLoadingMore value) loadingMore,
    required TResult Function(ChaletDetailLoaded value) chaletDetailLoaded,
    required TResult Function(ChaletBrowseFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChaletBrowseInitial value)? initial,
    TResult? Function(ChaletBrowseLoading value)? loading,
    TResult? Function(ChaletBrowseLoaded value)? loaded,
    TResult? Function(ChaletBrowseLoadingMore value)? loadingMore,
    TResult? Function(ChaletDetailLoaded value)? chaletDetailLoaded,
    TResult? Function(ChaletBrowseFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChaletBrowseInitial value)? initial,
    TResult Function(ChaletBrowseLoading value)? loading,
    TResult Function(ChaletBrowseLoaded value)? loaded,
    TResult Function(ChaletBrowseLoadingMore value)? loadingMore,
    TResult Function(ChaletDetailLoaded value)? chaletDetailLoaded,
    TResult Function(ChaletBrowseFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ChaletBrowseLoaded implements ChaletBrowseState {
  const factory ChaletBrowseLoaded(final List<PublicChaletModel> chalets,
      final SimplePaginationInfo? paginationInfo) = _$ChaletBrowseLoadedImpl;

  List<PublicChaletModel> get chalets;
  SimplePaginationInfo? get paginationInfo;

  /// Create a copy of ChaletBrowseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChaletBrowseLoadedImplCopyWith<_$ChaletBrowseLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChaletBrowseLoadingMoreImplCopyWith<$Res> {
  factory _$$ChaletBrowseLoadingMoreImplCopyWith(
          _$ChaletBrowseLoadingMoreImpl value,
          $Res Function(_$ChaletBrowseLoadingMoreImpl) then) =
      __$$ChaletBrowseLoadingMoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<PublicChaletModel> chalets, SimplePaginationInfo? paginationInfo});
}

/// @nodoc
class __$$ChaletBrowseLoadingMoreImplCopyWithImpl<$Res>
    extends _$ChaletBrowseStateCopyWithImpl<$Res, _$ChaletBrowseLoadingMoreImpl>
    implements _$$ChaletBrowseLoadingMoreImplCopyWith<$Res> {
  __$$ChaletBrowseLoadingMoreImplCopyWithImpl(
      _$ChaletBrowseLoadingMoreImpl _value,
      $Res Function(_$ChaletBrowseLoadingMoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletBrowseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chalets = null,
    Object? paginationInfo = freezed,
  }) {
    return _then(_$ChaletBrowseLoadingMoreImpl(
      null == chalets
          ? _value._chalets
          : chalets // ignore: cast_nullable_to_non_nullable
              as List<PublicChaletModel>,
      freezed == paginationInfo
          ? _value.paginationInfo
          : paginationInfo // ignore: cast_nullable_to_non_nullable
              as SimplePaginationInfo?,
    ));
  }
}

/// @nodoc

class _$ChaletBrowseLoadingMoreImpl implements ChaletBrowseLoadingMore {
  const _$ChaletBrowseLoadingMoreImpl(
      final List<PublicChaletModel> chalets, this.paginationInfo)
      : _chalets = chalets;

  final List<PublicChaletModel> _chalets;
  @override
  List<PublicChaletModel> get chalets {
    if (_chalets is EqualUnmodifiableListView) return _chalets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chalets);
  }

  @override
  final SimplePaginationInfo? paginationInfo;

  @override
  String toString() {
    return 'ChaletBrowseState.loadingMore(chalets: $chalets, paginationInfo: $paginationInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChaletBrowseLoadingMoreImpl &&
            const DeepCollectionEquality().equals(other._chalets, _chalets) &&
            (identical(other.paginationInfo, paginationInfo) ||
                other.paginationInfo == paginationInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_chalets), paginationInfo);

  /// Create a copy of ChaletBrowseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChaletBrowseLoadingMoreImplCopyWith<_$ChaletBrowseLoadingMoreImpl>
      get copyWith => __$$ChaletBrowseLoadingMoreImplCopyWithImpl<
          _$ChaletBrowseLoadingMoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)
        loaded,
    required TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)
        loadingMore,
    required TResult Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)
        chaletDetailLoaded,
    required TResult Function(String errorMessage) failure,
  }) {
    return loadingMore(chalets, paginationInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loaded,
    TResult? Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loadingMore,
    TResult? Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)?
        chaletDetailLoaded,
    TResult? Function(String errorMessage)? failure,
  }) {
    return loadingMore?.call(chalets, paginationInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loaded,
    TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loadingMore,
    TResult Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)?
        chaletDetailLoaded,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(chalets, paginationInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChaletBrowseInitial value) initial,
    required TResult Function(ChaletBrowseLoading value) loading,
    required TResult Function(ChaletBrowseLoaded value) loaded,
    required TResult Function(ChaletBrowseLoadingMore value) loadingMore,
    required TResult Function(ChaletDetailLoaded value) chaletDetailLoaded,
    required TResult Function(ChaletBrowseFailure value) failure,
  }) {
    return loadingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChaletBrowseInitial value)? initial,
    TResult? Function(ChaletBrowseLoading value)? loading,
    TResult? Function(ChaletBrowseLoaded value)? loaded,
    TResult? Function(ChaletBrowseLoadingMore value)? loadingMore,
    TResult? Function(ChaletDetailLoaded value)? chaletDetailLoaded,
    TResult? Function(ChaletBrowseFailure value)? failure,
  }) {
    return loadingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChaletBrowseInitial value)? initial,
    TResult Function(ChaletBrowseLoading value)? loading,
    TResult Function(ChaletBrowseLoaded value)? loaded,
    TResult Function(ChaletBrowseLoadingMore value)? loadingMore,
    TResult Function(ChaletDetailLoaded value)? chaletDetailLoaded,
    TResult Function(ChaletBrowseFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(this);
    }
    return orElse();
  }
}

abstract class ChaletBrowseLoadingMore implements ChaletBrowseState {
  const factory ChaletBrowseLoadingMore(final List<PublicChaletModel> chalets,
          final SimplePaginationInfo? paginationInfo) =
      _$ChaletBrowseLoadingMoreImpl;

  List<PublicChaletModel> get chalets;
  SimplePaginationInfo? get paginationInfo;

  /// Create a copy of ChaletBrowseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChaletBrowseLoadingMoreImplCopyWith<_$ChaletBrowseLoadingMoreImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChaletDetailLoadedImplCopyWith<$Res> {
  factory _$$ChaletDetailLoadedImplCopyWith(_$ChaletDetailLoadedImpl value,
          $Res Function(_$ChaletDetailLoadedImpl) then) =
      __$$ChaletDetailLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PublicChaletModel chalet,
      List<PublicChaletModel> previousList,
      SimplePaginationInfo? paginationInfo});

  $PublicChaletModelCopyWith<$Res> get chalet;
}

/// @nodoc
class __$$ChaletDetailLoadedImplCopyWithImpl<$Res>
    extends _$ChaletBrowseStateCopyWithImpl<$Res, _$ChaletDetailLoadedImpl>
    implements _$$ChaletDetailLoadedImplCopyWith<$Res> {
  __$$ChaletDetailLoadedImplCopyWithImpl(_$ChaletDetailLoadedImpl _value,
      $Res Function(_$ChaletDetailLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletBrowseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chalet = null,
    Object? previousList = null,
    Object? paginationInfo = freezed,
  }) {
    return _then(_$ChaletDetailLoadedImpl(
      null == chalet
          ? _value.chalet
          : chalet // ignore: cast_nullable_to_non_nullable
              as PublicChaletModel,
      null == previousList
          ? _value._previousList
          : previousList // ignore: cast_nullable_to_non_nullable
              as List<PublicChaletModel>,
      freezed == paginationInfo
          ? _value.paginationInfo
          : paginationInfo // ignore: cast_nullable_to_non_nullable
              as SimplePaginationInfo?,
    ));
  }

  /// Create a copy of ChaletBrowseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PublicChaletModelCopyWith<$Res> get chalet {
    return $PublicChaletModelCopyWith<$Res>(_value.chalet, (value) {
      return _then(_value.copyWith(chalet: value));
    });
  }
}

/// @nodoc

class _$ChaletDetailLoadedImpl implements ChaletDetailLoaded {
  const _$ChaletDetailLoadedImpl(this.chalet,
      final List<PublicChaletModel> previousList, this.paginationInfo)
      : _previousList = previousList;

  @override
  final PublicChaletModel chalet;
  final List<PublicChaletModel> _previousList;
  @override
  List<PublicChaletModel> get previousList {
    if (_previousList is EqualUnmodifiableListView) return _previousList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_previousList);
  }

  @override
  final SimplePaginationInfo? paginationInfo;

  @override
  String toString() {
    return 'ChaletBrowseState.chaletDetailLoaded(chalet: $chalet, previousList: $previousList, paginationInfo: $paginationInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChaletDetailLoadedImpl &&
            (identical(other.chalet, chalet) || other.chalet == chalet) &&
            const DeepCollectionEquality()
                .equals(other._previousList, _previousList) &&
            (identical(other.paginationInfo, paginationInfo) ||
                other.paginationInfo == paginationInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chalet,
      const DeepCollectionEquality().hash(_previousList), paginationInfo);

  /// Create a copy of ChaletBrowseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChaletDetailLoadedImplCopyWith<_$ChaletDetailLoadedImpl> get copyWith =>
      __$$ChaletDetailLoadedImplCopyWithImpl<_$ChaletDetailLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)
        loaded,
    required TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)
        loadingMore,
    required TResult Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)
        chaletDetailLoaded,
    required TResult Function(String errorMessage) failure,
  }) {
    return chaletDetailLoaded(chalet, previousList, paginationInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loaded,
    TResult? Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loadingMore,
    TResult? Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)?
        chaletDetailLoaded,
    TResult? Function(String errorMessage)? failure,
  }) {
    return chaletDetailLoaded?.call(chalet, previousList, paginationInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loaded,
    TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loadingMore,
    TResult Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)?
        chaletDetailLoaded,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (chaletDetailLoaded != null) {
      return chaletDetailLoaded(chalet, previousList, paginationInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChaletBrowseInitial value) initial,
    required TResult Function(ChaletBrowseLoading value) loading,
    required TResult Function(ChaletBrowseLoaded value) loaded,
    required TResult Function(ChaletBrowseLoadingMore value) loadingMore,
    required TResult Function(ChaletDetailLoaded value) chaletDetailLoaded,
    required TResult Function(ChaletBrowseFailure value) failure,
  }) {
    return chaletDetailLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChaletBrowseInitial value)? initial,
    TResult? Function(ChaletBrowseLoading value)? loading,
    TResult? Function(ChaletBrowseLoaded value)? loaded,
    TResult? Function(ChaletBrowseLoadingMore value)? loadingMore,
    TResult? Function(ChaletDetailLoaded value)? chaletDetailLoaded,
    TResult? Function(ChaletBrowseFailure value)? failure,
  }) {
    return chaletDetailLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChaletBrowseInitial value)? initial,
    TResult Function(ChaletBrowseLoading value)? loading,
    TResult Function(ChaletBrowseLoaded value)? loaded,
    TResult Function(ChaletBrowseLoadingMore value)? loadingMore,
    TResult Function(ChaletDetailLoaded value)? chaletDetailLoaded,
    TResult Function(ChaletBrowseFailure value)? failure,
    required TResult orElse(),
  }) {
    if (chaletDetailLoaded != null) {
      return chaletDetailLoaded(this);
    }
    return orElse();
  }
}

abstract class ChaletDetailLoaded implements ChaletBrowseState {
  const factory ChaletDetailLoaded(
      final PublicChaletModel chalet,
      final List<PublicChaletModel> previousList,
      final SimplePaginationInfo? paginationInfo) = _$ChaletDetailLoadedImpl;

  PublicChaletModel get chalet;
  List<PublicChaletModel> get previousList;
  SimplePaginationInfo? get paginationInfo;

  /// Create a copy of ChaletBrowseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChaletDetailLoadedImplCopyWith<_$ChaletDetailLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChaletBrowseFailureImplCopyWith<$Res> {
  factory _$$ChaletBrowseFailureImplCopyWith(_$ChaletBrowseFailureImpl value,
          $Res Function(_$ChaletBrowseFailureImpl) then) =
      __$$ChaletBrowseFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$ChaletBrowseFailureImplCopyWithImpl<$Res>
    extends _$ChaletBrowseStateCopyWithImpl<$Res, _$ChaletBrowseFailureImpl>
    implements _$$ChaletBrowseFailureImplCopyWith<$Res> {
  __$$ChaletBrowseFailureImplCopyWithImpl(_$ChaletBrowseFailureImpl _value,
      $Res Function(_$ChaletBrowseFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletBrowseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$ChaletBrowseFailureImpl(
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChaletBrowseFailureImpl implements ChaletBrowseFailure {
  const _$ChaletBrowseFailureImpl(this.errorMessage);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ChaletBrowseState.failure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChaletBrowseFailureImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of ChaletBrowseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChaletBrowseFailureImplCopyWith<_$ChaletBrowseFailureImpl> get copyWith =>
      __$$ChaletBrowseFailureImplCopyWithImpl<_$ChaletBrowseFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)
        loaded,
    required TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)
        loadingMore,
    required TResult Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)
        chaletDetailLoaded,
    required TResult Function(String errorMessage) failure,
  }) {
    return failure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loaded,
    TResult? Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loadingMore,
    TResult? Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)?
        chaletDetailLoaded,
    TResult? Function(String errorMessage)? failure,
  }) {
    return failure?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loaded,
    TResult Function(List<PublicChaletModel> chalets,
            SimplePaginationInfo? paginationInfo)?
        loadingMore,
    TResult Function(
            PublicChaletModel chalet,
            List<PublicChaletModel> previousList,
            SimplePaginationInfo? paginationInfo)?
        chaletDetailLoaded,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChaletBrowseInitial value) initial,
    required TResult Function(ChaletBrowseLoading value) loading,
    required TResult Function(ChaletBrowseLoaded value) loaded,
    required TResult Function(ChaletBrowseLoadingMore value) loadingMore,
    required TResult Function(ChaletDetailLoaded value) chaletDetailLoaded,
    required TResult Function(ChaletBrowseFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChaletBrowseInitial value)? initial,
    TResult? Function(ChaletBrowseLoading value)? loading,
    TResult? Function(ChaletBrowseLoaded value)? loaded,
    TResult? Function(ChaletBrowseLoadingMore value)? loadingMore,
    TResult? Function(ChaletDetailLoaded value)? chaletDetailLoaded,
    TResult? Function(ChaletBrowseFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChaletBrowseInitial value)? initial,
    TResult Function(ChaletBrowseLoading value)? loading,
    TResult Function(ChaletBrowseLoaded value)? loaded,
    TResult Function(ChaletBrowseLoadingMore value)? loadingMore,
    TResult Function(ChaletDetailLoaded value)? chaletDetailLoaded,
    TResult Function(ChaletBrowseFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class ChaletBrowseFailure implements ChaletBrowseState {
  const factory ChaletBrowseFailure(final String errorMessage) =
      _$ChaletBrowseFailureImpl;

  String get errorMessage;

  /// Create a copy of ChaletBrowseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChaletBrowseFailureImplCopyWith<_$ChaletBrowseFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
