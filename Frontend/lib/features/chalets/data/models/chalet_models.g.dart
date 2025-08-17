// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chalet_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChaletModelImpl _$$ChaletModelImplFromJson(Map<String, dynamic> json) =>
    _$ChaletModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      numberOfRooms: (json['number_of_rooms'] as num).toInt(),
      pricePerNight: (json['price_per_night'] as num).toDouble(),
      notes: json['notes'] as String?,
      location: json['location'] as String,
      unitNumber: json['unit_number'] as String,
      isAvailable: json['is_available'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      mainImage: json['main_image'] as String?,
      imageCount: (json['image_count'] as num?)?.toInt() ?? 0,
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => ChaletImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ChaletModelImplToJson(_$ChaletModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number_of_rooms': instance.numberOfRooms,
      'price_per_night': instance.pricePerNight,
      'notes': instance.notes,
      'location': instance.location,
      'unit_number': instance.unitNumber,
      'is_available': instance.isAvailable,
      'created_at': instance.createdAt.toIso8601String(),
      'main_image': instance.mainImage,
      'image_count': instance.imageCount,
      'images': instance.images,
    };

_$PublicChaletModelImpl _$$PublicChaletModelImplFromJson(
  Map<String, dynamic> json,
) => _$PublicChaletModelImpl(
  id: (json['id'] as num).toInt(),
  ownerName: json['owner_name'] as String,
  name: json['name'] as String,
  numberOfRooms: (json['number_of_rooms'] as num).toInt(),
  pricePerNight: (json['price_per_night'] as num).toDouble(),
  notes: json['notes'] as String?,
  location: json['location'] as String,
  unitNumber: json['unit_number'] as String,
  mainImage: json['main_image'] as String?,
  imageCount: (json['image_count'] as num?)?.toInt() ?? 0,
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => ChaletImageModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$PublicChaletModelImplToJson(
  _$PublicChaletModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'owner_name': instance.ownerName,
  'name': instance.name,
  'number_of_rooms': instance.numberOfRooms,
  'price_per_night': instance.pricePerNight,
  'notes': instance.notes,
  'location': instance.location,
  'unit_number': instance.unitNumber,
  'main_image': instance.mainImage,
  'image_count': instance.imageCount,
  'images': instance.images,
};

_$ChaletImageModelImpl _$$ChaletImageModelImplFromJson(
  Map<String, dynamic> json,
) => _$ChaletImageModelImpl(
  id: (json['id'] as num).toInt(),
  image: json['image'] as String,
  isMain: json['is_main'] as bool,
  caption: json['caption'] as String?,
  order: (json['order'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$$ChaletImageModelImplToJson(
  _$ChaletImageModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'image': instance.image,
  'is_main': instance.isMain,
  'caption': instance.caption,
  'order': instance.order,
  'created_at': instance.createdAt.toIso8601String(),
};

_$ChaletCreateRequestImpl _$$ChaletCreateRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ChaletCreateRequestImpl(
  name: json['name'] as String,
  numberOfRooms: (json['number_of_rooms'] as num).toInt(),
  pricePerNight: (json['price_per_night'] as num).toDouble(),
  notes: json['notes'] as String?,
  location: json['location'] as String,
  unitNumber: json['unit_number'] as String,
  isAvailable: json['is_available'] as bool? ?? true,
);

Map<String, dynamic> _$$ChaletCreateRequestImplToJson(
  _$ChaletCreateRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'number_of_rooms': instance.numberOfRooms,
  'price_per_night': instance.pricePerNight,
  'notes': instance.notes,
  'location': instance.location,
  'unit_number': instance.unitNumber,
  'is_available': instance.isAvailable,
};

_$ChaletUpdateRequestImpl _$$ChaletUpdateRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ChaletUpdateRequestImpl(
  name: json['name'] as String?,
  numberOfRooms: (json['number_of_rooms'] as num?)?.toInt(),
  pricePerNight: (json['price_per_night'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  location: json['location'] as String?,
  unitNumber: json['unit_number'] as String?,
  isAvailable: json['is_available'] as bool?,
);

Map<String, dynamic> _$$ChaletUpdateRequestImplToJson(
  _$ChaletUpdateRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'number_of_rooms': instance.numberOfRooms,
  'price_per_night': instance.pricePerNight,
  'notes': instance.notes,
  'location': instance.location,
  'unit_number': instance.unitNumber,
  'is_available': instance.isAvailable,
};

_$ChaletImageUploadResponseImpl _$$ChaletImageUploadResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ChaletImageUploadResponseImpl(
  message: json['message'] as String,
  images:
      (json['images'] as List<dynamic>)
          .map((e) => ChaletImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$ChaletImageUploadResponseImplToJson(
  _$ChaletImageUploadResponseImpl instance,
) => <String, dynamic>{'message': instance.message, 'images': instance.images};

_$PaginatedChaletResponseImpl _$$PaginatedChaletResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PaginatedChaletResponseImpl(
  count: (json['count'] as num).toInt(),
  nextUrl: json['next'] as String?,
  previousUrl: json['previous'] as String?,
  results:
      (json['results'] as List<dynamic>)
          .map((e) => PublicChaletModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$PaginatedChaletResponseImplToJson(
  _$PaginatedChaletResponseImpl instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.nextUrl,
  'previous': instance.previousUrl,
  'results': instance.results,
};
