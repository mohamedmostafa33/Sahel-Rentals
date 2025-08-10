import 'package:equatable/equatable.dart';
import 'chalet_image.dart';

class Chalet extends Equatable {
  final int id;
  final String name;
  final int numberOfRooms;
  final double pricePerNight;
  final String? notes;
  final String location;
  final String unitNumber;
  final bool isAvailable;
  final DateTime createdAt;
  final String? mainImage;
  final int imageCount;
  final List<ChaletImage> images;

  const Chalet({
    required this.id,
    required this.name,
    required this.numberOfRooms,
    required this.pricePerNight,
    this.notes,
    required this.location,
    required this.unitNumber,
    required this.isAvailable,
    required this.createdAt,
    this.mainImage,
    required this.imageCount,
    required this.images,
  });

  @override
  List<Object?> get props => [
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
    images,
  ];

  Chalet copyWith({
    int? id,
    String? name,
    int? numberOfRooms,
    double? pricePerNight,
    String? notes,
    String? location,
    String? unitNumber,
    bool? isAvailable,
    DateTime? createdAt,
    String? mainImage,
    int? imageCount,
    List<ChaletImage>? images,
  }) {
    return Chalet(
      id: id ?? this.id,
      name: name ?? this.name,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      pricePerNight: pricePerNight ?? this.pricePerNight,
      notes: notes ?? this.notes,
      location: location ?? this.location,
      unitNumber: unitNumber ?? this.unitNumber,
      isAvailable: isAvailable ?? this.isAvailable,
      createdAt: createdAt ?? this.createdAt,
      mainImage: mainImage ?? this.mainImage,
      imageCount: imageCount ?? this.imageCount,
      images: images ?? this.images,
    );
  }
}
