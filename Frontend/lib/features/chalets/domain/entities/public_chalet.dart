import 'package:equatable/equatable.dart';
import 'chalet_image.dart';

class PublicChalet extends Equatable {
  final int id;
  final String ownerName;
  final String name;
  final int numberOfRooms;
  final double pricePerNight;
  final String? notes;
  final String location;
  final String unitNumber;
  final String? mainImage;
  final int imageCount;
  final List<ChaletImage> images;

  const PublicChalet({
    required this.id,
    required this.ownerName,
    required this.name,
    required this.numberOfRooms,
    required this.pricePerNight,
    this.notes,
    required this.location,
    required this.unitNumber,
    this.mainImage,
    required this.imageCount,
    required this.images,
  });

  @override
  List<Object?> get props => [
    id,
    ownerName,
    name,
    numberOfRooms,
    pricePerNight,
    notes,
    location,
    unitNumber,
    mainImage,
    imageCount,
    images,
  ];

  PublicChalet copyWith({
    int? id,
    String? ownerName,
    String? name,
    int? numberOfRooms,
    double? pricePerNight,
    String? notes,
    String? location,
    String? unitNumber,
    String? mainImage,
    int? imageCount,
    List<ChaletImage>? images,
  }) {
    return PublicChalet(
      id: id ?? this.id,
      ownerName: ownerName ?? this.ownerName,
      name: name ?? this.name,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      pricePerNight: pricePerNight ?? this.pricePerNight,
      notes: notes ?? this.notes,
      location: location ?? this.location,
      unitNumber: unitNumber ?? this.unitNumber,
      mainImage: mainImage ?? this.mainImage,
      imageCount: imageCount ?? this.imageCount,
      images: images ?? this.images,
    );
  }
}
