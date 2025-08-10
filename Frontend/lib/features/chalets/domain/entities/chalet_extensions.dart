import 'chalet.dart';
import 'public_chalet.dart';

// Extensions for Chalet entity
extension ChaletExtensions on Chalet {
  /// Converts Chalet to display format
  String get displayPrice => '${pricePerNight.toStringAsFixed(0)} EGP';
  String get displayRooms => '$numberOfRooms ${numberOfRooms == 1 ? 'room' : 'rooms'}';
  String get displayUnit => 'Unit $unitNumber';
  
  /// Check if chalet has images
  bool get hasImages => images.isNotEmpty;
  
  /// Get the main image URL or first image if no main image is set
  String? get displayImage {
    if (mainImage != null) return mainImage;
    final mainImages = images.where((img) => img.isMain);
    if (mainImages.isNotEmpty) return mainImages.first.image;
    return hasImages ? images.first.image : null;
  }
  
  /// Check if chalet is available for booking
  bool get isBookable => isAvailable && hasImages;
  
  /// Get availability status text
  String get availabilityStatus => isAvailable ? 'Available' : 'Not Available';
}

// Extensions for PublicChalet entity
extension PublicChaletExtensions on PublicChalet {
  /// Converts PublicChalet to display format
  String get displayPrice => '${pricePerNight.toStringAsFixed(0)} EGP';
  String get displayRooms => '$numberOfRooms ${numberOfRooms == 1 ? 'room' : 'rooms'}';
  String get displayUnit => 'Unit $unitNumber';
  
  /// Check if chalet has images
  bool get hasImages => images.isNotEmpty;
  
  /// Get the main image URL or first image if no main image is set
  String? get displayImage {
    if (mainImage != null) return mainImage;
    final mainImages = images.where((img) => img.isMain);
    if (mainImages.isNotEmpty) return mainImages.first.image;
    return hasImages ? images.first.image : null;
  }
  
  /// Get short description for card display
  String get shortDescription {
    final description = notes ?? '';
    return description.length > 100 ? '${description.substring(0, 100)}...' : description;
  }
  
  /// Format location for display
  String get displayLocation => location.isNotEmpty ? location : 'Location not specified';
}
