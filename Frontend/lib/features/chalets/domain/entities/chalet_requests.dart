import 'package:equatable/equatable.dart';
import 'chalet_image.dart';

class ChaletCreateRequest extends Equatable {
  final String name;
  final int numberOfRooms;
  final double pricePerNight;
  final String? notes;
  final String location;
  final String unitNumber;
  final bool isAvailable;

  const ChaletCreateRequest({
    required this.name,
    required this.numberOfRooms,
    required this.pricePerNight,
    this.notes,
    required this.location,
    required this.unitNumber,
    this.isAvailable = true,
  });

  @override
  List<Object?> get props => [
    name,
    numberOfRooms,
    pricePerNight,
    notes,
    location,
    unitNumber,
    isAvailable,
  ];

  ChaletCreateRequest copyWith({
    String? name,
    int? numberOfRooms,
    double? pricePerNight,
    String? notes,
    String? location,
    String? unitNumber,
    bool? isAvailable,
  }) {
    return ChaletCreateRequest(
      name: name ?? this.name,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      pricePerNight: pricePerNight ?? this.pricePerNight,
      notes: notes ?? this.notes,
      location: location ?? this.location,
      unitNumber: unitNumber ?? this.unitNumber,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  // Validation logic
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

class ChaletUpdateRequest extends Equatable {
  final String? name;
  final int? numberOfRooms;
  final double? pricePerNight;
  final String? notes;
  final String? location;
  final String? unitNumber;
  final bool? isAvailable;

  const ChaletUpdateRequest({
    this.name,
    this.numberOfRooms,
    this.pricePerNight,
    this.notes,
    this.location,
    this.unitNumber,
    this.isAvailable,
  });

  @override
  List<Object?> get props => [
    name,
    numberOfRooms,
    pricePerNight,
    notes,
    location,
    unitNumber,
    isAvailable,
  ];

  ChaletUpdateRequest copyWith({
    String? name,
    int? numberOfRooms,
    double? pricePerNight,
    String? notes,
    String? location,
    String? unitNumber,
    bool? isAvailable,
  }) {
    return ChaletUpdateRequest(
      name: name ?? this.name,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      pricePerNight: pricePerNight ?? this.pricePerNight,
      notes: notes ?? this.notes,
      location: location ?? this.location,
      unitNumber: unitNumber ?? this.unitNumber,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}

class ChaletImageUploadResponse extends Equatable {
  final String message;
  final List<ChaletImage> images;

  const ChaletImageUploadResponse({
    required this.message,
    required this.images,
  });

  @override
  List<Object?> get props => [message, images];
}

// Enums for better type safety
enum ChaletStatus { active, inactive, maintenance }

enum ChaletSortBy { newest, oldest, priceAsc, priceDesc, nameAsc, nameDesc }
