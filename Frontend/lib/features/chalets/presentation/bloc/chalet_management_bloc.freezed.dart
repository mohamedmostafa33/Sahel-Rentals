// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chalet_management_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChaletManagementEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() refreshChalets,
    required TResult Function(ChaletCreateRequest request) createChalet,
    required TResult Function(int id, ChaletUpdateRequest request) updateChalet,
    required TResult Function(int id) deleteChalet,
    required TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)
        uploadImages,
    required TResult Function(int chaletId, int imageId) deleteImage,
    required TResult Function(int chaletId, int imageId) setMainImage,
    required TResult Function(int chaletId, bool isAvailable)
        toggleAvailability,
    required TResult Function(ChaletSortBy sortBy) sortChalets,
    required TResult Function(String query) searchChalets,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(ChaletCreateRequest request)? createChalet,
    TResult? Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult? Function(int id)? deleteChalet,
    TResult? Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult? Function(int chaletId, int imageId)? deleteImage,
    TResult? Function(int chaletId, int imageId)? setMainImage,
    TResult? Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult? Function(ChaletSortBy sortBy)? sortChalets,
    TResult? Function(String query)? searchChalets,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? refreshChalets,
    TResult Function(ChaletCreateRequest request)? createChalet,
    TResult Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult Function(int id)? deleteChalet,
    TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult Function(int chaletId, int imageId)? deleteImage,
    TResult Function(int chaletId, int imageId)? setMainImage,
    TResult Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult Function(ChaletSortBy sortBy)? sortChalets,
    TResult Function(String query)? searchChalets,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChalets value) loadChalets,
    required TResult Function(RefreshChalets value) refreshChalets,
    required TResult Function(CreateChalet value) createChalet,
    required TResult Function(UpdateChalet value) updateChalet,
    required TResult Function(DeleteChalet value) deleteChalet,
    required TResult Function(UploadImages value) uploadImages,
    required TResult Function(DeleteImage value) deleteImage,
    required TResult Function(SetMainImage value) setMainImage,
    required TResult Function(ToggleAvailability value) toggleAvailability,
    required TResult Function(SortChalets value) sortChalets,
    required TResult Function(SearchChalets value) searchChalets,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChalets value)? loadChalets,
    TResult? Function(RefreshChalets value)? refreshChalets,
    TResult? Function(CreateChalet value)? createChalet,
    TResult? Function(UpdateChalet value)? updateChalet,
    TResult? Function(DeleteChalet value)? deleteChalet,
    TResult? Function(UploadImages value)? uploadImages,
    TResult? Function(DeleteImage value)? deleteImage,
    TResult? Function(SetMainImage value)? setMainImage,
    TResult? Function(ToggleAvailability value)? toggleAvailability,
    TResult? Function(SortChalets value)? sortChalets,
    TResult? Function(SearchChalets value)? searchChalets,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChalets value)? loadChalets,
    TResult Function(RefreshChalets value)? refreshChalets,
    TResult Function(CreateChalet value)? createChalet,
    TResult Function(UpdateChalet value)? updateChalet,
    TResult Function(DeleteChalet value)? deleteChalet,
    TResult Function(UploadImages value)? uploadImages,
    TResult Function(DeleteImage value)? deleteImage,
    TResult Function(SetMainImage value)? setMainImage,
    TResult Function(ToggleAvailability value)? toggleAvailability,
    TResult Function(SortChalets value)? sortChalets,
    TResult Function(SearchChalets value)? searchChalets,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChaletManagementEventCopyWith<$Res> {
  factory $ChaletManagementEventCopyWith(ChaletManagementEvent value,
          $Res Function(ChaletManagementEvent) then) =
      _$ChaletManagementEventCopyWithImpl<$Res, ChaletManagementEvent>;
}

/// @nodoc
class _$ChaletManagementEventCopyWithImpl<$Res,
        $Val extends ChaletManagementEvent>
    implements $ChaletManagementEventCopyWith<$Res> {
  _$ChaletManagementEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadChaletsImplCopyWith<$Res> {
  factory _$$LoadChaletsImplCopyWith(
          _$LoadChaletsImpl value, $Res Function(_$LoadChaletsImpl) then) =
      __$$LoadChaletsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadChaletsImplCopyWithImpl<$Res>
    extends _$ChaletManagementEventCopyWithImpl<$Res, _$LoadChaletsImpl>
    implements _$$LoadChaletsImplCopyWith<$Res> {
  __$$LoadChaletsImplCopyWithImpl(
      _$LoadChaletsImpl _value, $Res Function(_$LoadChaletsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadChaletsImpl implements LoadChalets {
  const _$LoadChaletsImpl();

  @override
  String toString() {
    return 'ChaletManagementEvent.loadChalets()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadChaletsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() refreshChalets,
    required TResult Function(ChaletCreateRequest request) createChalet,
    required TResult Function(int id, ChaletUpdateRequest request) updateChalet,
    required TResult Function(int id) deleteChalet,
    required TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)
        uploadImages,
    required TResult Function(int chaletId, int imageId) deleteImage,
    required TResult Function(int chaletId, int imageId) setMainImage,
    required TResult Function(int chaletId, bool isAvailable)
        toggleAvailability,
    required TResult Function(ChaletSortBy sortBy) sortChalets,
    required TResult Function(String query) searchChalets,
  }) {
    return loadChalets();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(ChaletCreateRequest request)? createChalet,
    TResult? Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult? Function(int id)? deleteChalet,
    TResult? Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult? Function(int chaletId, int imageId)? deleteImage,
    TResult? Function(int chaletId, int imageId)? setMainImage,
    TResult? Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult? Function(ChaletSortBy sortBy)? sortChalets,
    TResult? Function(String query)? searchChalets,
  }) {
    return loadChalets?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? refreshChalets,
    TResult Function(ChaletCreateRequest request)? createChalet,
    TResult Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult Function(int id)? deleteChalet,
    TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult Function(int chaletId, int imageId)? deleteImage,
    TResult Function(int chaletId, int imageId)? setMainImage,
    TResult Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult Function(ChaletSortBy sortBy)? sortChalets,
    TResult Function(String query)? searchChalets,
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
    required TResult Function(LoadChalets value) loadChalets,
    required TResult Function(RefreshChalets value) refreshChalets,
    required TResult Function(CreateChalet value) createChalet,
    required TResult Function(UpdateChalet value) updateChalet,
    required TResult Function(DeleteChalet value) deleteChalet,
    required TResult Function(UploadImages value) uploadImages,
    required TResult Function(DeleteImage value) deleteImage,
    required TResult Function(SetMainImage value) setMainImage,
    required TResult Function(ToggleAvailability value) toggleAvailability,
    required TResult Function(SortChalets value) sortChalets,
    required TResult Function(SearchChalets value) searchChalets,
  }) {
    return loadChalets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChalets value)? loadChalets,
    TResult? Function(RefreshChalets value)? refreshChalets,
    TResult? Function(CreateChalet value)? createChalet,
    TResult? Function(UpdateChalet value)? updateChalet,
    TResult? Function(DeleteChalet value)? deleteChalet,
    TResult? Function(UploadImages value)? uploadImages,
    TResult? Function(DeleteImage value)? deleteImage,
    TResult? Function(SetMainImage value)? setMainImage,
    TResult? Function(ToggleAvailability value)? toggleAvailability,
    TResult? Function(SortChalets value)? sortChalets,
    TResult? Function(SearchChalets value)? searchChalets,
  }) {
    return loadChalets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChalets value)? loadChalets,
    TResult Function(RefreshChalets value)? refreshChalets,
    TResult Function(CreateChalet value)? createChalet,
    TResult Function(UpdateChalet value)? updateChalet,
    TResult Function(DeleteChalet value)? deleteChalet,
    TResult Function(UploadImages value)? uploadImages,
    TResult Function(DeleteImage value)? deleteImage,
    TResult Function(SetMainImage value)? setMainImage,
    TResult Function(ToggleAvailability value)? toggleAvailability,
    TResult Function(SortChalets value)? sortChalets,
    TResult Function(SearchChalets value)? searchChalets,
    required TResult orElse(),
  }) {
    if (loadChalets != null) {
      return loadChalets(this);
    }
    return orElse();
  }
}

abstract class LoadChalets implements ChaletManagementEvent {
  const factory LoadChalets() = _$LoadChaletsImpl;
}

/// @nodoc
abstract class _$$RefreshChaletsImplCopyWith<$Res> {
  factory _$$RefreshChaletsImplCopyWith(_$RefreshChaletsImpl value,
          $Res Function(_$RefreshChaletsImpl) then) =
      __$$RefreshChaletsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshChaletsImplCopyWithImpl<$Res>
    extends _$ChaletManagementEventCopyWithImpl<$Res, _$RefreshChaletsImpl>
    implements _$$RefreshChaletsImplCopyWith<$Res> {
  __$$RefreshChaletsImplCopyWithImpl(
      _$RefreshChaletsImpl _value, $Res Function(_$RefreshChaletsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshChaletsImpl implements RefreshChalets {
  const _$RefreshChaletsImpl();

  @override
  String toString() {
    return 'ChaletManagementEvent.refreshChalets()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshChaletsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() refreshChalets,
    required TResult Function(ChaletCreateRequest request) createChalet,
    required TResult Function(int id, ChaletUpdateRequest request) updateChalet,
    required TResult Function(int id) deleteChalet,
    required TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)
        uploadImages,
    required TResult Function(int chaletId, int imageId) deleteImage,
    required TResult Function(int chaletId, int imageId) setMainImage,
    required TResult Function(int chaletId, bool isAvailable)
        toggleAvailability,
    required TResult Function(ChaletSortBy sortBy) sortChalets,
    required TResult Function(String query) searchChalets,
  }) {
    return refreshChalets();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(ChaletCreateRequest request)? createChalet,
    TResult? Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult? Function(int id)? deleteChalet,
    TResult? Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult? Function(int chaletId, int imageId)? deleteImage,
    TResult? Function(int chaletId, int imageId)? setMainImage,
    TResult? Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult? Function(ChaletSortBy sortBy)? sortChalets,
    TResult? Function(String query)? searchChalets,
  }) {
    return refreshChalets?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? refreshChalets,
    TResult Function(ChaletCreateRequest request)? createChalet,
    TResult Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult Function(int id)? deleteChalet,
    TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult Function(int chaletId, int imageId)? deleteImage,
    TResult Function(int chaletId, int imageId)? setMainImage,
    TResult Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult Function(ChaletSortBy sortBy)? sortChalets,
    TResult Function(String query)? searchChalets,
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
    required TResult Function(LoadChalets value) loadChalets,
    required TResult Function(RefreshChalets value) refreshChalets,
    required TResult Function(CreateChalet value) createChalet,
    required TResult Function(UpdateChalet value) updateChalet,
    required TResult Function(DeleteChalet value) deleteChalet,
    required TResult Function(UploadImages value) uploadImages,
    required TResult Function(DeleteImage value) deleteImage,
    required TResult Function(SetMainImage value) setMainImage,
    required TResult Function(ToggleAvailability value) toggleAvailability,
    required TResult Function(SortChalets value) sortChalets,
    required TResult Function(SearchChalets value) searchChalets,
  }) {
    return refreshChalets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChalets value)? loadChalets,
    TResult? Function(RefreshChalets value)? refreshChalets,
    TResult? Function(CreateChalet value)? createChalet,
    TResult? Function(UpdateChalet value)? updateChalet,
    TResult? Function(DeleteChalet value)? deleteChalet,
    TResult? Function(UploadImages value)? uploadImages,
    TResult? Function(DeleteImage value)? deleteImage,
    TResult? Function(SetMainImage value)? setMainImage,
    TResult? Function(ToggleAvailability value)? toggleAvailability,
    TResult? Function(SortChalets value)? sortChalets,
    TResult? Function(SearchChalets value)? searchChalets,
  }) {
    return refreshChalets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChalets value)? loadChalets,
    TResult Function(RefreshChalets value)? refreshChalets,
    TResult Function(CreateChalet value)? createChalet,
    TResult Function(UpdateChalet value)? updateChalet,
    TResult Function(DeleteChalet value)? deleteChalet,
    TResult Function(UploadImages value)? uploadImages,
    TResult Function(DeleteImage value)? deleteImage,
    TResult Function(SetMainImage value)? setMainImage,
    TResult Function(ToggleAvailability value)? toggleAvailability,
    TResult Function(SortChalets value)? sortChalets,
    TResult Function(SearchChalets value)? searchChalets,
    required TResult orElse(),
  }) {
    if (refreshChalets != null) {
      return refreshChalets(this);
    }
    return orElse();
  }
}

abstract class RefreshChalets implements ChaletManagementEvent {
  const factory RefreshChalets() = _$RefreshChaletsImpl;
}

/// @nodoc
abstract class _$$CreateChaletImplCopyWith<$Res> {
  factory _$$CreateChaletImplCopyWith(
          _$CreateChaletImpl value, $Res Function(_$CreateChaletImpl) then) =
      __$$CreateChaletImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChaletCreateRequest request});
}

/// @nodoc
class __$$CreateChaletImplCopyWithImpl<$Res>
    extends _$ChaletManagementEventCopyWithImpl<$Res, _$CreateChaletImpl>
    implements _$$CreateChaletImplCopyWith<$Res> {
  __$$CreateChaletImplCopyWithImpl(
      _$CreateChaletImpl _value, $Res Function(_$CreateChaletImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$CreateChaletImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ChaletCreateRequest,
    ));
  }
}

/// @nodoc

class _$CreateChaletImpl implements CreateChalet {
  const _$CreateChaletImpl(this.request);

  @override
  final ChaletCreateRequest request;

  @override
  String toString() {
    return 'ChaletManagementEvent.createChalet(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateChaletImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateChaletImplCopyWith<_$CreateChaletImpl> get copyWith =>
      __$$CreateChaletImplCopyWithImpl<_$CreateChaletImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() refreshChalets,
    required TResult Function(ChaletCreateRequest request) createChalet,
    required TResult Function(int id, ChaletUpdateRequest request) updateChalet,
    required TResult Function(int id) deleteChalet,
    required TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)
        uploadImages,
    required TResult Function(int chaletId, int imageId) deleteImage,
    required TResult Function(int chaletId, int imageId) setMainImage,
    required TResult Function(int chaletId, bool isAvailable)
        toggleAvailability,
    required TResult Function(ChaletSortBy sortBy) sortChalets,
    required TResult Function(String query) searchChalets,
  }) {
    return createChalet(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(ChaletCreateRequest request)? createChalet,
    TResult? Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult? Function(int id)? deleteChalet,
    TResult? Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult? Function(int chaletId, int imageId)? deleteImage,
    TResult? Function(int chaletId, int imageId)? setMainImage,
    TResult? Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult? Function(ChaletSortBy sortBy)? sortChalets,
    TResult? Function(String query)? searchChalets,
  }) {
    return createChalet?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? refreshChalets,
    TResult Function(ChaletCreateRequest request)? createChalet,
    TResult Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult Function(int id)? deleteChalet,
    TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult Function(int chaletId, int imageId)? deleteImage,
    TResult Function(int chaletId, int imageId)? setMainImage,
    TResult Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult Function(ChaletSortBy sortBy)? sortChalets,
    TResult Function(String query)? searchChalets,
    required TResult orElse(),
  }) {
    if (createChalet != null) {
      return createChalet(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChalets value) loadChalets,
    required TResult Function(RefreshChalets value) refreshChalets,
    required TResult Function(CreateChalet value) createChalet,
    required TResult Function(UpdateChalet value) updateChalet,
    required TResult Function(DeleteChalet value) deleteChalet,
    required TResult Function(UploadImages value) uploadImages,
    required TResult Function(DeleteImage value) deleteImage,
    required TResult Function(SetMainImage value) setMainImage,
    required TResult Function(ToggleAvailability value) toggleAvailability,
    required TResult Function(SortChalets value) sortChalets,
    required TResult Function(SearchChalets value) searchChalets,
  }) {
    return createChalet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChalets value)? loadChalets,
    TResult? Function(RefreshChalets value)? refreshChalets,
    TResult? Function(CreateChalet value)? createChalet,
    TResult? Function(UpdateChalet value)? updateChalet,
    TResult? Function(DeleteChalet value)? deleteChalet,
    TResult? Function(UploadImages value)? uploadImages,
    TResult? Function(DeleteImage value)? deleteImage,
    TResult? Function(SetMainImage value)? setMainImage,
    TResult? Function(ToggleAvailability value)? toggleAvailability,
    TResult? Function(SortChalets value)? sortChalets,
    TResult? Function(SearchChalets value)? searchChalets,
  }) {
    return createChalet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChalets value)? loadChalets,
    TResult Function(RefreshChalets value)? refreshChalets,
    TResult Function(CreateChalet value)? createChalet,
    TResult Function(UpdateChalet value)? updateChalet,
    TResult Function(DeleteChalet value)? deleteChalet,
    TResult Function(UploadImages value)? uploadImages,
    TResult Function(DeleteImage value)? deleteImage,
    TResult Function(SetMainImage value)? setMainImage,
    TResult Function(ToggleAvailability value)? toggleAvailability,
    TResult Function(SortChalets value)? sortChalets,
    TResult Function(SearchChalets value)? searchChalets,
    required TResult orElse(),
  }) {
    if (createChalet != null) {
      return createChalet(this);
    }
    return orElse();
  }
}

abstract class CreateChalet implements ChaletManagementEvent {
  const factory CreateChalet(final ChaletCreateRequest request) =
      _$CreateChaletImpl;

  ChaletCreateRequest get request;

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateChaletImplCopyWith<_$CreateChaletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateChaletImplCopyWith<$Res> {
  factory _$$UpdateChaletImplCopyWith(
          _$UpdateChaletImpl value, $Res Function(_$UpdateChaletImpl) then) =
      __$$UpdateChaletImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, ChaletUpdateRequest request});
}

/// @nodoc
class __$$UpdateChaletImplCopyWithImpl<$Res>
    extends _$ChaletManagementEventCopyWithImpl<$Res, _$UpdateChaletImpl>
    implements _$$UpdateChaletImplCopyWith<$Res> {
  __$$UpdateChaletImplCopyWithImpl(
      _$UpdateChaletImpl _value, $Res Function(_$UpdateChaletImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
  }) {
    return _then(_$UpdateChaletImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ChaletUpdateRequest,
    ));
  }
}

/// @nodoc

class _$UpdateChaletImpl implements UpdateChalet {
  const _$UpdateChaletImpl(this.id, this.request);

  @override
  final int id;
  @override
  final ChaletUpdateRequest request;

  @override
  String toString() {
    return 'ChaletManagementEvent.updateChalet(id: $id, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateChaletImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, request);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateChaletImplCopyWith<_$UpdateChaletImpl> get copyWith =>
      __$$UpdateChaletImplCopyWithImpl<_$UpdateChaletImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() refreshChalets,
    required TResult Function(ChaletCreateRequest request) createChalet,
    required TResult Function(int id, ChaletUpdateRequest request) updateChalet,
    required TResult Function(int id) deleteChalet,
    required TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)
        uploadImages,
    required TResult Function(int chaletId, int imageId) deleteImage,
    required TResult Function(int chaletId, int imageId) setMainImage,
    required TResult Function(int chaletId, bool isAvailable)
        toggleAvailability,
    required TResult Function(ChaletSortBy sortBy) sortChalets,
    required TResult Function(String query) searchChalets,
  }) {
    return updateChalet(id, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(ChaletCreateRequest request)? createChalet,
    TResult? Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult? Function(int id)? deleteChalet,
    TResult? Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult? Function(int chaletId, int imageId)? deleteImage,
    TResult? Function(int chaletId, int imageId)? setMainImage,
    TResult? Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult? Function(ChaletSortBy sortBy)? sortChalets,
    TResult? Function(String query)? searchChalets,
  }) {
    return updateChalet?.call(id, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? refreshChalets,
    TResult Function(ChaletCreateRequest request)? createChalet,
    TResult Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult Function(int id)? deleteChalet,
    TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult Function(int chaletId, int imageId)? deleteImage,
    TResult Function(int chaletId, int imageId)? setMainImage,
    TResult Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult Function(ChaletSortBy sortBy)? sortChalets,
    TResult Function(String query)? searchChalets,
    required TResult orElse(),
  }) {
    if (updateChalet != null) {
      return updateChalet(id, request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChalets value) loadChalets,
    required TResult Function(RefreshChalets value) refreshChalets,
    required TResult Function(CreateChalet value) createChalet,
    required TResult Function(UpdateChalet value) updateChalet,
    required TResult Function(DeleteChalet value) deleteChalet,
    required TResult Function(UploadImages value) uploadImages,
    required TResult Function(DeleteImage value) deleteImage,
    required TResult Function(SetMainImage value) setMainImage,
    required TResult Function(ToggleAvailability value) toggleAvailability,
    required TResult Function(SortChalets value) sortChalets,
    required TResult Function(SearchChalets value) searchChalets,
  }) {
    return updateChalet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChalets value)? loadChalets,
    TResult? Function(RefreshChalets value)? refreshChalets,
    TResult? Function(CreateChalet value)? createChalet,
    TResult? Function(UpdateChalet value)? updateChalet,
    TResult? Function(DeleteChalet value)? deleteChalet,
    TResult? Function(UploadImages value)? uploadImages,
    TResult? Function(DeleteImage value)? deleteImage,
    TResult? Function(SetMainImage value)? setMainImage,
    TResult? Function(ToggleAvailability value)? toggleAvailability,
    TResult? Function(SortChalets value)? sortChalets,
    TResult? Function(SearchChalets value)? searchChalets,
  }) {
    return updateChalet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChalets value)? loadChalets,
    TResult Function(RefreshChalets value)? refreshChalets,
    TResult Function(CreateChalet value)? createChalet,
    TResult Function(UpdateChalet value)? updateChalet,
    TResult Function(DeleteChalet value)? deleteChalet,
    TResult Function(UploadImages value)? uploadImages,
    TResult Function(DeleteImage value)? deleteImage,
    TResult Function(SetMainImage value)? setMainImage,
    TResult Function(ToggleAvailability value)? toggleAvailability,
    TResult Function(SortChalets value)? sortChalets,
    TResult Function(SearchChalets value)? searchChalets,
    required TResult orElse(),
  }) {
    if (updateChalet != null) {
      return updateChalet(this);
    }
    return orElse();
  }
}

abstract class UpdateChalet implements ChaletManagementEvent {
  const factory UpdateChalet(final int id, final ChaletUpdateRequest request) =
      _$UpdateChaletImpl;

  int get id;
  ChaletUpdateRequest get request;

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateChaletImplCopyWith<_$UpdateChaletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteChaletImplCopyWith<$Res> {
  factory _$$DeleteChaletImplCopyWith(
          _$DeleteChaletImpl value, $Res Function(_$DeleteChaletImpl) then) =
      __$$DeleteChaletImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteChaletImplCopyWithImpl<$Res>
    extends _$ChaletManagementEventCopyWithImpl<$Res, _$DeleteChaletImpl>
    implements _$$DeleteChaletImplCopyWith<$Res> {
  __$$DeleteChaletImplCopyWithImpl(
      _$DeleteChaletImpl _value, $Res Function(_$DeleteChaletImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteChaletImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteChaletImpl implements DeleteChalet {
  const _$DeleteChaletImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ChaletManagementEvent.deleteChalet(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteChaletImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteChaletImplCopyWith<_$DeleteChaletImpl> get copyWith =>
      __$$DeleteChaletImplCopyWithImpl<_$DeleteChaletImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() refreshChalets,
    required TResult Function(ChaletCreateRequest request) createChalet,
    required TResult Function(int id, ChaletUpdateRequest request) updateChalet,
    required TResult Function(int id) deleteChalet,
    required TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)
        uploadImages,
    required TResult Function(int chaletId, int imageId) deleteImage,
    required TResult Function(int chaletId, int imageId) setMainImage,
    required TResult Function(int chaletId, bool isAvailable)
        toggleAvailability,
    required TResult Function(ChaletSortBy sortBy) sortChalets,
    required TResult Function(String query) searchChalets,
  }) {
    return deleteChalet(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(ChaletCreateRequest request)? createChalet,
    TResult? Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult? Function(int id)? deleteChalet,
    TResult? Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult? Function(int chaletId, int imageId)? deleteImage,
    TResult? Function(int chaletId, int imageId)? setMainImage,
    TResult? Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult? Function(ChaletSortBy sortBy)? sortChalets,
    TResult? Function(String query)? searchChalets,
  }) {
    return deleteChalet?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? refreshChalets,
    TResult Function(ChaletCreateRequest request)? createChalet,
    TResult Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult Function(int id)? deleteChalet,
    TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult Function(int chaletId, int imageId)? deleteImage,
    TResult Function(int chaletId, int imageId)? setMainImage,
    TResult Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult Function(ChaletSortBy sortBy)? sortChalets,
    TResult Function(String query)? searchChalets,
    required TResult orElse(),
  }) {
    if (deleteChalet != null) {
      return deleteChalet(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChalets value) loadChalets,
    required TResult Function(RefreshChalets value) refreshChalets,
    required TResult Function(CreateChalet value) createChalet,
    required TResult Function(UpdateChalet value) updateChalet,
    required TResult Function(DeleteChalet value) deleteChalet,
    required TResult Function(UploadImages value) uploadImages,
    required TResult Function(DeleteImage value) deleteImage,
    required TResult Function(SetMainImage value) setMainImage,
    required TResult Function(ToggleAvailability value) toggleAvailability,
    required TResult Function(SortChalets value) sortChalets,
    required TResult Function(SearchChalets value) searchChalets,
  }) {
    return deleteChalet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChalets value)? loadChalets,
    TResult? Function(RefreshChalets value)? refreshChalets,
    TResult? Function(CreateChalet value)? createChalet,
    TResult? Function(UpdateChalet value)? updateChalet,
    TResult? Function(DeleteChalet value)? deleteChalet,
    TResult? Function(UploadImages value)? uploadImages,
    TResult? Function(DeleteImage value)? deleteImage,
    TResult? Function(SetMainImage value)? setMainImage,
    TResult? Function(ToggleAvailability value)? toggleAvailability,
    TResult? Function(SortChalets value)? sortChalets,
    TResult? Function(SearchChalets value)? searchChalets,
  }) {
    return deleteChalet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChalets value)? loadChalets,
    TResult Function(RefreshChalets value)? refreshChalets,
    TResult Function(CreateChalet value)? createChalet,
    TResult Function(UpdateChalet value)? updateChalet,
    TResult Function(DeleteChalet value)? deleteChalet,
    TResult Function(UploadImages value)? uploadImages,
    TResult Function(DeleteImage value)? deleteImage,
    TResult Function(SetMainImage value)? setMainImage,
    TResult Function(ToggleAvailability value)? toggleAvailability,
    TResult Function(SortChalets value)? sortChalets,
    TResult Function(SearchChalets value)? searchChalets,
    required TResult orElse(),
  }) {
    if (deleteChalet != null) {
      return deleteChalet(this);
    }
    return orElse();
  }
}

abstract class DeleteChalet implements ChaletManagementEvent {
  const factory DeleteChalet(final int id) = _$DeleteChaletImpl;

  int get id;

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteChaletImplCopyWith<_$DeleteChaletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadImagesImplCopyWith<$Res> {
  factory _$$UploadImagesImplCopyWith(
          _$UploadImagesImpl value, $Res Function(_$UploadImagesImpl) then) =
      __$$UploadImagesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int chaletId, List<File> images, Map<String, String>? captions});
}

/// @nodoc
class __$$UploadImagesImplCopyWithImpl<$Res>
    extends _$ChaletManagementEventCopyWithImpl<$Res, _$UploadImagesImpl>
    implements _$$UploadImagesImplCopyWith<$Res> {
  __$$UploadImagesImplCopyWithImpl(
      _$UploadImagesImpl _value, $Res Function(_$UploadImagesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chaletId = null,
    Object? images = null,
    Object? captions = freezed,
  }) {
    return _then(_$UploadImagesImpl(
      null == chaletId
          ? _value.chaletId
          : chaletId // ignore: cast_nullable_to_non_nullable
              as int,
      null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File>,
      captions: freezed == captions
          ? _value._captions
          : captions // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc

class _$UploadImagesImpl implements UploadImages {
  const _$UploadImagesImpl(this.chaletId, final List<File> images,
      {final Map<String, String>? captions})
      : _images = images,
        _captions = captions;

  @override
  final int chaletId;
  final List<File> _images;
  @override
  List<File> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final Map<String, String>? _captions;
  @override
  Map<String, String>? get captions {
    final value = _captions;
    if (value == null) return null;
    if (_captions is EqualUnmodifiableMapView) return _captions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ChaletManagementEvent.uploadImages(chaletId: $chaletId, images: $images, captions: $captions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadImagesImpl &&
            (identical(other.chaletId, chaletId) ||
                other.chaletId == chaletId) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._captions, _captions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      chaletId,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_captions));

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadImagesImplCopyWith<_$UploadImagesImpl> get copyWith =>
      __$$UploadImagesImplCopyWithImpl<_$UploadImagesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() refreshChalets,
    required TResult Function(ChaletCreateRequest request) createChalet,
    required TResult Function(int id, ChaletUpdateRequest request) updateChalet,
    required TResult Function(int id) deleteChalet,
    required TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)
        uploadImages,
    required TResult Function(int chaletId, int imageId) deleteImage,
    required TResult Function(int chaletId, int imageId) setMainImage,
    required TResult Function(int chaletId, bool isAvailable)
        toggleAvailability,
    required TResult Function(ChaletSortBy sortBy) sortChalets,
    required TResult Function(String query) searchChalets,
  }) {
    return uploadImages(chaletId, images, captions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(ChaletCreateRequest request)? createChalet,
    TResult? Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult? Function(int id)? deleteChalet,
    TResult? Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult? Function(int chaletId, int imageId)? deleteImage,
    TResult? Function(int chaletId, int imageId)? setMainImage,
    TResult? Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult? Function(ChaletSortBy sortBy)? sortChalets,
    TResult? Function(String query)? searchChalets,
  }) {
    return uploadImages?.call(chaletId, images, captions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? refreshChalets,
    TResult Function(ChaletCreateRequest request)? createChalet,
    TResult Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult Function(int id)? deleteChalet,
    TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult Function(int chaletId, int imageId)? deleteImage,
    TResult Function(int chaletId, int imageId)? setMainImage,
    TResult Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult Function(ChaletSortBy sortBy)? sortChalets,
    TResult Function(String query)? searchChalets,
    required TResult orElse(),
  }) {
    if (uploadImages != null) {
      return uploadImages(chaletId, images, captions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChalets value) loadChalets,
    required TResult Function(RefreshChalets value) refreshChalets,
    required TResult Function(CreateChalet value) createChalet,
    required TResult Function(UpdateChalet value) updateChalet,
    required TResult Function(DeleteChalet value) deleteChalet,
    required TResult Function(UploadImages value) uploadImages,
    required TResult Function(DeleteImage value) deleteImage,
    required TResult Function(SetMainImage value) setMainImage,
    required TResult Function(ToggleAvailability value) toggleAvailability,
    required TResult Function(SortChalets value) sortChalets,
    required TResult Function(SearchChalets value) searchChalets,
  }) {
    return uploadImages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChalets value)? loadChalets,
    TResult? Function(RefreshChalets value)? refreshChalets,
    TResult? Function(CreateChalet value)? createChalet,
    TResult? Function(UpdateChalet value)? updateChalet,
    TResult? Function(DeleteChalet value)? deleteChalet,
    TResult? Function(UploadImages value)? uploadImages,
    TResult? Function(DeleteImage value)? deleteImage,
    TResult? Function(SetMainImage value)? setMainImage,
    TResult? Function(ToggleAvailability value)? toggleAvailability,
    TResult? Function(SortChalets value)? sortChalets,
    TResult? Function(SearchChalets value)? searchChalets,
  }) {
    return uploadImages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChalets value)? loadChalets,
    TResult Function(RefreshChalets value)? refreshChalets,
    TResult Function(CreateChalet value)? createChalet,
    TResult Function(UpdateChalet value)? updateChalet,
    TResult Function(DeleteChalet value)? deleteChalet,
    TResult Function(UploadImages value)? uploadImages,
    TResult Function(DeleteImage value)? deleteImage,
    TResult Function(SetMainImage value)? setMainImage,
    TResult Function(ToggleAvailability value)? toggleAvailability,
    TResult Function(SortChalets value)? sortChalets,
    TResult Function(SearchChalets value)? searchChalets,
    required TResult orElse(),
  }) {
    if (uploadImages != null) {
      return uploadImages(this);
    }
    return orElse();
  }
}

abstract class UploadImages implements ChaletManagementEvent {
  const factory UploadImages(final int chaletId, final List<File> images,
      {final Map<String, String>? captions}) = _$UploadImagesImpl;

  int get chaletId;
  List<File> get images;
  Map<String, String>? get captions;

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadImagesImplCopyWith<_$UploadImagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImageImplCopyWith<$Res> {
  factory _$$DeleteImageImplCopyWith(
          _$DeleteImageImpl value, $Res Function(_$DeleteImageImpl) then) =
      __$$DeleteImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int chaletId, int imageId});
}

/// @nodoc
class __$$DeleteImageImplCopyWithImpl<$Res>
    extends _$ChaletManagementEventCopyWithImpl<$Res, _$DeleteImageImpl>
    implements _$$DeleteImageImplCopyWith<$Res> {
  __$$DeleteImageImplCopyWithImpl(
      _$DeleteImageImpl _value, $Res Function(_$DeleteImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chaletId = null,
    Object? imageId = null,
  }) {
    return _then(_$DeleteImageImpl(
      null == chaletId
          ? _value.chaletId
          : chaletId // ignore: cast_nullable_to_non_nullable
              as int,
      null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteImageImpl implements DeleteImage {
  const _$DeleteImageImpl(this.chaletId, this.imageId);

  @override
  final int chaletId;
  @override
  final int imageId;

  @override
  String toString() {
    return 'ChaletManagementEvent.deleteImage(chaletId: $chaletId, imageId: $imageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImageImpl &&
            (identical(other.chaletId, chaletId) ||
                other.chaletId == chaletId) &&
            (identical(other.imageId, imageId) || other.imageId == imageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chaletId, imageId);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImageImplCopyWith<_$DeleteImageImpl> get copyWith =>
      __$$DeleteImageImplCopyWithImpl<_$DeleteImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() refreshChalets,
    required TResult Function(ChaletCreateRequest request) createChalet,
    required TResult Function(int id, ChaletUpdateRequest request) updateChalet,
    required TResult Function(int id) deleteChalet,
    required TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)
        uploadImages,
    required TResult Function(int chaletId, int imageId) deleteImage,
    required TResult Function(int chaletId, int imageId) setMainImage,
    required TResult Function(int chaletId, bool isAvailable)
        toggleAvailability,
    required TResult Function(ChaletSortBy sortBy) sortChalets,
    required TResult Function(String query) searchChalets,
  }) {
    return deleteImage(chaletId, imageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(ChaletCreateRequest request)? createChalet,
    TResult? Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult? Function(int id)? deleteChalet,
    TResult? Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult? Function(int chaletId, int imageId)? deleteImage,
    TResult? Function(int chaletId, int imageId)? setMainImage,
    TResult? Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult? Function(ChaletSortBy sortBy)? sortChalets,
    TResult? Function(String query)? searchChalets,
  }) {
    return deleteImage?.call(chaletId, imageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? refreshChalets,
    TResult Function(ChaletCreateRequest request)? createChalet,
    TResult Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult Function(int id)? deleteChalet,
    TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult Function(int chaletId, int imageId)? deleteImage,
    TResult Function(int chaletId, int imageId)? setMainImage,
    TResult Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult Function(ChaletSortBy sortBy)? sortChalets,
    TResult Function(String query)? searchChalets,
    required TResult orElse(),
  }) {
    if (deleteImage != null) {
      return deleteImage(chaletId, imageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChalets value) loadChalets,
    required TResult Function(RefreshChalets value) refreshChalets,
    required TResult Function(CreateChalet value) createChalet,
    required TResult Function(UpdateChalet value) updateChalet,
    required TResult Function(DeleteChalet value) deleteChalet,
    required TResult Function(UploadImages value) uploadImages,
    required TResult Function(DeleteImage value) deleteImage,
    required TResult Function(SetMainImage value) setMainImage,
    required TResult Function(ToggleAvailability value) toggleAvailability,
    required TResult Function(SortChalets value) sortChalets,
    required TResult Function(SearchChalets value) searchChalets,
  }) {
    return deleteImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChalets value)? loadChalets,
    TResult? Function(RefreshChalets value)? refreshChalets,
    TResult? Function(CreateChalet value)? createChalet,
    TResult? Function(UpdateChalet value)? updateChalet,
    TResult? Function(DeleteChalet value)? deleteChalet,
    TResult? Function(UploadImages value)? uploadImages,
    TResult? Function(DeleteImage value)? deleteImage,
    TResult? Function(SetMainImage value)? setMainImage,
    TResult? Function(ToggleAvailability value)? toggleAvailability,
    TResult? Function(SortChalets value)? sortChalets,
    TResult? Function(SearchChalets value)? searchChalets,
  }) {
    return deleteImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChalets value)? loadChalets,
    TResult Function(RefreshChalets value)? refreshChalets,
    TResult Function(CreateChalet value)? createChalet,
    TResult Function(UpdateChalet value)? updateChalet,
    TResult Function(DeleteChalet value)? deleteChalet,
    TResult Function(UploadImages value)? uploadImages,
    TResult Function(DeleteImage value)? deleteImage,
    TResult Function(SetMainImage value)? setMainImage,
    TResult Function(ToggleAvailability value)? toggleAvailability,
    TResult Function(SortChalets value)? sortChalets,
    TResult Function(SearchChalets value)? searchChalets,
    required TResult orElse(),
  }) {
    if (deleteImage != null) {
      return deleteImage(this);
    }
    return orElse();
  }
}

abstract class DeleteImage implements ChaletManagementEvent {
  const factory DeleteImage(final int chaletId, final int imageId) =
      _$DeleteImageImpl;

  int get chaletId;
  int get imageId;

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteImageImplCopyWith<_$DeleteImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetMainImageImplCopyWith<$Res> {
  factory _$$SetMainImageImplCopyWith(
          _$SetMainImageImpl value, $Res Function(_$SetMainImageImpl) then) =
      __$$SetMainImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int chaletId, int imageId});
}

/// @nodoc
class __$$SetMainImageImplCopyWithImpl<$Res>
    extends _$ChaletManagementEventCopyWithImpl<$Res, _$SetMainImageImpl>
    implements _$$SetMainImageImplCopyWith<$Res> {
  __$$SetMainImageImplCopyWithImpl(
      _$SetMainImageImpl _value, $Res Function(_$SetMainImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chaletId = null,
    Object? imageId = null,
  }) {
    return _then(_$SetMainImageImpl(
      null == chaletId
          ? _value.chaletId
          : chaletId // ignore: cast_nullable_to_non_nullable
              as int,
      null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SetMainImageImpl implements SetMainImage {
  const _$SetMainImageImpl(this.chaletId, this.imageId);

  @override
  final int chaletId;
  @override
  final int imageId;

  @override
  String toString() {
    return 'ChaletManagementEvent.setMainImage(chaletId: $chaletId, imageId: $imageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetMainImageImpl &&
            (identical(other.chaletId, chaletId) ||
                other.chaletId == chaletId) &&
            (identical(other.imageId, imageId) || other.imageId == imageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chaletId, imageId);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetMainImageImplCopyWith<_$SetMainImageImpl> get copyWith =>
      __$$SetMainImageImplCopyWithImpl<_$SetMainImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() refreshChalets,
    required TResult Function(ChaletCreateRequest request) createChalet,
    required TResult Function(int id, ChaletUpdateRequest request) updateChalet,
    required TResult Function(int id) deleteChalet,
    required TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)
        uploadImages,
    required TResult Function(int chaletId, int imageId) deleteImage,
    required TResult Function(int chaletId, int imageId) setMainImage,
    required TResult Function(int chaletId, bool isAvailable)
        toggleAvailability,
    required TResult Function(ChaletSortBy sortBy) sortChalets,
    required TResult Function(String query) searchChalets,
  }) {
    return setMainImage(chaletId, imageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(ChaletCreateRequest request)? createChalet,
    TResult? Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult? Function(int id)? deleteChalet,
    TResult? Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult? Function(int chaletId, int imageId)? deleteImage,
    TResult? Function(int chaletId, int imageId)? setMainImage,
    TResult? Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult? Function(ChaletSortBy sortBy)? sortChalets,
    TResult? Function(String query)? searchChalets,
  }) {
    return setMainImage?.call(chaletId, imageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? refreshChalets,
    TResult Function(ChaletCreateRequest request)? createChalet,
    TResult Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult Function(int id)? deleteChalet,
    TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult Function(int chaletId, int imageId)? deleteImage,
    TResult Function(int chaletId, int imageId)? setMainImage,
    TResult Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult Function(ChaletSortBy sortBy)? sortChalets,
    TResult Function(String query)? searchChalets,
    required TResult orElse(),
  }) {
    if (setMainImage != null) {
      return setMainImage(chaletId, imageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChalets value) loadChalets,
    required TResult Function(RefreshChalets value) refreshChalets,
    required TResult Function(CreateChalet value) createChalet,
    required TResult Function(UpdateChalet value) updateChalet,
    required TResult Function(DeleteChalet value) deleteChalet,
    required TResult Function(UploadImages value) uploadImages,
    required TResult Function(DeleteImage value) deleteImage,
    required TResult Function(SetMainImage value) setMainImage,
    required TResult Function(ToggleAvailability value) toggleAvailability,
    required TResult Function(SortChalets value) sortChalets,
    required TResult Function(SearchChalets value) searchChalets,
  }) {
    return setMainImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChalets value)? loadChalets,
    TResult? Function(RefreshChalets value)? refreshChalets,
    TResult? Function(CreateChalet value)? createChalet,
    TResult? Function(UpdateChalet value)? updateChalet,
    TResult? Function(DeleteChalet value)? deleteChalet,
    TResult? Function(UploadImages value)? uploadImages,
    TResult? Function(DeleteImage value)? deleteImage,
    TResult? Function(SetMainImage value)? setMainImage,
    TResult? Function(ToggleAvailability value)? toggleAvailability,
    TResult? Function(SortChalets value)? sortChalets,
    TResult? Function(SearchChalets value)? searchChalets,
  }) {
    return setMainImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChalets value)? loadChalets,
    TResult Function(RefreshChalets value)? refreshChalets,
    TResult Function(CreateChalet value)? createChalet,
    TResult Function(UpdateChalet value)? updateChalet,
    TResult Function(DeleteChalet value)? deleteChalet,
    TResult Function(UploadImages value)? uploadImages,
    TResult Function(DeleteImage value)? deleteImage,
    TResult Function(SetMainImage value)? setMainImage,
    TResult Function(ToggleAvailability value)? toggleAvailability,
    TResult Function(SortChalets value)? sortChalets,
    TResult Function(SearchChalets value)? searchChalets,
    required TResult orElse(),
  }) {
    if (setMainImage != null) {
      return setMainImage(this);
    }
    return orElse();
  }
}

abstract class SetMainImage implements ChaletManagementEvent {
  const factory SetMainImage(final int chaletId, final int imageId) =
      _$SetMainImageImpl;

  int get chaletId;
  int get imageId;

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetMainImageImplCopyWith<_$SetMainImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleAvailabilityImplCopyWith<$Res> {
  factory _$$ToggleAvailabilityImplCopyWith(_$ToggleAvailabilityImpl value,
          $Res Function(_$ToggleAvailabilityImpl) then) =
      __$$ToggleAvailabilityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int chaletId, bool isAvailable});
}

/// @nodoc
class __$$ToggleAvailabilityImplCopyWithImpl<$Res>
    extends _$ChaletManagementEventCopyWithImpl<$Res, _$ToggleAvailabilityImpl>
    implements _$$ToggleAvailabilityImplCopyWith<$Res> {
  __$$ToggleAvailabilityImplCopyWithImpl(_$ToggleAvailabilityImpl _value,
      $Res Function(_$ToggleAvailabilityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chaletId = null,
    Object? isAvailable = null,
  }) {
    return _then(_$ToggleAvailabilityImpl(
      null == chaletId
          ? _value.chaletId
          : chaletId // ignore: cast_nullable_to_non_nullable
              as int,
      null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToggleAvailabilityImpl implements ToggleAvailability {
  const _$ToggleAvailabilityImpl(this.chaletId, this.isAvailable);

  @override
  final int chaletId;
  @override
  final bool isAvailable;

  @override
  String toString() {
    return 'ChaletManagementEvent.toggleAvailability(chaletId: $chaletId, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleAvailabilityImpl &&
            (identical(other.chaletId, chaletId) ||
                other.chaletId == chaletId) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chaletId, isAvailable);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleAvailabilityImplCopyWith<_$ToggleAvailabilityImpl> get copyWith =>
      __$$ToggleAvailabilityImplCopyWithImpl<_$ToggleAvailabilityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() refreshChalets,
    required TResult Function(ChaletCreateRequest request) createChalet,
    required TResult Function(int id, ChaletUpdateRequest request) updateChalet,
    required TResult Function(int id) deleteChalet,
    required TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)
        uploadImages,
    required TResult Function(int chaletId, int imageId) deleteImage,
    required TResult Function(int chaletId, int imageId) setMainImage,
    required TResult Function(int chaletId, bool isAvailable)
        toggleAvailability,
    required TResult Function(ChaletSortBy sortBy) sortChalets,
    required TResult Function(String query) searchChalets,
  }) {
    return toggleAvailability(chaletId, isAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(ChaletCreateRequest request)? createChalet,
    TResult? Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult? Function(int id)? deleteChalet,
    TResult? Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult? Function(int chaletId, int imageId)? deleteImage,
    TResult? Function(int chaletId, int imageId)? setMainImage,
    TResult? Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult? Function(ChaletSortBy sortBy)? sortChalets,
    TResult? Function(String query)? searchChalets,
  }) {
    return toggleAvailability?.call(chaletId, isAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? refreshChalets,
    TResult Function(ChaletCreateRequest request)? createChalet,
    TResult Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult Function(int id)? deleteChalet,
    TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult Function(int chaletId, int imageId)? deleteImage,
    TResult Function(int chaletId, int imageId)? setMainImage,
    TResult Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult Function(ChaletSortBy sortBy)? sortChalets,
    TResult Function(String query)? searchChalets,
    required TResult orElse(),
  }) {
    if (toggleAvailability != null) {
      return toggleAvailability(chaletId, isAvailable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChalets value) loadChalets,
    required TResult Function(RefreshChalets value) refreshChalets,
    required TResult Function(CreateChalet value) createChalet,
    required TResult Function(UpdateChalet value) updateChalet,
    required TResult Function(DeleteChalet value) deleteChalet,
    required TResult Function(UploadImages value) uploadImages,
    required TResult Function(DeleteImage value) deleteImage,
    required TResult Function(SetMainImage value) setMainImage,
    required TResult Function(ToggleAvailability value) toggleAvailability,
    required TResult Function(SortChalets value) sortChalets,
    required TResult Function(SearchChalets value) searchChalets,
  }) {
    return toggleAvailability(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChalets value)? loadChalets,
    TResult? Function(RefreshChalets value)? refreshChalets,
    TResult? Function(CreateChalet value)? createChalet,
    TResult? Function(UpdateChalet value)? updateChalet,
    TResult? Function(DeleteChalet value)? deleteChalet,
    TResult? Function(UploadImages value)? uploadImages,
    TResult? Function(DeleteImage value)? deleteImage,
    TResult? Function(SetMainImage value)? setMainImage,
    TResult? Function(ToggleAvailability value)? toggleAvailability,
    TResult? Function(SortChalets value)? sortChalets,
    TResult? Function(SearchChalets value)? searchChalets,
  }) {
    return toggleAvailability?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChalets value)? loadChalets,
    TResult Function(RefreshChalets value)? refreshChalets,
    TResult Function(CreateChalet value)? createChalet,
    TResult Function(UpdateChalet value)? updateChalet,
    TResult Function(DeleteChalet value)? deleteChalet,
    TResult Function(UploadImages value)? uploadImages,
    TResult Function(DeleteImage value)? deleteImage,
    TResult Function(SetMainImage value)? setMainImage,
    TResult Function(ToggleAvailability value)? toggleAvailability,
    TResult Function(SortChalets value)? sortChalets,
    TResult Function(SearchChalets value)? searchChalets,
    required TResult orElse(),
  }) {
    if (toggleAvailability != null) {
      return toggleAvailability(this);
    }
    return orElse();
  }
}

abstract class ToggleAvailability implements ChaletManagementEvent {
  const factory ToggleAvailability(final int chaletId, final bool isAvailable) =
      _$ToggleAvailabilityImpl;

  int get chaletId;
  bool get isAvailable;

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleAvailabilityImplCopyWith<_$ToggleAvailabilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SortChaletsImplCopyWith<$Res> {
  factory _$$SortChaletsImplCopyWith(
          _$SortChaletsImpl value, $Res Function(_$SortChaletsImpl) then) =
      __$$SortChaletsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChaletSortBy sortBy});
}

/// @nodoc
class __$$SortChaletsImplCopyWithImpl<$Res>
    extends _$ChaletManagementEventCopyWithImpl<$Res, _$SortChaletsImpl>
    implements _$$SortChaletsImplCopyWith<$Res> {
  __$$SortChaletsImplCopyWithImpl(
      _$SortChaletsImpl _value, $Res Function(_$SortChaletsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortBy = null,
  }) {
    return _then(_$SortChaletsImpl(
      null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as ChaletSortBy,
    ));
  }
}

/// @nodoc

class _$SortChaletsImpl implements SortChalets {
  const _$SortChaletsImpl(this.sortBy);

  @override
  final ChaletSortBy sortBy;

  @override
  String toString() {
    return 'ChaletManagementEvent.sortChalets(sortBy: $sortBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SortChaletsImpl &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortBy);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SortChaletsImplCopyWith<_$SortChaletsImpl> get copyWith =>
      __$$SortChaletsImplCopyWithImpl<_$SortChaletsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() refreshChalets,
    required TResult Function(ChaletCreateRequest request) createChalet,
    required TResult Function(int id, ChaletUpdateRequest request) updateChalet,
    required TResult Function(int id) deleteChalet,
    required TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)
        uploadImages,
    required TResult Function(int chaletId, int imageId) deleteImage,
    required TResult Function(int chaletId, int imageId) setMainImage,
    required TResult Function(int chaletId, bool isAvailable)
        toggleAvailability,
    required TResult Function(ChaletSortBy sortBy) sortChalets,
    required TResult Function(String query) searchChalets,
  }) {
    return sortChalets(sortBy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(ChaletCreateRequest request)? createChalet,
    TResult? Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult? Function(int id)? deleteChalet,
    TResult? Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult? Function(int chaletId, int imageId)? deleteImage,
    TResult? Function(int chaletId, int imageId)? setMainImage,
    TResult? Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult? Function(ChaletSortBy sortBy)? sortChalets,
    TResult? Function(String query)? searchChalets,
  }) {
    return sortChalets?.call(sortBy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? refreshChalets,
    TResult Function(ChaletCreateRequest request)? createChalet,
    TResult Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult Function(int id)? deleteChalet,
    TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult Function(int chaletId, int imageId)? deleteImage,
    TResult Function(int chaletId, int imageId)? setMainImage,
    TResult Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult Function(ChaletSortBy sortBy)? sortChalets,
    TResult Function(String query)? searchChalets,
    required TResult orElse(),
  }) {
    if (sortChalets != null) {
      return sortChalets(sortBy);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChalets value) loadChalets,
    required TResult Function(RefreshChalets value) refreshChalets,
    required TResult Function(CreateChalet value) createChalet,
    required TResult Function(UpdateChalet value) updateChalet,
    required TResult Function(DeleteChalet value) deleteChalet,
    required TResult Function(UploadImages value) uploadImages,
    required TResult Function(DeleteImage value) deleteImage,
    required TResult Function(SetMainImage value) setMainImage,
    required TResult Function(ToggleAvailability value) toggleAvailability,
    required TResult Function(SortChalets value) sortChalets,
    required TResult Function(SearchChalets value) searchChalets,
  }) {
    return sortChalets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChalets value)? loadChalets,
    TResult? Function(RefreshChalets value)? refreshChalets,
    TResult? Function(CreateChalet value)? createChalet,
    TResult? Function(UpdateChalet value)? updateChalet,
    TResult? Function(DeleteChalet value)? deleteChalet,
    TResult? Function(UploadImages value)? uploadImages,
    TResult? Function(DeleteImage value)? deleteImage,
    TResult? Function(SetMainImage value)? setMainImage,
    TResult? Function(ToggleAvailability value)? toggleAvailability,
    TResult? Function(SortChalets value)? sortChalets,
    TResult? Function(SearchChalets value)? searchChalets,
  }) {
    return sortChalets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChalets value)? loadChalets,
    TResult Function(RefreshChalets value)? refreshChalets,
    TResult Function(CreateChalet value)? createChalet,
    TResult Function(UpdateChalet value)? updateChalet,
    TResult Function(DeleteChalet value)? deleteChalet,
    TResult Function(UploadImages value)? uploadImages,
    TResult Function(DeleteImage value)? deleteImage,
    TResult Function(SetMainImage value)? setMainImage,
    TResult Function(ToggleAvailability value)? toggleAvailability,
    TResult Function(SortChalets value)? sortChalets,
    TResult Function(SearchChalets value)? searchChalets,
    required TResult orElse(),
  }) {
    if (sortChalets != null) {
      return sortChalets(this);
    }
    return orElse();
  }
}

abstract class SortChalets implements ChaletManagementEvent {
  const factory SortChalets(final ChaletSortBy sortBy) = _$SortChaletsImpl;

  ChaletSortBy get sortBy;

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SortChaletsImplCopyWith<_$SortChaletsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchChaletsImplCopyWith<$Res> {
  factory _$$SearchChaletsImplCopyWith(
          _$SearchChaletsImpl value, $Res Function(_$SearchChaletsImpl) then) =
      __$$SearchChaletsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchChaletsImplCopyWithImpl<$Res>
    extends _$ChaletManagementEventCopyWithImpl<$Res, _$SearchChaletsImpl>
    implements _$$SearchChaletsImplCopyWith<$Res> {
  __$$SearchChaletsImplCopyWithImpl(
      _$SearchChaletsImpl _value, $Res Function(_$SearchChaletsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchChaletsImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchChaletsImpl implements SearchChalets {
  const _$SearchChaletsImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'ChaletManagementEvent.searchChalets(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchChaletsImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchChaletsImplCopyWith<_$SearchChaletsImpl> get copyWith =>
      __$$SearchChaletsImplCopyWithImpl<_$SearchChaletsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChalets,
    required TResult Function() refreshChalets,
    required TResult Function(ChaletCreateRequest request) createChalet,
    required TResult Function(int id, ChaletUpdateRequest request) updateChalet,
    required TResult Function(int id) deleteChalet,
    required TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)
        uploadImages,
    required TResult Function(int chaletId, int imageId) deleteImage,
    required TResult Function(int chaletId, int imageId) setMainImage,
    required TResult Function(int chaletId, bool isAvailable)
        toggleAvailability,
    required TResult Function(ChaletSortBy sortBy) sortChalets,
    required TResult Function(String query) searchChalets,
  }) {
    return searchChalets(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChalets,
    TResult? Function()? refreshChalets,
    TResult? Function(ChaletCreateRequest request)? createChalet,
    TResult? Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult? Function(int id)? deleteChalet,
    TResult? Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult? Function(int chaletId, int imageId)? deleteImage,
    TResult? Function(int chaletId, int imageId)? setMainImage,
    TResult? Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult? Function(ChaletSortBy sortBy)? sortChalets,
    TResult? Function(String query)? searchChalets,
  }) {
    return searchChalets?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChalets,
    TResult Function()? refreshChalets,
    TResult Function(ChaletCreateRequest request)? createChalet,
    TResult Function(int id, ChaletUpdateRequest request)? updateChalet,
    TResult Function(int id)? deleteChalet,
    TResult Function(
            int chaletId, List<File> images, Map<String, String>? captions)?
        uploadImages,
    TResult Function(int chaletId, int imageId)? deleteImage,
    TResult Function(int chaletId, int imageId)? setMainImage,
    TResult Function(int chaletId, bool isAvailable)? toggleAvailability,
    TResult Function(ChaletSortBy sortBy)? sortChalets,
    TResult Function(String query)? searchChalets,
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
    required TResult Function(LoadChalets value) loadChalets,
    required TResult Function(RefreshChalets value) refreshChalets,
    required TResult Function(CreateChalet value) createChalet,
    required TResult Function(UpdateChalet value) updateChalet,
    required TResult Function(DeleteChalet value) deleteChalet,
    required TResult Function(UploadImages value) uploadImages,
    required TResult Function(DeleteImage value) deleteImage,
    required TResult Function(SetMainImage value) setMainImage,
    required TResult Function(ToggleAvailability value) toggleAvailability,
    required TResult Function(SortChalets value) sortChalets,
    required TResult Function(SearchChalets value) searchChalets,
  }) {
    return searchChalets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChalets value)? loadChalets,
    TResult? Function(RefreshChalets value)? refreshChalets,
    TResult? Function(CreateChalet value)? createChalet,
    TResult? Function(UpdateChalet value)? updateChalet,
    TResult? Function(DeleteChalet value)? deleteChalet,
    TResult? Function(UploadImages value)? uploadImages,
    TResult? Function(DeleteImage value)? deleteImage,
    TResult? Function(SetMainImage value)? setMainImage,
    TResult? Function(ToggleAvailability value)? toggleAvailability,
    TResult? Function(SortChalets value)? sortChalets,
    TResult? Function(SearchChalets value)? searchChalets,
  }) {
    return searchChalets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChalets value)? loadChalets,
    TResult Function(RefreshChalets value)? refreshChalets,
    TResult Function(CreateChalet value)? createChalet,
    TResult Function(UpdateChalet value)? updateChalet,
    TResult Function(DeleteChalet value)? deleteChalet,
    TResult Function(UploadImages value)? uploadImages,
    TResult Function(DeleteImage value)? deleteImage,
    TResult Function(SetMainImage value)? setMainImage,
    TResult Function(ToggleAvailability value)? toggleAvailability,
    TResult Function(SortChalets value)? sortChalets,
    TResult Function(SearchChalets value)? searchChalets,
    required TResult orElse(),
  }) {
    if (searchChalets != null) {
      return searchChalets(this);
    }
    return orElse();
  }
}

abstract class SearchChalets implements ChaletManagementEvent {
  const factory SearchChalets(final String query) = _$SearchChaletsImpl;

  String get query;

  /// Create a copy of ChaletManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchChaletsImplCopyWith<_$SearchChaletsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChaletManagementState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Chalet> chalets,
            List<Chalet> filteredChalets,
            String searchQuery,
            ChaletSortBy sortBy)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() creating,
    required TResult Function(Chalet chalet) created,
    required TResult Function() updating,
    required TResult Function(Chalet chalet) updated,
    required TResult Function() deleting,
    required TResult Function(int chaletId) deleted,
    required TResult Function() uploadingImages,
    required TResult Function(int chaletId, List<ChaletImage> images)
        imagesUploaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? creating,
    TResult? Function(Chalet chalet)? created,
    TResult? Function()? updating,
    TResult? Function(Chalet chalet)? updated,
    TResult? Function()? deleting,
    TResult? Function(int chaletId)? deleted,
    TResult? Function()? uploadingImages,
    TResult? Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? creating,
    TResult Function(Chalet chalet)? created,
    TResult Function()? updating,
    TResult Function(Chalet chalet)? updated,
    TResult Function()? deleting,
    TResult Function(int chaletId)? deleted,
    TResult Function()? uploadingImages,
    TResult Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(Creating value) creating,
    required TResult Function(Created value) created,
    required TResult Function(Updating value) updating,
    required TResult Function(Updated value) updated,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Deleted value) deleted,
    required TResult Function(UploadingImages value) uploadingImages,
    required TResult Function(ImagesUploaded value) imagesUploaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(Creating value)? creating,
    TResult? Function(Created value)? created,
    TResult? Function(Updating value)? updating,
    TResult? Function(Updated value)? updated,
    TResult? Function(Deleting value)? deleting,
    TResult? Function(Deleted value)? deleted,
    TResult? Function(UploadingImages value)? uploadingImages,
    TResult? Function(ImagesUploaded value)? imagesUploaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(Creating value)? creating,
    TResult Function(Created value)? created,
    TResult Function(Updating value)? updating,
    TResult Function(Updated value)? updated,
    TResult Function(Deleting value)? deleting,
    TResult Function(Deleted value)? deleted,
    TResult Function(UploadingImages value)? uploadingImages,
    TResult Function(ImagesUploaded value)? imagesUploaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChaletManagementStateCopyWith<$Res> {
  factory $ChaletManagementStateCopyWith(ChaletManagementState value,
          $Res Function(ChaletManagementState) then) =
      _$ChaletManagementStateCopyWithImpl<$Res, ChaletManagementState>;
}

/// @nodoc
class _$ChaletManagementStateCopyWithImpl<$Res,
        $Val extends ChaletManagementState>
    implements $ChaletManagementStateCopyWith<$Res> {
  _$ChaletManagementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChaletManagementState
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
    extends _$ChaletManagementStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ChaletManagementState.initial()';
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
    required TResult Function(
            List<Chalet> chalets,
            List<Chalet> filteredChalets,
            String searchQuery,
            ChaletSortBy sortBy)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() creating,
    required TResult Function(Chalet chalet) created,
    required TResult Function() updating,
    required TResult Function(Chalet chalet) updated,
    required TResult Function() deleting,
    required TResult Function(int chaletId) deleted,
    required TResult Function() uploadingImages,
    required TResult Function(int chaletId, List<ChaletImage> images)
        imagesUploaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? creating,
    TResult? Function(Chalet chalet)? created,
    TResult? Function()? updating,
    TResult? Function(Chalet chalet)? updated,
    TResult? Function()? deleting,
    TResult? Function(int chaletId)? deleted,
    TResult? Function()? uploadingImages,
    TResult? Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? creating,
    TResult Function(Chalet chalet)? created,
    TResult Function()? updating,
    TResult Function(Chalet chalet)? updated,
    TResult Function()? deleting,
    TResult Function(int chaletId)? deleted,
    TResult Function()? uploadingImages,
    TResult Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(Creating value) creating,
    required TResult Function(Created value) created,
    required TResult Function(Updating value) updating,
    required TResult Function(Updated value) updated,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Deleted value) deleted,
    required TResult Function(UploadingImages value) uploadingImages,
    required TResult Function(ImagesUploaded value) imagesUploaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(Creating value)? creating,
    TResult? Function(Created value)? created,
    TResult? Function(Updating value)? updating,
    TResult? Function(Updated value)? updated,
    TResult? Function(Deleting value)? deleting,
    TResult? Function(Deleted value)? deleted,
    TResult? Function(UploadingImages value)? uploadingImages,
    TResult? Function(ImagesUploaded value)? imagesUploaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(Creating value)? creating,
    TResult Function(Created value)? created,
    TResult Function(Updating value)? updating,
    TResult Function(Updated value)? updated,
    TResult Function(Deleting value)? deleting,
    TResult Function(Deleted value)? deleted,
    TResult Function(UploadingImages value)? uploadingImages,
    TResult Function(ImagesUploaded value)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ChaletManagementState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ChaletManagementStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ChaletManagementState.loading()';
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
    required TResult Function(
            List<Chalet> chalets,
            List<Chalet> filteredChalets,
            String searchQuery,
            ChaletSortBy sortBy)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() creating,
    required TResult Function(Chalet chalet) created,
    required TResult Function() updating,
    required TResult Function(Chalet chalet) updated,
    required TResult Function() deleting,
    required TResult Function(int chaletId) deleted,
    required TResult Function() uploadingImages,
    required TResult Function(int chaletId, List<ChaletImage> images)
        imagesUploaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? creating,
    TResult? Function(Chalet chalet)? created,
    TResult? Function()? updating,
    TResult? Function(Chalet chalet)? updated,
    TResult? Function()? deleting,
    TResult? Function(int chaletId)? deleted,
    TResult? Function()? uploadingImages,
    TResult? Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? creating,
    TResult Function(Chalet chalet)? created,
    TResult Function()? updating,
    TResult Function(Chalet chalet)? updated,
    TResult Function()? deleting,
    TResult Function(int chaletId)? deleted,
    TResult Function()? uploadingImages,
    TResult Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(Creating value) creating,
    required TResult Function(Created value) created,
    required TResult Function(Updating value) updating,
    required TResult Function(Updated value) updated,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Deleted value) deleted,
    required TResult Function(UploadingImages value) uploadingImages,
    required TResult Function(ImagesUploaded value) imagesUploaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(Creating value)? creating,
    TResult? Function(Created value)? created,
    TResult? Function(Updating value)? updating,
    TResult? Function(Updated value)? updated,
    TResult? Function(Deleting value)? deleting,
    TResult? Function(Deleted value)? deleted,
    TResult? Function(UploadingImages value)? uploadingImages,
    TResult? Function(ImagesUploaded value)? imagesUploaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(Creating value)? creating,
    TResult Function(Created value)? created,
    TResult Function(Updating value)? updating,
    TResult Function(Updated value)? updated,
    TResult Function(Deleting value)? deleting,
    TResult Function(Deleted value)? deleted,
    TResult Function(UploadingImages value)? uploadingImages,
    TResult Function(ImagesUploaded value)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ChaletManagementState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Chalet> chalets,
      List<Chalet> filteredChalets,
      String searchQuery,
      ChaletSortBy sortBy});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ChaletManagementStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chalets = null,
    Object? filteredChalets = null,
    Object? searchQuery = null,
    Object? sortBy = null,
  }) {
    return _then(_$LoadedImpl(
      chalets: null == chalets
          ? _value._chalets
          : chalets // ignore: cast_nullable_to_non_nullable
              as List<Chalet>,
      filteredChalets: null == filteredChalets
          ? _value._filteredChalets
          : filteredChalets // ignore: cast_nullable_to_non_nullable
              as List<Chalet>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as ChaletSortBy,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements Loaded {
  const _$LoadedImpl(
      {required final List<Chalet> chalets,
      required final List<Chalet> filteredChalets,
      this.searchQuery = '',
      this.sortBy = ChaletSortBy.newest})
      : _chalets = chalets,
        _filteredChalets = filteredChalets;

  final List<Chalet> _chalets;
  @override
  List<Chalet> get chalets {
    if (_chalets is EqualUnmodifiableListView) return _chalets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chalets);
  }

  final List<Chalet> _filteredChalets;
  @override
  List<Chalet> get filteredChalets {
    if (_filteredChalets is EqualUnmodifiableListView) return _filteredChalets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredChalets);
  }

  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final ChaletSortBy sortBy;

  @override
  String toString() {
    return 'ChaletManagementState.loaded(chalets: $chalets, filteredChalets: $filteredChalets, searchQuery: $searchQuery, sortBy: $sortBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._chalets, _chalets) &&
            const DeepCollectionEquality()
                .equals(other._filteredChalets, _filteredChalets) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_chalets),
      const DeepCollectionEquality().hash(_filteredChalets),
      searchQuery,
      sortBy);

  /// Create a copy of ChaletManagementState
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
    required TResult Function(
            List<Chalet> chalets,
            List<Chalet> filteredChalets,
            String searchQuery,
            ChaletSortBy sortBy)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() creating,
    required TResult Function(Chalet chalet) created,
    required TResult Function() updating,
    required TResult Function(Chalet chalet) updated,
    required TResult Function() deleting,
    required TResult Function(int chaletId) deleted,
    required TResult Function() uploadingImages,
    required TResult Function(int chaletId, List<ChaletImage> images)
        imagesUploaded,
  }) {
    return loaded(chalets, filteredChalets, searchQuery, sortBy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? creating,
    TResult? Function(Chalet chalet)? created,
    TResult? Function()? updating,
    TResult? Function(Chalet chalet)? updated,
    TResult? Function()? deleting,
    TResult? Function(int chaletId)? deleted,
    TResult? Function()? uploadingImages,
    TResult? Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
  }) {
    return loaded?.call(chalets, filteredChalets, searchQuery, sortBy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? creating,
    TResult Function(Chalet chalet)? created,
    TResult Function()? updating,
    TResult Function(Chalet chalet)? updated,
    TResult Function()? deleting,
    TResult Function(int chaletId)? deleted,
    TResult Function()? uploadingImages,
    TResult Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(chalets, filteredChalets, searchQuery, sortBy);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(Creating value) creating,
    required TResult Function(Created value) created,
    required TResult Function(Updating value) updating,
    required TResult Function(Updated value) updated,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Deleted value) deleted,
    required TResult Function(UploadingImages value) uploadingImages,
    required TResult Function(ImagesUploaded value) imagesUploaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(Creating value)? creating,
    TResult? Function(Created value)? created,
    TResult? Function(Updating value)? updating,
    TResult? Function(Updated value)? updated,
    TResult? Function(Deleting value)? deleting,
    TResult? Function(Deleted value)? deleted,
    TResult? Function(UploadingImages value)? uploadingImages,
    TResult? Function(ImagesUploaded value)? imagesUploaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(Creating value)? creating,
    TResult Function(Created value)? created,
    TResult Function(Updating value)? updating,
    TResult Function(Updated value)? updated,
    TResult Function(Deleting value)? deleting,
    TResult Function(Deleted value)? deleted,
    TResult Function(UploadingImages value)? uploadingImages,
    TResult Function(ImagesUploaded value)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements ChaletManagementState {
  const factory Loaded(
      {required final List<Chalet> chalets,
      required final List<Chalet> filteredChalets,
      final String searchQuery,
      final ChaletSortBy sortBy}) = _$LoadedImpl;

  List<Chalet> get chalets;
  List<Chalet> get filteredChalets;
  String get searchQuery;
  ChaletSortBy get sortBy;

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ChaletManagementStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ChaletManagementState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Chalet> chalets,
            List<Chalet> filteredChalets,
            String searchQuery,
            ChaletSortBy sortBy)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() creating,
    required TResult Function(Chalet chalet) created,
    required TResult Function() updating,
    required TResult Function(Chalet chalet) updated,
    required TResult Function() deleting,
    required TResult Function(int chaletId) deleted,
    required TResult Function() uploadingImages,
    required TResult Function(int chaletId, List<ChaletImage> images)
        imagesUploaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? creating,
    TResult? Function(Chalet chalet)? created,
    TResult? Function()? updating,
    TResult? Function(Chalet chalet)? updated,
    TResult? Function()? deleting,
    TResult? Function(int chaletId)? deleted,
    TResult? Function()? uploadingImages,
    TResult? Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? creating,
    TResult Function(Chalet chalet)? created,
    TResult Function()? updating,
    TResult Function(Chalet chalet)? updated,
    TResult Function()? deleting,
    TResult Function(int chaletId)? deleted,
    TResult Function()? uploadingImages,
    TResult Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(Creating value) creating,
    required TResult Function(Created value) created,
    required TResult Function(Updating value) updating,
    required TResult Function(Updated value) updated,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Deleted value) deleted,
    required TResult Function(UploadingImages value) uploadingImages,
    required TResult Function(ImagesUploaded value) imagesUploaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(Creating value)? creating,
    TResult? Function(Created value)? created,
    TResult? Function(Updating value)? updating,
    TResult? Function(Updated value)? updated,
    TResult? Function(Deleting value)? deleting,
    TResult? Function(Deleted value)? deleted,
    TResult? Function(UploadingImages value)? uploadingImages,
    TResult? Function(ImagesUploaded value)? imagesUploaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(Creating value)? creating,
    TResult Function(Created value)? created,
    TResult Function(Updating value)? updating,
    TResult Function(Updated value)? updated,
    TResult Function(Deleting value)? deleting,
    TResult Function(Deleted value)? deleted,
    TResult Function(UploadingImages value)? uploadingImages,
    TResult Function(ImagesUploaded value)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ChaletManagementState {
  const factory Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreatingImplCopyWith<$Res> {
  factory _$$CreatingImplCopyWith(
          _$CreatingImpl value, $Res Function(_$CreatingImpl) then) =
      __$$CreatingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreatingImplCopyWithImpl<$Res>
    extends _$ChaletManagementStateCopyWithImpl<$Res, _$CreatingImpl>
    implements _$$CreatingImplCopyWith<$Res> {
  __$$CreatingImplCopyWithImpl(
      _$CreatingImpl _value, $Res Function(_$CreatingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreatingImpl implements Creating {
  const _$CreatingImpl();

  @override
  String toString() {
    return 'ChaletManagementState.creating()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreatingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Chalet> chalets,
            List<Chalet> filteredChalets,
            String searchQuery,
            ChaletSortBy sortBy)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() creating,
    required TResult Function(Chalet chalet) created,
    required TResult Function() updating,
    required TResult Function(Chalet chalet) updated,
    required TResult Function() deleting,
    required TResult Function(int chaletId) deleted,
    required TResult Function() uploadingImages,
    required TResult Function(int chaletId, List<ChaletImage> images)
        imagesUploaded,
  }) {
    return creating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? creating,
    TResult? Function(Chalet chalet)? created,
    TResult? Function()? updating,
    TResult? Function(Chalet chalet)? updated,
    TResult? Function()? deleting,
    TResult? Function(int chaletId)? deleted,
    TResult? Function()? uploadingImages,
    TResult? Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
  }) {
    return creating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? creating,
    TResult Function(Chalet chalet)? created,
    TResult Function()? updating,
    TResult Function(Chalet chalet)? updated,
    TResult Function()? deleting,
    TResult Function(int chaletId)? deleted,
    TResult Function()? uploadingImages,
    TResult Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (creating != null) {
      return creating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(Creating value) creating,
    required TResult Function(Created value) created,
    required TResult Function(Updating value) updating,
    required TResult Function(Updated value) updated,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Deleted value) deleted,
    required TResult Function(UploadingImages value) uploadingImages,
    required TResult Function(ImagesUploaded value) imagesUploaded,
  }) {
    return creating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(Creating value)? creating,
    TResult? Function(Created value)? created,
    TResult? Function(Updating value)? updating,
    TResult? Function(Updated value)? updated,
    TResult? Function(Deleting value)? deleting,
    TResult? Function(Deleted value)? deleted,
    TResult? Function(UploadingImages value)? uploadingImages,
    TResult? Function(ImagesUploaded value)? imagesUploaded,
  }) {
    return creating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(Creating value)? creating,
    TResult Function(Created value)? created,
    TResult Function(Updating value)? updating,
    TResult Function(Updated value)? updated,
    TResult Function(Deleting value)? deleting,
    TResult Function(Deleted value)? deleted,
    TResult Function(UploadingImages value)? uploadingImages,
    TResult Function(ImagesUploaded value)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (creating != null) {
      return creating(this);
    }
    return orElse();
  }
}

abstract class Creating implements ChaletManagementState {
  const factory Creating() = _$CreatingImpl;
}

/// @nodoc
abstract class _$$CreatedImplCopyWith<$Res> {
  factory _$$CreatedImplCopyWith(
          _$CreatedImpl value, $Res Function(_$CreatedImpl) then) =
      __$$CreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Chalet chalet});
}

/// @nodoc
class __$$CreatedImplCopyWithImpl<$Res>
    extends _$ChaletManagementStateCopyWithImpl<$Res, _$CreatedImpl>
    implements _$$CreatedImplCopyWith<$Res> {
  __$$CreatedImplCopyWithImpl(
      _$CreatedImpl _value, $Res Function(_$CreatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chalet = null,
  }) {
    return _then(_$CreatedImpl(
      null == chalet
          ? _value.chalet
          : chalet // ignore: cast_nullable_to_non_nullable
              as Chalet,
    ));
  }
}

/// @nodoc

class _$CreatedImpl implements Created {
  const _$CreatedImpl(this.chalet);

  @override
  final Chalet chalet;

  @override
  String toString() {
    return 'ChaletManagementState.created(chalet: $chalet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedImpl &&
            (identical(other.chalet, chalet) || other.chalet == chalet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chalet);

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedImplCopyWith<_$CreatedImpl> get copyWith =>
      __$$CreatedImplCopyWithImpl<_$CreatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Chalet> chalets,
            List<Chalet> filteredChalets,
            String searchQuery,
            ChaletSortBy sortBy)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() creating,
    required TResult Function(Chalet chalet) created,
    required TResult Function() updating,
    required TResult Function(Chalet chalet) updated,
    required TResult Function() deleting,
    required TResult Function(int chaletId) deleted,
    required TResult Function() uploadingImages,
    required TResult Function(int chaletId, List<ChaletImage> images)
        imagesUploaded,
  }) {
    return created(chalet);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? creating,
    TResult? Function(Chalet chalet)? created,
    TResult? Function()? updating,
    TResult? Function(Chalet chalet)? updated,
    TResult? Function()? deleting,
    TResult? Function(int chaletId)? deleted,
    TResult? Function()? uploadingImages,
    TResult? Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
  }) {
    return created?.call(chalet);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? creating,
    TResult Function(Chalet chalet)? created,
    TResult Function()? updating,
    TResult Function(Chalet chalet)? updated,
    TResult Function()? deleting,
    TResult Function(int chaletId)? deleted,
    TResult Function()? uploadingImages,
    TResult Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(chalet);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(Creating value) creating,
    required TResult Function(Created value) created,
    required TResult Function(Updating value) updating,
    required TResult Function(Updated value) updated,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Deleted value) deleted,
    required TResult Function(UploadingImages value) uploadingImages,
    required TResult Function(ImagesUploaded value) imagesUploaded,
  }) {
    return created(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(Creating value)? creating,
    TResult? Function(Created value)? created,
    TResult? Function(Updating value)? updating,
    TResult? Function(Updated value)? updated,
    TResult? Function(Deleting value)? deleting,
    TResult? Function(Deleted value)? deleted,
    TResult? Function(UploadingImages value)? uploadingImages,
    TResult? Function(ImagesUploaded value)? imagesUploaded,
  }) {
    return created?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(Creating value)? creating,
    TResult Function(Created value)? created,
    TResult Function(Updating value)? updating,
    TResult Function(Updated value)? updated,
    TResult Function(Deleting value)? deleting,
    TResult Function(Deleted value)? deleted,
    TResult Function(UploadingImages value)? uploadingImages,
    TResult Function(ImagesUploaded value)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(this);
    }
    return orElse();
  }
}

abstract class Created implements ChaletManagementState {
  const factory Created(final Chalet chalet) = _$CreatedImpl;

  Chalet get chalet;

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatedImplCopyWith<_$CreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatingImplCopyWith<$Res> {
  factory _$$UpdatingImplCopyWith(
          _$UpdatingImpl value, $Res Function(_$UpdatingImpl) then) =
      __$$UpdatingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdatingImplCopyWithImpl<$Res>
    extends _$ChaletManagementStateCopyWithImpl<$Res, _$UpdatingImpl>
    implements _$$UpdatingImplCopyWith<$Res> {
  __$$UpdatingImplCopyWithImpl(
      _$UpdatingImpl _value, $Res Function(_$UpdatingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdatingImpl implements Updating {
  const _$UpdatingImpl();

  @override
  String toString() {
    return 'ChaletManagementState.updating()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdatingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Chalet> chalets,
            List<Chalet> filteredChalets,
            String searchQuery,
            ChaletSortBy sortBy)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() creating,
    required TResult Function(Chalet chalet) created,
    required TResult Function() updating,
    required TResult Function(Chalet chalet) updated,
    required TResult Function() deleting,
    required TResult Function(int chaletId) deleted,
    required TResult Function() uploadingImages,
    required TResult Function(int chaletId, List<ChaletImage> images)
        imagesUploaded,
  }) {
    return updating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? creating,
    TResult? Function(Chalet chalet)? created,
    TResult? Function()? updating,
    TResult? Function(Chalet chalet)? updated,
    TResult? Function()? deleting,
    TResult? Function(int chaletId)? deleted,
    TResult? Function()? uploadingImages,
    TResult? Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
  }) {
    return updating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? creating,
    TResult Function(Chalet chalet)? created,
    TResult Function()? updating,
    TResult Function(Chalet chalet)? updated,
    TResult Function()? deleting,
    TResult Function(int chaletId)? deleted,
    TResult Function()? uploadingImages,
    TResult Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(Creating value) creating,
    required TResult Function(Created value) created,
    required TResult Function(Updating value) updating,
    required TResult Function(Updated value) updated,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Deleted value) deleted,
    required TResult Function(UploadingImages value) uploadingImages,
    required TResult Function(ImagesUploaded value) imagesUploaded,
  }) {
    return updating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(Creating value)? creating,
    TResult? Function(Created value)? created,
    TResult? Function(Updating value)? updating,
    TResult? Function(Updated value)? updated,
    TResult? Function(Deleting value)? deleting,
    TResult? Function(Deleted value)? deleted,
    TResult? Function(UploadingImages value)? uploadingImages,
    TResult? Function(ImagesUploaded value)? imagesUploaded,
  }) {
    return updating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(Creating value)? creating,
    TResult Function(Created value)? created,
    TResult Function(Updating value)? updating,
    TResult Function(Updated value)? updated,
    TResult Function(Deleting value)? deleting,
    TResult Function(Deleted value)? deleted,
    TResult Function(UploadingImages value)? uploadingImages,
    TResult Function(ImagesUploaded value)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(this);
    }
    return orElse();
  }
}

abstract class Updating implements ChaletManagementState {
  const factory Updating() = _$UpdatingImpl;
}

/// @nodoc
abstract class _$$UpdatedImplCopyWith<$Res> {
  factory _$$UpdatedImplCopyWith(
          _$UpdatedImpl value, $Res Function(_$UpdatedImpl) then) =
      __$$UpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Chalet chalet});
}

/// @nodoc
class __$$UpdatedImplCopyWithImpl<$Res>
    extends _$ChaletManagementStateCopyWithImpl<$Res, _$UpdatedImpl>
    implements _$$UpdatedImplCopyWith<$Res> {
  __$$UpdatedImplCopyWithImpl(
      _$UpdatedImpl _value, $Res Function(_$UpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chalet = null,
  }) {
    return _then(_$UpdatedImpl(
      null == chalet
          ? _value.chalet
          : chalet // ignore: cast_nullable_to_non_nullable
              as Chalet,
    ));
  }
}

/// @nodoc

class _$UpdatedImpl implements Updated {
  const _$UpdatedImpl(this.chalet);

  @override
  final Chalet chalet;

  @override
  String toString() {
    return 'ChaletManagementState.updated(chalet: $chalet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatedImpl &&
            (identical(other.chalet, chalet) || other.chalet == chalet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chalet);

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatedImplCopyWith<_$UpdatedImpl> get copyWith =>
      __$$UpdatedImplCopyWithImpl<_$UpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Chalet> chalets,
            List<Chalet> filteredChalets,
            String searchQuery,
            ChaletSortBy sortBy)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() creating,
    required TResult Function(Chalet chalet) created,
    required TResult Function() updating,
    required TResult Function(Chalet chalet) updated,
    required TResult Function() deleting,
    required TResult Function(int chaletId) deleted,
    required TResult Function() uploadingImages,
    required TResult Function(int chaletId, List<ChaletImage> images)
        imagesUploaded,
  }) {
    return updated(chalet);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? creating,
    TResult? Function(Chalet chalet)? created,
    TResult? Function()? updating,
    TResult? Function(Chalet chalet)? updated,
    TResult? Function()? deleting,
    TResult? Function(int chaletId)? deleted,
    TResult? Function()? uploadingImages,
    TResult? Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
  }) {
    return updated?.call(chalet);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? creating,
    TResult Function(Chalet chalet)? created,
    TResult Function()? updating,
    TResult Function(Chalet chalet)? updated,
    TResult Function()? deleting,
    TResult Function(int chaletId)? deleted,
    TResult Function()? uploadingImages,
    TResult Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(chalet);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(Creating value) creating,
    required TResult Function(Created value) created,
    required TResult Function(Updating value) updating,
    required TResult Function(Updated value) updated,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Deleted value) deleted,
    required TResult Function(UploadingImages value) uploadingImages,
    required TResult Function(ImagesUploaded value) imagesUploaded,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(Creating value)? creating,
    TResult? Function(Created value)? created,
    TResult? Function(Updating value)? updating,
    TResult? Function(Updated value)? updated,
    TResult? Function(Deleting value)? deleting,
    TResult? Function(Deleted value)? deleted,
    TResult? Function(UploadingImages value)? uploadingImages,
    TResult? Function(ImagesUploaded value)? imagesUploaded,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(Creating value)? creating,
    TResult Function(Created value)? created,
    TResult Function(Updating value)? updating,
    TResult Function(Updated value)? updated,
    TResult Function(Deleting value)? deleting,
    TResult Function(Deleted value)? deleted,
    TResult Function(UploadingImages value)? uploadingImages,
    TResult Function(ImagesUploaded value)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class Updated implements ChaletManagementState {
  const factory Updated(final Chalet chalet) = _$UpdatedImpl;

  Chalet get chalet;

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatedImplCopyWith<_$UpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletingImplCopyWith<$Res> {
  factory _$$DeletingImplCopyWith(
          _$DeletingImpl value, $Res Function(_$DeletingImpl) then) =
      __$$DeletingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeletingImplCopyWithImpl<$Res>
    extends _$ChaletManagementStateCopyWithImpl<$Res, _$DeletingImpl>
    implements _$$DeletingImplCopyWith<$Res> {
  __$$DeletingImplCopyWithImpl(
      _$DeletingImpl _value, $Res Function(_$DeletingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeletingImpl implements Deleting {
  const _$DeletingImpl();

  @override
  String toString() {
    return 'ChaletManagementState.deleting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeletingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Chalet> chalets,
            List<Chalet> filteredChalets,
            String searchQuery,
            ChaletSortBy sortBy)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() creating,
    required TResult Function(Chalet chalet) created,
    required TResult Function() updating,
    required TResult Function(Chalet chalet) updated,
    required TResult Function() deleting,
    required TResult Function(int chaletId) deleted,
    required TResult Function() uploadingImages,
    required TResult Function(int chaletId, List<ChaletImage> images)
        imagesUploaded,
  }) {
    return deleting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? creating,
    TResult? Function(Chalet chalet)? created,
    TResult? Function()? updating,
    TResult? Function(Chalet chalet)? updated,
    TResult? Function()? deleting,
    TResult? Function(int chaletId)? deleted,
    TResult? Function()? uploadingImages,
    TResult? Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
  }) {
    return deleting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? creating,
    TResult Function(Chalet chalet)? created,
    TResult Function()? updating,
    TResult Function(Chalet chalet)? updated,
    TResult Function()? deleting,
    TResult Function(int chaletId)? deleted,
    TResult Function()? uploadingImages,
    TResult Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (deleting != null) {
      return deleting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(Creating value) creating,
    required TResult Function(Created value) created,
    required TResult Function(Updating value) updating,
    required TResult Function(Updated value) updated,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Deleted value) deleted,
    required TResult Function(UploadingImages value) uploadingImages,
    required TResult Function(ImagesUploaded value) imagesUploaded,
  }) {
    return deleting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(Creating value)? creating,
    TResult? Function(Created value)? created,
    TResult? Function(Updating value)? updating,
    TResult? Function(Updated value)? updated,
    TResult? Function(Deleting value)? deleting,
    TResult? Function(Deleted value)? deleted,
    TResult? Function(UploadingImages value)? uploadingImages,
    TResult? Function(ImagesUploaded value)? imagesUploaded,
  }) {
    return deleting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(Creating value)? creating,
    TResult Function(Created value)? created,
    TResult Function(Updating value)? updating,
    TResult Function(Updated value)? updated,
    TResult Function(Deleting value)? deleting,
    TResult Function(Deleted value)? deleted,
    TResult Function(UploadingImages value)? uploadingImages,
    TResult Function(ImagesUploaded value)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (deleting != null) {
      return deleting(this);
    }
    return orElse();
  }
}

abstract class Deleting implements ChaletManagementState {
  const factory Deleting() = _$DeletingImpl;
}

/// @nodoc
abstract class _$$DeletedImplCopyWith<$Res> {
  factory _$$DeletedImplCopyWith(
          _$DeletedImpl value, $Res Function(_$DeletedImpl) then) =
      __$$DeletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int chaletId});
}

/// @nodoc
class __$$DeletedImplCopyWithImpl<$Res>
    extends _$ChaletManagementStateCopyWithImpl<$Res, _$DeletedImpl>
    implements _$$DeletedImplCopyWith<$Res> {
  __$$DeletedImplCopyWithImpl(
      _$DeletedImpl _value, $Res Function(_$DeletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chaletId = null,
  }) {
    return _then(_$DeletedImpl(
      null == chaletId
          ? _value.chaletId
          : chaletId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeletedImpl implements Deleted {
  const _$DeletedImpl(this.chaletId);

  @override
  final int chaletId;

  @override
  String toString() {
    return 'ChaletManagementState.deleted(chaletId: $chaletId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletedImpl &&
            (identical(other.chaletId, chaletId) ||
                other.chaletId == chaletId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chaletId);

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletedImplCopyWith<_$DeletedImpl> get copyWith =>
      __$$DeletedImplCopyWithImpl<_$DeletedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Chalet> chalets,
            List<Chalet> filteredChalets,
            String searchQuery,
            ChaletSortBy sortBy)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() creating,
    required TResult Function(Chalet chalet) created,
    required TResult Function() updating,
    required TResult Function(Chalet chalet) updated,
    required TResult Function() deleting,
    required TResult Function(int chaletId) deleted,
    required TResult Function() uploadingImages,
    required TResult Function(int chaletId, List<ChaletImage> images)
        imagesUploaded,
  }) {
    return deleted(chaletId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? creating,
    TResult? Function(Chalet chalet)? created,
    TResult? Function()? updating,
    TResult? Function(Chalet chalet)? updated,
    TResult? Function()? deleting,
    TResult? Function(int chaletId)? deleted,
    TResult? Function()? uploadingImages,
    TResult? Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
  }) {
    return deleted?.call(chaletId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? creating,
    TResult Function(Chalet chalet)? created,
    TResult Function()? updating,
    TResult Function(Chalet chalet)? updated,
    TResult Function()? deleting,
    TResult Function(int chaletId)? deleted,
    TResult Function()? uploadingImages,
    TResult Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(chaletId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(Creating value) creating,
    required TResult Function(Created value) created,
    required TResult Function(Updating value) updating,
    required TResult Function(Updated value) updated,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Deleted value) deleted,
    required TResult Function(UploadingImages value) uploadingImages,
    required TResult Function(ImagesUploaded value) imagesUploaded,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(Creating value)? creating,
    TResult? Function(Created value)? created,
    TResult? Function(Updating value)? updating,
    TResult? Function(Updated value)? updated,
    TResult? Function(Deleting value)? deleting,
    TResult? Function(Deleted value)? deleted,
    TResult? Function(UploadingImages value)? uploadingImages,
    TResult? Function(ImagesUploaded value)? imagesUploaded,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(Creating value)? creating,
    TResult Function(Created value)? created,
    TResult Function(Updating value)? updating,
    TResult Function(Updated value)? updated,
    TResult Function(Deleting value)? deleting,
    TResult Function(Deleted value)? deleted,
    TResult Function(UploadingImages value)? uploadingImages,
    TResult Function(ImagesUploaded value)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class Deleted implements ChaletManagementState {
  const factory Deleted(final int chaletId) = _$DeletedImpl;

  int get chaletId;

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeletedImplCopyWith<_$DeletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadingImagesImplCopyWith<$Res> {
  factory _$$UploadingImagesImplCopyWith(_$UploadingImagesImpl value,
          $Res Function(_$UploadingImagesImpl) then) =
      __$$UploadingImagesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UploadingImagesImplCopyWithImpl<$Res>
    extends _$ChaletManagementStateCopyWithImpl<$Res, _$UploadingImagesImpl>
    implements _$$UploadingImagesImplCopyWith<$Res> {
  __$$UploadingImagesImplCopyWithImpl(
      _$UploadingImagesImpl _value, $Res Function(_$UploadingImagesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UploadingImagesImpl implements UploadingImages {
  const _$UploadingImagesImpl();

  @override
  String toString() {
    return 'ChaletManagementState.uploadingImages()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UploadingImagesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Chalet> chalets,
            List<Chalet> filteredChalets,
            String searchQuery,
            ChaletSortBy sortBy)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() creating,
    required TResult Function(Chalet chalet) created,
    required TResult Function() updating,
    required TResult Function(Chalet chalet) updated,
    required TResult Function() deleting,
    required TResult Function(int chaletId) deleted,
    required TResult Function() uploadingImages,
    required TResult Function(int chaletId, List<ChaletImage> images)
        imagesUploaded,
  }) {
    return uploadingImages();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? creating,
    TResult? Function(Chalet chalet)? created,
    TResult? Function()? updating,
    TResult? Function(Chalet chalet)? updated,
    TResult? Function()? deleting,
    TResult? Function(int chaletId)? deleted,
    TResult? Function()? uploadingImages,
    TResult? Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
  }) {
    return uploadingImages?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? creating,
    TResult Function(Chalet chalet)? created,
    TResult Function()? updating,
    TResult Function(Chalet chalet)? updated,
    TResult Function()? deleting,
    TResult Function(int chaletId)? deleted,
    TResult Function()? uploadingImages,
    TResult Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (uploadingImages != null) {
      return uploadingImages();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(Creating value) creating,
    required TResult Function(Created value) created,
    required TResult Function(Updating value) updating,
    required TResult Function(Updated value) updated,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Deleted value) deleted,
    required TResult Function(UploadingImages value) uploadingImages,
    required TResult Function(ImagesUploaded value) imagesUploaded,
  }) {
    return uploadingImages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(Creating value)? creating,
    TResult? Function(Created value)? created,
    TResult? Function(Updating value)? updating,
    TResult? Function(Updated value)? updated,
    TResult? Function(Deleting value)? deleting,
    TResult? Function(Deleted value)? deleted,
    TResult? Function(UploadingImages value)? uploadingImages,
    TResult? Function(ImagesUploaded value)? imagesUploaded,
  }) {
    return uploadingImages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(Creating value)? creating,
    TResult Function(Created value)? created,
    TResult Function(Updating value)? updating,
    TResult Function(Updated value)? updated,
    TResult Function(Deleting value)? deleting,
    TResult Function(Deleted value)? deleted,
    TResult Function(UploadingImages value)? uploadingImages,
    TResult Function(ImagesUploaded value)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (uploadingImages != null) {
      return uploadingImages(this);
    }
    return orElse();
  }
}

abstract class UploadingImages implements ChaletManagementState {
  const factory UploadingImages() = _$UploadingImagesImpl;
}

/// @nodoc
abstract class _$$ImagesUploadedImplCopyWith<$Res> {
  factory _$$ImagesUploadedImplCopyWith(_$ImagesUploadedImpl value,
          $Res Function(_$ImagesUploadedImpl) then) =
      __$$ImagesUploadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int chaletId, List<ChaletImage> images});
}

/// @nodoc
class __$$ImagesUploadedImplCopyWithImpl<$Res>
    extends _$ChaletManagementStateCopyWithImpl<$Res, _$ImagesUploadedImpl>
    implements _$$ImagesUploadedImplCopyWith<$Res> {
  __$$ImagesUploadedImplCopyWithImpl(
      _$ImagesUploadedImpl _value, $Res Function(_$ImagesUploadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chaletId = null,
    Object? images = null,
  }) {
    return _then(_$ImagesUploadedImpl(
      null == chaletId
          ? _value.chaletId
          : chaletId // ignore: cast_nullable_to_non_nullable
              as int,
      null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ChaletImage>,
    ));
  }
}

/// @nodoc

class _$ImagesUploadedImpl implements ImagesUploaded {
  const _$ImagesUploadedImpl(this.chaletId, final List<ChaletImage> images)
      : _images = images;

  @override
  final int chaletId;
  final List<ChaletImage> _images;
  @override
  List<ChaletImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'ChaletManagementState.imagesUploaded(chaletId: $chaletId, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesUploadedImpl &&
            (identical(other.chaletId, chaletId) ||
                other.chaletId == chaletId) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, chaletId, const DeepCollectionEquality().hash(_images));

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesUploadedImplCopyWith<_$ImagesUploadedImpl> get copyWith =>
      __$$ImagesUploadedImplCopyWithImpl<_$ImagesUploadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Chalet> chalets,
            List<Chalet> filteredChalets,
            String searchQuery,
            ChaletSortBy sortBy)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() creating,
    required TResult Function(Chalet chalet) created,
    required TResult Function() updating,
    required TResult Function(Chalet chalet) updated,
    required TResult Function() deleting,
    required TResult Function(int chaletId) deleted,
    required TResult Function() uploadingImages,
    required TResult Function(int chaletId, List<ChaletImage> images)
        imagesUploaded,
  }) {
    return imagesUploaded(chaletId, images);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? creating,
    TResult? Function(Chalet chalet)? created,
    TResult? Function()? updating,
    TResult? Function(Chalet chalet)? updated,
    TResult? Function()? deleting,
    TResult? Function(int chaletId)? deleted,
    TResult? Function()? uploadingImages,
    TResult? Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
  }) {
    return imagesUploaded?.call(chaletId, images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Chalet> chalets, List<Chalet> filteredChalets,
            String searchQuery, ChaletSortBy sortBy)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? creating,
    TResult Function(Chalet chalet)? created,
    TResult Function()? updating,
    TResult Function(Chalet chalet)? updated,
    TResult Function()? deleting,
    TResult Function(int chaletId)? deleted,
    TResult Function()? uploadingImages,
    TResult Function(int chaletId, List<ChaletImage> images)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (imagesUploaded != null) {
      return imagesUploaded(chaletId, images);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Error value) error,
    required TResult Function(Creating value) creating,
    required TResult Function(Created value) created,
    required TResult Function(Updating value) updating,
    required TResult Function(Updated value) updated,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Deleted value) deleted,
    required TResult Function(UploadingImages value) uploadingImages,
    required TResult Function(ImagesUploaded value) imagesUploaded,
  }) {
    return imagesUploaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Error value)? error,
    TResult? Function(Creating value)? creating,
    TResult? Function(Created value)? created,
    TResult? Function(Updating value)? updating,
    TResult? Function(Updated value)? updated,
    TResult? Function(Deleting value)? deleting,
    TResult? Function(Deleted value)? deleted,
    TResult? Function(UploadingImages value)? uploadingImages,
    TResult? Function(ImagesUploaded value)? imagesUploaded,
  }) {
    return imagesUploaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Error value)? error,
    TResult Function(Creating value)? creating,
    TResult Function(Created value)? created,
    TResult Function(Updating value)? updating,
    TResult Function(Updated value)? updated,
    TResult Function(Deleting value)? deleting,
    TResult Function(Deleted value)? deleted,
    TResult Function(UploadingImages value)? uploadingImages,
    TResult Function(ImagesUploaded value)? imagesUploaded,
    required TResult orElse(),
  }) {
    if (imagesUploaded != null) {
      return imagesUploaded(this);
    }
    return orElse();
  }
}

abstract class ImagesUploaded implements ChaletManagementState {
  const factory ImagesUploaded(
          final int chaletId, final List<ChaletImage> images) =
      _$ImagesUploadedImpl;

  int get chaletId;
  List<ChaletImage> get images;

  /// Create a copy of ChaletManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImagesUploadedImplCopyWith<_$ImagesUploadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
