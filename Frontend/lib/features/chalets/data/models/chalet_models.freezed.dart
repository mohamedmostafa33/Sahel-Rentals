// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chalet_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChaletModel _$ChaletModelFromJson(Map<String, dynamic> json) {
  return _ChaletModel.fromJson(json);
}

/// @nodoc
mixin _$ChaletModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_rooms')
  int get numberOfRooms => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_per_night')
  double get pricePerNight => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_number')
  String get unitNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'main_image')
  String? get mainImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_count')
  int get imageCount => throw _privateConstructorUsedError;
  List<ChaletImageModel> get images => throw _privateConstructorUsedError;

  /// Serializes this ChaletModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChaletModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChaletModelCopyWith<ChaletModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChaletModelCopyWith<$Res> {
  factory $ChaletModelCopyWith(
          ChaletModel value, $Res Function(ChaletModel) then) =
      _$ChaletModelCopyWithImpl<$Res, ChaletModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'number_of_rooms') int numberOfRooms,
      @JsonKey(name: 'price_per_night') double pricePerNight,
      String? notes,
      String location,
      @JsonKey(name: 'unit_number') String unitNumber,
      @JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'main_image') String? mainImage,
      @JsonKey(name: 'image_count') int imageCount,
      List<ChaletImageModel> images});
}

/// @nodoc
class _$ChaletModelCopyWithImpl<$Res, $Val extends ChaletModel>
    implements $ChaletModelCopyWith<$Res> {
  _$ChaletModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChaletModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? numberOfRooms = null,
    Object? pricePerNight = null,
    Object? notes = freezed,
    Object? location = null,
    Object? unitNumber = null,
    Object? isAvailable = null,
    Object? createdAt = null,
    Object? mainImage = freezed,
    Object? imageCount = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfRooms: null == numberOfRooms
          ? _value.numberOfRooms
          : numberOfRooms // ignore: cast_nullable_to_non_nullable
              as int,
      pricePerNight: null == pricePerNight
          ? _value.pricePerNight
          : pricePerNight // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      unitNumber: null == unitNumber
          ? _value.unitNumber
          : unitNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mainImage: freezed == mainImage
          ? _value.mainImage
          : mainImage // ignore: cast_nullable_to_non_nullable
              as String?,
      imageCount: null == imageCount
          ? _value.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ChaletImageModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChaletModelImplCopyWith<$Res>
    implements $ChaletModelCopyWith<$Res> {
  factory _$$ChaletModelImplCopyWith(
          _$ChaletModelImpl value, $Res Function(_$ChaletModelImpl) then) =
      __$$ChaletModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'number_of_rooms') int numberOfRooms,
      @JsonKey(name: 'price_per_night') double pricePerNight,
      String? notes,
      String location,
      @JsonKey(name: 'unit_number') String unitNumber,
      @JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'main_image') String? mainImage,
      @JsonKey(name: 'image_count') int imageCount,
      List<ChaletImageModel> images});
}

/// @nodoc
class __$$ChaletModelImplCopyWithImpl<$Res>
    extends _$ChaletModelCopyWithImpl<$Res, _$ChaletModelImpl>
    implements _$$ChaletModelImplCopyWith<$Res> {
  __$$ChaletModelImplCopyWithImpl(
      _$ChaletModelImpl _value, $Res Function(_$ChaletModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? numberOfRooms = null,
    Object? pricePerNight = null,
    Object? notes = freezed,
    Object? location = null,
    Object? unitNumber = null,
    Object? isAvailable = null,
    Object? createdAt = null,
    Object? mainImage = freezed,
    Object? imageCount = null,
    Object? images = null,
  }) {
    return _then(_$ChaletModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfRooms: null == numberOfRooms
          ? _value.numberOfRooms
          : numberOfRooms // ignore: cast_nullable_to_non_nullable
              as int,
      pricePerNight: null == pricePerNight
          ? _value.pricePerNight
          : pricePerNight // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      unitNumber: null == unitNumber
          ? _value.unitNumber
          : unitNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mainImage: freezed == mainImage
          ? _value.mainImage
          : mainImage // ignore: cast_nullable_to_non_nullable
              as String?,
      imageCount: null == imageCount
          ? _value.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ChaletImageModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChaletModelImpl implements _ChaletModel {
  const _$ChaletModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'number_of_rooms') required this.numberOfRooms,
      @JsonKey(name: 'price_per_night') required this.pricePerNight,
      this.notes,
      required this.location,
      @JsonKey(name: 'unit_number') required this.unitNumber,
      @JsonKey(name: 'is_available') required this.isAvailable,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'main_image') this.mainImage,
      @JsonKey(name: 'image_count') this.imageCount = 0,
      final List<ChaletImageModel> images = const []})
      : _images = images;

  factory _$ChaletModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChaletModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'number_of_rooms')
  final int numberOfRooms;
  @override
  @JsonKey(name: 'price_per_night')
  final double pricePerNight;
  @override
  final String? notes;
  @override
  final String location;
  @override
  @JsonKey(name: 'unit_number')
  final String unitNumber;
  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'main_image')
  final String? mainImage;
  @override
  @JsonKey(name: 'image_count')
  final int imageCount;
  final List<ChaletImageModel> _images;
  @override
  @JsonKey()
  List<ChaletImageModel> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'ChaletModel(id: $id, name: $name, numberOfRooms: $numberOfRooms, pricePerNight: $pricePerNight, notes: $notes, location: $location, unitNumber: $unitNumber, isAvailable: $isAvailable, createdAt: $createdAt, mainImage: $mainImage, imageCount: $imageCount, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChaletModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.numberOfRooms, numberOfRooms) ||
                other.numberOfRooms == numberOfRooms) &&
            (identical(other.pricePerNight, pricePerNight) ||
                other.pricePerNight == pricePerNight) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.unitNumber, unitNumber) ||
                other.unitNumber == unitNumber) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.mainImage, mainImage) ||
                other.mainImage == mainImage) &&
            (identical(other.imageCount, imageCount) ||
                other.imageCount == imageCount) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      numberOfRooms,
      pricePerNight,
      notes,
      location,
      unitNumber,
      isAvailable,
      createdAt,
      mainImage,
      imageCount,
      const DeepCollectionEquality().hash(_images));

  /// Create a copy of ChaletModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChaletModelImplCopyWith<_$ChaletModelImpl> get copyWith =>
      __$$ChaletModelImplCopyWithImpl<_$ChaletModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChaletModelImplToJson(
      this,
    );
  }
}

abstract class _ChaletModel implements ChaletModel {
  const factory _ChaletModel(
      {required final int id,
      required final String name,
      @JsonKey(name: 'number_of_rooms') required final int numberOfRooms,
      @JsonKey(name: 'price_per_night') required final double pricePerNight,
      final String? notes,
      required final String location,
      @JsonKey(name: 'unit_number') required final String unitNumber,
      @JsonKey(name: 'is_available') required final bool isAvailable,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'main_image') final String? mainImage,
      @JsonKey(name: 'image_count') final int imageCount,
      final List<ChaletImageModel> images}) = _$ChaletModelImpl;

  factory _ChaletModel.fromJson(Map<String, dynamic> json) =
      _$ChaletModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'number_of_rooms')
  int get numberOfRooms;
  @override
  @JsonKey(name: 'price_per_night')
  double get pricePerNight;
  @override
  String? get notes;
  @override
  String get location;
  @override
  @JsonKey(name: 'unit_number')
  String get unitNumber;
  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'main_image')
  String? get mainImage;
  @override
  @JsonKey(name: 'image_count')
  int get imageCount;
  @override
  List<ChaletImageModel> get images;

  /// Create a copy of ChaletModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChaletModelImplCopyWith<_$ChaletModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChaletImageModel _$ChaletImageModelFromJson(Map<String, dynamic> json) {
  return _ChaletImageModel.fromJson(json);
}

/// @nodoc
mixin _$ChaletImageModel {
  int get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_main')
  bool get isMain => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ChaletImageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChaletImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChaletImageModelCopyWith<ChaletImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChaletImageModelCopyWith<$Res> {
  factory $ChaletImageModelCopyWith(
          ChaletImageModel value, $Res Function(ChaletImageModel) then) =
      _$ChaletImageModelCopyWithImpl<$Res, ChaletImageModel>;
  @useResult
  $Res call(
      {int id,
      String image,
      @JsonKey(name: 'is_main') bool isMain,
      String? caption,
      int order,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$ChaletImageModelCopyWithImpl<$Res, $Val extends ChaletImageModel>
    implements $ChaletImageModelCopyWith<$Res> {
  _$ChaletImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChaletImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? isMain = null,
    Object? caption = freezed,
    Object? order = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      isMain: null == isMain
          ? _value.isMain
          : isMain // ignore: cast_nullable_to_non_nullable
              as bool,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChaletImageModelImplCopyWith<$Res>
    implements $ChaletImageModelCopyWith<$Res> {
  factory _$$ChaletImageModelImplCopyWith(_$ChaletImageModelImpl value,
          $Res Function(_$ChaletImageModelImpl) then) =
      __$$ChaletImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String image,
      @JsonKey(name: 'is_main') bool isMain,
      String? caption,
      int order,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$ChaletImageModelImplCopyWithImpl<$Res>
    extends _$ChaletImageModelCopyWithImpl<$Res, _$ChaletImageModelImpl>
    implements _$$ChaletImageModelImplCopyWith<$Res> {
  __$$ChaletImageModelImplCopyWithImpl(_$ChaletImageModelImpl _value,
      $Res Function(_$ChaletImageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? isMain = null,
    Object? caption = freezed,
    Object? order = null,
    Object? createdAt = null,
  }) {
    return _then(_$ChaletImageModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      isMain: null == isMain
          ? _value.isMain
          : isMain // ignore: cast_nullable_to_non_nullable
              as bool,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChaletImageModelImpl implements _ChaletImageModel {
  const _$ChaletImageModelImpl(
      {required this.id,
      required this.image,
      @JsonKey(name: 'is_main') required this.isMain,
      this.caption,
      required this.order,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$ChaletImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChaletImageModelImplFromJson(json);

  @override
  final int id;
  @override
  final String image;
  @override
  @JsonKey(name: 'is_main')
  final bool isMain;
  @override
  final String? caption;
  @override
  final int order;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'ChaletImageModel(id: $id, image: $image, isMain: $isMain, caption: $caption, order: $order, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChaletImageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.isMain, isMain) || other.isMain == isMain) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, image, isMain, caption, order, createdAt);

  /// Create a copy of ChaletImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChaletImageModelImplCopyWith<_$ChaletImageModelImpl> get copyWith =>
      __$$ChaletImageModelImplCopyWithImpl<_$ChaletImageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChaletImageModelImplToJson(
      this,
    );
  }
}

abstract class _ChaletImageModel implements ChaletImageModel {
  const factory _ChaletImageModel(
          {required final int id,
          required final String image,
          @JsonKey(name: 'is_main') required final bool isMain,
          final String? caption,
          required final int order,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$ChaletImageModelImpl;

  factory _ChaletImageModel.fromJson(Map<String, dynamic> json) =
      _$ChaletImageModelImpl.fromJson;

  @override
  int get id;
  @override
  String get image;
  @override
  @JsonKey(name: 'is_main')
  bool get isMain;
  @override
  String? get caption;
  @override
  int get order;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of ChaletImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChaletImageModelImplCopyWith<_$ChaletImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChaletCreateRequest _$ChaletCreateRequestFromJson(Map<String, dynamic> json) {
  return _ChaletCreateRequest.fromJson(json);
}

/// @nodoc
mixin _$ChaletCreateRequest {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_rooms')
  int get numberOfRooms => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_per_night')
  double get pricePerNight => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_number')
  String get unitNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;

  /// Serializes this ChaletCreateRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChaletCreateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChaletCreateRequestCopyWith<ChaletCreateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChaletCreateRequestCopyWith<$Res> {
  factory $ChaletCreateRequestCopyWith(
          ChaletCreateRequest value, $Res Function(ChaletCreateRequest) then) =
      _$ChaletCreateRequestCopyWithImpl<$Res, ChaletCreateRequest>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'number_of_rooms') int numberOfRooms,
      @JsonKey(name: 'price_per_night') double pricePerNight,
      String? notes,
      String location,
      @JsonKey(name: 'unit_number') String unitNumber,
      @JsonKey(name: 'is_available') bool isAvailable});
}

/// @nodoc
class _$ChaletCreateRequestCopyWithImpl<$Res, $Val extends ChaletCreateRequest>
    implements $ChaletCreateRequestCopyWith<$Res> {
  _$ChaletCreateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChaletCreateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? numberOfRooms = null,
    Object? pricePerNight = null,
    Object? notes = freezed,
    Object? location = null,
    Object? unitNumber = null,
    Object? isAvailable = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfRooms: null == numberOfRooms
          ? _value.numberOfRooms
          : numberOfRooms // ignore: cast_nullable_to_non_nullable
              as int,
      pricePerNight: null == pricePerNight
          ? _value.pricePerNight
          : pricePerNight // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      unitNumber: null == unitNumber
          ? _value.unitNumber
          : unitNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChaletCreateRequestImplCopyWith<$Res>
    implements $ChaletCreateRequestCopyWith<$Res> {
  factory _$$ChaletCreateRequestImplCopyWith(_$ChaletCreateRequestImpl value,
          $Res Function(_$ChaletCreateRequestImpl) then) =
      __$$ChaletCreateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'number_of_rooms') int numberOfRooms,
      @JsonKey(name: 'price_per_night') double pricePerNight,
      String? notes,
      String location,
      @JsonKey(name: 'unit_number') String unitNumber,
      @JsonKey(name: 'is_available') bool isAvailable});
}

/// @nodoc
class __$$ChaletCreateRequestImplCopyWithImpl<$Res>
    extends _$ChaletCreateRequestCopyWithImpl<$Res, _$ChaletCreateRequestImpl>
    implements _$$ChaletCreateRequestImplCopyWith<$Res> {
  __$$ChaletCreateRequestImplCopyWithImpl(_$ChaletCreateRequestImpl _value,
      $Res Function(_$ChaletCreateRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletCreateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? numberOfRooms = null,
    Object? pricePerNight = null,
    Object? notes = freezed,
    Object? location = null,
    Object? unitNumber = null,
    Object? isAvailable = null,
  }) {
    return _then(_$ChaletCreateRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfRooms: null == numberOfRooms
          ? _value.numberOfRooms
          : numberOfRooms // ignore: cast_nullable_to_non_nullable
              as int,
      pricePerNight: null == pricePerNight
          ? _value.pricePerNight
          : pricePerNight // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      unitNumber: null == unitNumber
          ? _value.unitNumber
          : unitNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChaletCreateRequestImpl implements _ChaletCreateRequest {
  const _$ChaletCreateRequestImpl(
      {required this.name,
      @JsonKey(name: 'number_of_rooms') required this.numberOfRooms,
      @JsonKey(name: 'price_per_night') required this.pricePerNight,
      this.notes,
      required this.location,
      @JsonKey(name: 'unit_number') required this.unitNumber,
      @JsonKey(name: 'is_available') this.isAvailable = true});

  factory _$ChaletCreateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChaletCreateRequestImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'number_of_rooms')
  final int numberOfRooms;
  @override
  @JsonKey(name: 'price_per_night')
  final double pricePerNight;
  @override
  final String? notes;
  @override
  final String location;
  @override
  @JsonKey(name: 'unit_number')
  final String unitNumber;
  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;

  @override
  String toString() {
    return 'ChaletCreateRequest(name: $name, numberOfRooms: $numberOfRooms, pricePerNight: $pricePerNight, notes: $notes, location: $location, unitNumber: $unitNumber, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChaletCreateRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.numberOfRooms, numberOfRooms) ||
                other.numberOfRooms == numberOfRooms) &&
            (identical(other.pricePerNight, pricePerNight) ||
                other.pricePerNight == pricePerNight) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.unitNumber, unitNumber) ||
                other.unitNumber == unitNumber) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, numberOfRooms,
      pricePerNight, notes, location, unitNumber, isAvailable);

  /// Create a copy of ChaletCreateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChaletCreateRequestImplCopyWith<_$ChaletCreateRequestImpl> get copyWith =>
      __$$ChaletCreateRequestImplCopyWithImpl<_$ChaletCreateRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChaletCreateRequestImplToJson(
      this,
    );
  }
}

abstract class _ChaletCreateRequest implements ChaletCreateRequest {
  const factory _ChaletCreateRequest(
          {required final String name,
          @JsonKey(name: 'number_of_rooms') required final int numberOfRooms,
          @JsonKey(name: 'price_per_night') required final double pricePerNight,
          final String? notes,
          required final String location,
          @JsonKey(name: 'unit_number') required final String unitNumber,
          @JsonKey(name: 'is_available') final bool isAvailable}) =
      _$ChaletCreateRequestImpl;

  factory _ChaletCreateRequest.fromJson(Map<String, dynamic> json) =
      _$ChaletCreateRequestImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'number_of_rooms')
  int get numberOfRooms;
  @override
  @JsonKey(name: 'price_per_night')
  double get pricePerNight;
  @override
  String? get notes;
  @override
  String get location;
  @override
  @JsonKey(name: 'unit_number')
  String get unitNumber;
  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;

  /// Create a copy of ChaletCreateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChaletCreateRequestImplCopyWith<_$ChaletCreateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChaletUpdateRequest _$ChaletUpdateRequestFromJson(Map<String, dynamic> json) {
  return _ChaletUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$ChaletUpdateRequest {
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_rooms')
  int? get numberOfRooms => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_per_night')
  double? get pricePerNight => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_number')
  String? get unitNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool? get isAvailable => throw _privateConstructorUsedError;

  /// Serializes this ChaletUpdateRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChaletUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChaletUpdateRequestCopyWith<ChaletUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChaletUpdateRequestCopyWith<$Res> {
  factory $ChaletUpdateRequestCopyWith(
          ChaletUpdateRequest value, $Res Function(ChaletUpdateRequest) then) =
      _$ChaletUpdateRequestCopyWithImpl<$Res, ChaletUpdateRequest>;
  @useResult
  $Res call(
      {String? name,
      @JsonKey(name: 'number_of_rooms') int? numberOfRooms,
      @JsonKey(name: 'price_per_night') double? pricePerNight,
      String? notes,
      String? location,
      @JsonKey(name: 'unit_number') String? unitNumber,
      @JsonKey(name: 'is_available') bool? isAvailable});
}

/// @nodoc
class _$ChaletUpdateRequestCopyWithImpl<$Res, $Val extends ChaletUpdateRequest>
    implements $ChaletUpdateRequestCopyWith<$Res> {
  _$ChaletUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChaletUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? numberOfRooms = freezed,
    Object? pricePerNight = freezed,
    Object? notes = freezed,
    Object? location = freezed,
    Object? unitNumber = freezed,
    Object? isAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfRooms: freezed == numberOfRooms
          ? _value.numberOfRooms
          : numberOfRooms // ignore: cast_nullable_to_non_nullable
              as int?,
      pricePerNight: freezed == pricePerNight
          ? _value.pricePerNight
          : pricePerNight // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      unitNumber: freezed == unitNumber
          ? _value.unitNumber
          : unitNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChaletUpdateRequestImplCopyWith<$Res>
    implements $ChaletUpdateRequestCopyWith<$Res> {
  factory _$$ChaletUpdateRequestImplCopyWith(_$ChaletUpdateRequestImpl value,
          $Res Function(_$ChaletUpdateRequestImpl) then) =
      __$$ChaletUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      @JsonKey(name: 'number_of_rooms') int? numberOfRooms,
      @JsonKey(name: 'price_per_night') double? pricePerNight,
      String? notes,
      String? location,
      @JsonKey(name: 'unit_number') String? unitNumber,
      @JsonKey(name: 'is_available') bool? isAvailable});
}

/// @nodoc
class __$$ChaletUpdateRequestImplCopyWithImpl<$Res>
    extends _$ChaletUpdateRequestCopyWithImpl<$Res, _$ChaletUpdateRequestImpl>
    implements _$$ChaletUpdateRequestImplCopyWith<$Res> {
  __$$ChaletUpdateRequestImplCopyWithImpl(_$ChaletUpdateRequestImpl _value,
      $Res Function(_$ChaletUpdateRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? numberOfRooms = freezed,
    Object? pricePerNight = freezed,
    Object? notes = freezed,
    Object? location = freezed,
    Object? unitNumber = freezed,
    Object? isAvailable = freezed,
  }) {
    return _then(_$ChaletUpdateRequestImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfRooms: freezed == numberOfRooms
          ? _value.numberOfRooms
          : numberOfRooms // ignore: cast_nullable_to_non_nullable
              as int?,
      pricePerNight: freezed == pricePerNight
          ? _value.pricePerNight
          : pricePerNight // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      unitNumber: freezed == unitNumber
          ? _value.unitNumber
          : unitNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChaletUpdateRequestImpl implements _ChaletUpdateRequest {
  const _$ChaletUpdateRequestImpl(
      {this.name,
      @JsonKey(name: 'number_of_rooms') this.numberOfRooms,
      @JsonKey(name: 'price_per_night') this.pricePerNight,
      this.notes,
      this.location,
      @JsonKey(name: 'unit_number') this.unitNumber,
      @JsonKey(name: 'is_available') this.isAvailable});

  factory _$ChaletUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChaletUpdateRequestImplFromJson(json);

  @override
  final String? name;
  @override
  @JsonKey(name: 'number_of_rooms')
  final int? numberOfRooms;
  @override
  @JsonKey(name: 'price_per_night')
  final double? pricePerNight;
  @override
  final String? notes;
  @override
  final String? location;
  @override
  @JsonKey(name: 'unit_number')
  final String? unitNumber;
  @override
  @JsonKey(name: 'is_available')
  final bool? isAvailable;

  @override
  String toString() {
    return 'ChaletUpdateRequest(name: $name, numberOfRooms: $numberOfRooms, pricePerNight: $pricePerNight, notes: $notes, location: $location, unitNumber: $unitNumber, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChaletUpdateRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.numberOfRooms, numberOfRooms) ||
                other.numberOfRooms == numberOfRooms) &&
            (identical(other.pricePerNight, pricePerNight) ||
                other.pricePerNight == pricePerNight) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.unitNumber, unitNumber) ||
                other.unitNumber == unitNumber) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, numberOfRooms,
      pricePerNight, notes, location, unitNumber, isAvailable);

  /// Create a copy of ChaletUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChaletUpdateRequestImplCopyWith<_$ChaletUpdateRequestImpl> get copyWith =>
      __$$ChaletUpdateRequestImplCopyWithImpl<_$ChaletUpdateRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChaletUpdateRequestImplToJson(
      this,
    );
  }
}

abstract class _ChaletUpdateRequest implements ChaletUpdateRequest {
  const factory _ChaletUpdateRequest(
          {final String? name,
          @JsonKey(name: 'number_of_rooms') final int? numberOfRooms,
          @JsonKey(name: 'price_per_night') final double? pricePerNight,
          final String? notes,
          final String? location,
          @JsonKey(name: 'unit_number') final String? unitNumber,
          @JsonKey(name: 'is_available') final bool? isAvailable}) =
      _$ChaletUpdateRequestImpl;

  factory _ChaletUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$ChaletUpdateRequestImpl.fromJson;

  @override
  String? get name;
  @override
  @JsonKey(name: 'number_of_rooms')
  int? get numberOfRooms;
  @override
  @JsonKey(name: 'price_per_night')
  double? get pricePerNight;
  @override
  String? get notes;
  @override
  String? get location;
  @override
  @JsonKey(name: 'unit_number')
  String? get unitNumber;
  @override
  @JsonKey(name: 'is_available')
  bool? get isAvailable;

  /// Create a copy of ChaletUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChaletUpdateRequestImplCopyWith<_$ChaletUpdateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChaletImageUploadResponse _$ChaletImageUploadResponseFromJson(
    Map<String, dynamic> json) {
  return _ChaletImageUploadResponse.fromJson(json);
}

/// @nodoc
mixin _$ChaletImageUploadResponse {
  String get message => throw _privateConstructorUsedError;
  List<ChaletImageModel> get images => throw _privateConstructorUsedError;

  /// Serializes this ChaletImageUploadResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChaletImageUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChaletImageUploadResponseCopyWith<ChaletImageUploadResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChaletImageUploadResponseCopyWith<$Res> {
  factory $ChaletImageUploadResponseCopyWith(ChaletImageUploadResponse value,
          $Res Function(ChaletImageUploadResponse) then) =
      _$ChaletImageUploadResponseCopyWithImpl<$Res, ChaletImageUploadResponse>;
  @useResult
  $Res call({String message, List<ChaletImageModel> images});
}

/// @nodoc
class _$ChaletImageUploadResponseCopyWithImpl<$Res,
        $Val extends ChaletImageUploadResponse>
    implements $ChaletImageUploadResponseCopyWith<$Res> {
  _$ChaletImageUploadResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChaletImageUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ChaletImageModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChaletImageUploadResponseImplCopyWith<$Res>
    implements $ChaletImageUploadResponseCopyWith<$Res> {
  factory _$$ChaletImageUploadResponseImplCopyWith(
          _$ChaletImageUploadResponseImpl value,
          $Res Function(_$ChaletImageUploadResponseImpl) then) =
      __$$ChaletImageUploadResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, List<ChaletImageModel> images});
}

/// @nodoc
class __$$ChaletImageUploadResponseImplCopyWithImpl<$Res>
    extends _$ChaletImageUploadResponseCopyWithImpl<$Res,
        _$ChaletImageUploadResponseImpl>
    implements _$$ChaletImageUploadResponseImplCopyWith<$Res> {
  __$$ChaletImageUploadResponseImplCopyWithImpl(
      _$ChaletImageUploadResponseImpl _value,
      $Res Function(_$ChaletImageUploadResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChaletImageUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? images = null,
  }) {
    return _then(_$ChaletImageUploadResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ChaletImageModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChaletImageUploadResponseImpl implements _ChaletImageUploadResponse {
  const _$ChaletImageUploadResponseImpl(
      {required this.message, required final List<ChaletImageModel> images})
      : _images = images;

  factory _$ChaletImageUploadResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChaletImageUploadResponseImplFromJson(json);

  @override
  final String message;
  final List<ChaletImageModel> _images;
  @override
  List<ChaletImageModel> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'ChaletImageUploadResponse(message: $message, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChaletImageUploadResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_images));

  /// Create a copy of ChaletImageUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChaletImageUploadResponseImplCopyWith<_$ChaletImageUploadResponseImpl>
      get copyWith => __$$ChaletImageUploadResponseImplCopyWithImpl<
          _$ChaletImageUploadResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChaletImageUploadResponseImplToJson(
      this,
    );
  }
}

abstract class _ChaletImageUploadResponse implements ChaletImageUploadResponse {
  const factory _ChaletImageUploadResponse(
          {required final String message,
          required final List<ChaletImageModel> images}) =
      _$ChaletImageUploadResponseImpl;

  factory _ChaletImageUploadResponse.fromJson(Map<String, dynamic> json) =
      _$ChaletImageUploadResponseImpl.fromJson;

  @override
  String get message;
  @override
  List<ChaletImageModel> get images;

  /// Create a copy of ChaletImageUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChaletImageUploadResponseImplCopyWith<_$ChaletImageUploadResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
