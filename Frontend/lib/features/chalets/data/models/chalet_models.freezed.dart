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

PublicChaletModel _$PublicChaletModelFromJson(Map<String, dynamic> json) {
  return _PublicChaletModel.fromJson(json);
}

/// @nodoc
mixin _$PublicChaletModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_name')
  String get ownerName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_rooms')
  int get numberOfRooms => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_per_night')
  double get pricePerNight => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_number')
  String get unitNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'main_image')
  String? get mainImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_profile_image')
  String? get ownerProfileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_count')
  int get imageCount => throw _privateConstructorUsedError;
  List<ChaletImageModel> get images => throw _privateConstructorUsedError;
  OwnerPhoneModel? get phone => throw _privateConstructorUsedError;

  /// Serializes this PublicChaletModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PublicChaletModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PublicChaletModelCopyWith<PublicChaletModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicChaletModelCopyWith<$Res> {
  factory $PublicChaletModelCopyWith(
          PublicChaletModel value, $Res Function(PublicChaletModel) then) =
      _$PublicChaletModelCopyWithImpl<$Res, PublicChaletModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'owner_name') String ownerName,
      String name,
      @JsonKey(name: 'number_of_rooms') int numberOfRooms,
      @JsonKey(name: 'price_per_night') double pricePerNight,
      String? notes,
      String location,
      @JsonKey(name: 'unit_number') String unitNumber,
      @JsonKey(name: 'main_image') String? mainImage,
      @JsonKey(name: 'owner_profile_image') String? ownerProfileImage,
      @JsonKey(name: 'image_count') int imageCount,
      List<ChaletImageModel> images,
      OwnerPhoneModel? phone});
}

/// @nodoc
class _$PublicChaletModelCopyWithImpl<$Res, $Val extends PublicChaletModel>
    implements $PublicChaletModelCopyWith<$Res> {
  _$PublicChaletModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PublicChaletModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerName = null,
    Object? name = null,
    Object? numberOfRooms = null,
    Object? pricePerNight = null,
    Object? notes = freezed,
    Object? location = null,
    Object? unitNumber = null,
    Object? mainImage = freezed,
    Object? ownerProfileImage = freezed,
    Object? imageCount = null,
    Object? images = null,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
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
      mainImage: freezed == mainImage
          ? _value.mainImage
          : mainImage // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerProfileImage: freezed == ownerProfileImage
          ? _value.ownerProfileImage
          : ownerProfileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      imageCount: null == imageCount
          ? _value.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ChaletImageModel>,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as OwnerPhoneModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublicChaletModelImplCopyWith<$Res>
    implements $PublicChaletModelCopyWith<$Res> {
  factory _$$PublicChaletModelImplCopyWith(_$PublicChaletModelImpl value,
          $Res Function(_$PublicChaletModelImpl) then) =
      __$$PublicChaletModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'owner_name') String ownerName,
      String name,
      @JsonKey(name: 'number_of_rooms') int numberOfRooms,
      @JsonKey(name: 'price_per_night') double pricePerNight,
      String? notes,
      String location,
      @JsonKey(name: 'unit_number') String unitNumber,
      @JsonKey(name: 'main_image') String? mainImage,
      @JsonKey(name: 'owner_profile_image') String? ownerProfileImage,
      @JsonKey(name: 'image_count') int imageCount,
      List<ChaletImageModel> images,
      OwnerPhoneModel? phone});
}

/// @nodoc
class __$$PublicChaletModelImplCopyWithImpl<$Res>
    extends _$PublicChaletModelCopyWithImpl<$Res, _$PublicChaletModelImpl>
    implements _$$PublicChaletModelImplCopyWith<$Res> {
  __$$PublicChaletModelImplCopyWithImpl(_$PublicChaletModelImpl _value,
      $Res Function(_$PublicChaletModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PublicChaletModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerName = null,
    Object? name = null,
    Object? numberOfRooms = null,
    Object? pricePerNight = null,
    Object? notes = freezed,
    Object? location = null,
    Object? unitNumber = null,
    Object? mainImage = freezed,
    Object? ownerProfileImage = freezed,
    Object? imageCount = null,
    Object? images = null,
    Object? phone = freezed,
  }) {
    return _then(_$PublicChaletModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
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
      mainImage: freezed == mainImage
          ? _value.mainImage
          : mainImage // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerProfileImage: freezed == ownerProfileImage
          ? _value.ownerProfileImage
          : ownerProfileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      imageCount: null == imageCount
          ? _value.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ChaletImageModel>,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as OwnerPhoneModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicChaletModelImpl implements _PublicChaletModel {
  const _$PublicChaletModelImpl(
      {required this.id,
      @JsonKey(name: 'owner_name') required this.ownerName,
      required this.name,
      @JsonKey(name: 'number_of_rooms') required this.numberOfRooms,
      @JsonKey(name: 'price_per_night') required this.pricePerNight,
      this.notes,
      required this.location,
      @JsonKey(name: 'unit_number') required this.unitNumber,
      @JsonKey(name: 'main_image') this.mainImage,
      @JsonKey(name: 'owner_profile_image') this.ownerProfileImage,
      @JsonKey(name: 'image_count') this.imageCount = 0,
      final List<ChaletImageModel> images = const [],
      this.phone})
      : _images = images;

  factory _$PublicChaletModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicChaletModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'owner_name')
  final String ownerName;
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
  @JsonKey(name: 'main_image')
  final String? mainImage;
  @override
  @JsonKey(name: 'owner_profile_image')
  final String? ownerProfileImage;
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
  final OwnerPhoneModel? phone;

  @override
  String toString() {
    return 'PublicChaletModel(id: $id, ownerName: $ownerName, name: $name, numberOfRooms: $numberOfRooms, pricePerNight: $pricePerNight, notes: $notes, location: $location, unitNumber: $unitNumber, mainImage: $mainImage, ownerProfileImage: $ownerProfileImage, imageCount: $imageCount, images: $images, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicChaletModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
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
            (identical(other.mainImage, mainImage) ||
                other.mainImage == mainImage) &&
            (identical(other.ownerProfileImage, ownerProfileImage) ||
                other.ownerProfileImage == ownerProfileImage) &&
            (identical(other.imageCount, imageCount) ||
                other.imageCount == imageCount) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerName,
      name,
      numberOfRooms,
      pricePerNight,
      notes,
      location,
      unitNumber,
      mainImage,
      ownerProfileImage,
      imageCount,
      const DeepCollectionEquality().hash(_images),
      phone);

  /// Create a copy of PublicChaletModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicChaletModelImplCopyWith<_$PublicChaletModelImpl> get copyWith =>
      __$$PublicChaletModelImplCopyWithImpl<_$PublicChaletModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicChaletModelImplToJson(
      this,
    );
  }
}

abstract class _PublicChaletModel implements PublicChaletModel {
  const factory _PublicChaletModel(
      {required final int id,
      @JsonKey(name: 'owner_name') required final String ownerName,
      required final String name,
      @JsonKey(name: 'number_of_rooms') required final int numberOfRooms,
      @JsonKey(name: 'price_per_night') required final double pricePerNight,
      final String? notes,
      required final String location,
      @JsonKey(name: 'unit_number') required final String unitNumber,
      @JsonKey(name: 'main_image') final String? mainImage,
      @JsonKey(name: 'owner_profile_image') final String? ownerProfileImage,
      @JsonKey(name: 'image_count') final int imageCount,
      final List<ChaletImageModel> images,
      final OwnerPhoneModel? phone}) = _$PublicChaletModelImpl;

  factory _PublicChaletModel.fromJson(Map<String, dynamic> json) =
      _$PublicChaletModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'owner_name')
  String get ownerName;
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
  @JsonKey(name: 'main_image')
  String? get mainImage;
  @override
  @JsonKey(name: 'owner_profile_image')
  String? get ownerProfileImage;
  @override
  @JsonKey(name: 'image_count')
  int get imageCount;
  @override
  List<ChaletImageModel> get images;
  @override
  OwnerPhoneModel? get phone;

  /// Create a copy of PublicChaletModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublicChaletModelImplCopyWith<_$PublicChaletModelImpl> get copyWith =>
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

PaginatedChaletResponse _$PaginatedChaletResponseFromJson(
    Map<String, dynamic> json) {
  return _PaginatedChaletResponse.fromJson(json);
}

/// @nodoc
mixin _$PaginatedChaletResponse {
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'next')
  String? get nextUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'previous')
  String? get previousUrl => throw _privateConstructorUsedError;
  List<PublicChaletModel> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedChaletResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedChaletResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedChaletResponseCopyWith<PaginatedChaletResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedChaletResponseCopyWith<$Res> {
  factory $PaginatedChaletResponseCopyWith(PaginatedChaletResponse value,
          $Res Function(PaginatedChaletResponse) then) =
      _$PaginatedChaletResponseCopyWithImpl<$Res, PaginatedChaletResponse>;
  @useResult
  $Res call(
      {int count,
      @JsonKey(name: 'next') String? nextUrl,
      @JsonKey(name: 'previous') String? previousUrl,
      List<PublicChaletModel> results});
}

/// @nodoc
class _$PaginatedChaletResponseCopyWithImpl<$Res,
        $Val extends PaginatedChaletResponse>
    implements $PaginatedChaletResponseCopyWith<$Res> {
  _$PaginatedChaletResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedChaletResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? nextUrl = freezed,
    Object? previousUrl = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      nextUrl: freezed == nextUrl
          ? _value.nextUrl
          : nextUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      previousUrl: freezed == previousUrl
          ? _value.previousUrl
          : previousUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PublicChaletModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedChaletResponseImplCopyWith<$Res>
    implements $PaginatedChaletResponseCopyWith<$Res> {
  factory _$$PaginatedChaletResponseImplCopyWith(
          _$PaginatedChaletResponseImpl value,
          $Res Function(_$PaginatedChaletResponseImpl) then) =
      __$$PaginatedChaletResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      @JsonKey(name: 'next') String? nextUrl,
      @JsonKey(name: 'previous') String? previousUrl,
      List<PublicChaletModel> results});
}

/// @nodoc
class __$$PaginatedChaletResponseImplCopyWithImpl<$Res>
    extends _$PaginatedChaletResponseCopyWithImpl<$Res,
        _$PaginatedChaletResponseImpl>
    implements _$$PaginatedChaletResponseImplCopyWith<$Res> {
  __$$PaginatedChaletResponseImplCopyWithImpl(
      _$PaginatedChaletResponseImpl _value,
      $Res Function(_$PaginatedChaletResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedChaletResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? nextUrl = freezed,
    Object? previousUrl = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedChaletResponseImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      nextUrl: freezed == nextUrl
          ? _value.nextUrl
          : nextUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      previousUrl: freezed == previousUrl
          ? _value.previousUrl
          : previousUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PublicChaletModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedChaletResponseImpl implements _PaginatedChaletResponse {
  const _$PaginatedChaletResponseImpl(
      {required this.count,
      @JsonKey(name: 'next') this.nextUrl,
      @JsonKey(name: 'previous') this.previousUrl,
      required final List<PublicChaletModel> results})
      : _results = results;

  factory _$PaginatedChaletResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedChaletResponseImplFromJson(json);

  @override
  final int count;
  @override
  @JsonKey(name: 'next')
  final String? nextUrl;
  @override
  @JsonKey(name: 'previous')
  final String? previousUrl;
  final List<PublicChaletModel> _results;
  @override
  List<PublicChaletModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedChaletResponse(count: $count, nextUrl: $nextUrl, previousUrl: $previousUrl, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedChaletResponseImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.nextUrl, nextUrl) || other.nextUrl == nextUrl) &&
            (identical(other.previousUrl, previousUrl) ||
                other.previousUrl == previousUrl) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, nextUrl, previousUrl,
      const DeepCollectionEquality().hash(_results));

  /// Create a copy of PaginatedChaletResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedChaletResponseImplCopyWith<_$PaginatedChaletResponseImpl>
      get copyWith => __$$PaginatedChaletResponseImplCopyWithImpl<
          _$PaginatedChaletResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedChaletResponseImplToJson(
      this,
    );
  }
}

abstract class _PaginatedChaletResponse implements PaginatedChaletResponse {
  const factory _PaginatedChaletResponse(
          {required final int count,
          @JsonKey(name: 'next') final String? nextUrl,
          @JsonKey(name: 'previous') final String? previousUrl,
          required final List<PublicChaletModel> results}) =
      _$PaginatedChaletResponseImpl;

  factory _PaginatedChaletResponse.fromJson(Map<String, dynamic> json) =
      _$PaginatedChaletResponseImpl.fromJson;

  @override
  int get count;
  @override
  @JsonKey(name: 'next')
  String? get nextUrl;
  @override
  @JsonKey(name: 'previous')
  String? get previousUrl;
  @override
  List<PublicChaletModel> get results;

  /// Create a copy of PaginatedChaletResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedChaletResponseImplCopyWith<_$PaginatedChaletResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaginationInfo {
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalItems => throw _privateConstructorUsedError;
  int get itemsPerPage => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  bool get hasPrevious => throw _privateConstructorUsedError;

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationInfoCopyWith<PaginationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationInfoCopyWith<$Res> {
  factory $PaginationInfoCopyWith(
          PaginationInfo value, $Res Function(PaginationInfo) then) =
      _$PaginationInfoCopyWithImpl<$Res, PaginationInfo>;
  @useResult
  $Res call(
      {int currentPage,
      int totalPages,
      int totalItems,
      int itemsPerPage,
      bool hasNext,
      bool hasPrevious});
}

/// @nodoc
class _$PaginationInfoCopyWithImpl<$Res, $Val extends PaginationInfo>
    implements $PaginationInfoCopyWith<$Res> {
  _$PaginationInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalItems = null,
    Object? itemsPerPage = null,
    Object? hasNext = null,
    Object? hasPrevious = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPrevious: null == hasPrevious
          ? _value.hasPrevious
          : hasPrevious // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationInfoImplCopyWith<$Res>
    implements $PaginationInfoCopyWith<$Res> {
  factory _$$PaginationInfoImplCopyWith(_$PaginationInfoImpl value,
          $Res Function(_$PaginationInfoImpl) then) =
      __$$PaginationInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentPage,
      int totalPages,
      int totalItems,
      int itemsPerPage,
      bool hasNext,
      bool hasPrevious});
}

/// @nodoc
class __$$PaginationInfoImplCopyWithImpl<$Res>
    extends _$PaginationInfoCopyWithImpl<$Res, _$PaginationInfoImpl>
    implements _$$PaginationInfoImplCopyWith<$Res> {
  __$$PaginationInfoImplCopyWithImpl(
      _$PaginationInfoImpl _value, $Res Function(_$PaginationInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalItems = null,
    Object? itemsPerPage = null,
    Object? hasNext = null,
    Object? hasPrevious = null,
  }) {
    return _then(_$PaginationInfoImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPrevious: null == hasPrevious
          ? _value.hasPrevious
          : hasPrevious // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PaginationInfoImpl implements _PaginationInfo {
  const _$PaginationInfoImpl(
      {required this.currentPage,
      required this.totalPages,
      required this.totalItems,
      required this.itemsPerPage,
      required this.hasNext,
      required this.hasPrevious});

  @override
  final int currentPage;
  @override
  final int totalPages;
  @override
  final int totalItems;
  @override
  final int itemsPerPage;
  @override
  final bool hasNext;
  @override
  final bool hasPrevious;

  @override
  String toString() {
    return 'PaginationInfo(currentPage: $currentPage, totalPages: $totalPages, totalItems: $totalItems, itemsPerPage: $itemsPerPage, hasNext: $hasNext, hasPrevious: $hasPrevious)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationInfoImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.hasPrevious, hasPrevious) ||
                other.hasPrevious == hasPrevious));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPage, totalPages,
      totalItems, itemsPerPage, hasNext, hasPrevious);

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationInfoImplCopyWith<_$PaginationInfoImpl> get copyWith =>
      __$$PaginationInfoImplCopyWithImpl<_$PaginationInfoImpl>(
          this, _$identity);
}

abstract class _PaginationInfo implements PaginationInfo {
  const factory _PaginationInfo(
      {required final int currentPage,
      required final int totalPages,
      required final int totalItems,
      required final int itemsPerPage,
      required final bool hasNext,
      required final bool hasPrevious}) = _$PaginationInfoImpl;

  @override
  int get currentPage;
  @override
  int get totalPages;
  @override
  int get totalItems;
  @override
  int get itemsPerPage;
  @override
  bool get hasNext;
  @override
  bool get hasPrevious;

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationInfoImplCopyWith<_$PaginationInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
