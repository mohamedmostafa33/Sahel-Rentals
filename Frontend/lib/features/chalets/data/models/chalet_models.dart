// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chalet_models.freezed.dart';
part 'chalet_models.g.dart';

@freezed
class ChaletModel with _$ChaletModel {
  const factory ChaletModel({
    required int id,
    required String name,
    @JsonKey(name: 'number_of_rooms') required int numberOfRooms,
    @JsonKey(name: 'price_per_night') required double pricePerNight,
    String? notes,
    required String location,
    @JsonKey(name: 'unit_number') required String unitNumber,
    @JsonKey(name: 'is_available') required bool isAvailable,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'main_image') String? mainImage,
    @JsonKey(name: 'image_count') @Default(0) int imageCount,
    @Default([]) List<ChaletImageModel> images,
  }) = _ChaletModel;

  factory ChaletModel.fromJson(Map<String, dynamic> json) =>
      _$ChaletModelFromJson(json);
}

@freezed
class ChaletImageModel with _$ChaletImageModel {
  const factory ChaletImageModel({
    required int id,
    required String image,
    @JsonKey(name: 'is_main') required bool isMain,
    String? caption,
    required int order,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _ChaletImageModel;

  factory ChaletImageModel.fromJson(Map<String, dynamic> json) =>
      _$ChaletImageModelFromJson(json);
}

@freezed
class ChaletCreateRequest with _$ChaletCreateRequest {
  const factory ChaletCreateRequest({
    required String name,
    @JsonKey(name: 'number_of_rooms') required int numberOfRooms,
    @JsonKey(name: 'price_per_night') required double pricePerNight,
    String? notes,
    required String location,
    @JsonKey(name: 'unit_number') required String unitNumber,
    @JsonKey(name: 'is_available') @Default(true) bool isAvailable,
  }) = _ChaletCreateRequest;

  factory ChaletCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$ChaletCreateRequestFromJson(json);
}

@freezed
class ChaletUpdateRequest with _$ChaletUpdateRequest {
  const factory ChaletUpdateRequest({
    String? name,
    @JsonKey(name: 'number_of_rooms') int? numberOfRooms,
    @JsonKey(name: 'price_per_night') double? pricePerNight,
    String? notes,
    String? location,
    @JsonKey(name: 'unit_number') String? unitNumber,
    @JsonKey(name: 'is_available') bool? isAvailable,
  }) = _ChaletUpdateRequest;

  factory ChaletUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ChaletUpdateRequestFromJson(json);
}

@freezed
class ChaletImageUploadResponse with _$ChaletImageUploadResponse {
  const factory ChaletImageUploadResponse({
    required String message,
    required List<ChaletImageModel> images,
  }) = _ChaletImageUploadResponse;

  factory ChaletImageUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$ChaletImageUploadResponseFromJson(json);
}

// Enums for better type safety
enum ChaletStatus { active, inactive, maintenance }

enum ChaletSortBy { 
  newest, 
  oldest, 
  priceAsc, 
  priceDesc, 
  nameAsc, 
  nameDesc 
}

// Validation extensions
extension ChaletCreateRequestValidation on ChaletCreateRequest {
  List<String> validate() {
    final errors = <String>[];
    
    if (name.trim().isEmpty) {
      errors.add('Chalet name is required');
    }
    
    if (name.trim().length < 3) {
      errors.add('Chalet name must be at least 3 characters');
    }
    
    if (numberOfRooms <= 0) {
      errors.add('Number of rooms must be greater than 0');
    }
    
    if (numberOfRooms > 20) {
      errors.add('Number of rooms cannot exceed 20');
    }
    
    if (pricePerNight <= 0) {
      errors.add('Price per night must be greater than 0');
    }
    
    if (pricePerNight > 10000) {
      errors.add('Price per night seems too high');
    }
    
    if (location.trim().isEmpty) {
      errors.add('Location is required');
    }
    
    if (unitNumber.trim().isEmpty) {
      errors.add('Unit number is required');
    }
    
    return errors;
  }
  
  bool get isValid => validate().isEmpty;
}
