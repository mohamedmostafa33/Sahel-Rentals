import '../models/chalet_models.dart';
import '../../domain/entities/chalet.dart';
import '../../domain/entities/public_chalet.dart';
import '../../domain/entities/chalet_image.dart';
import '../../domain/entities/paginated_chalet_response.dart' as domain;
import '../../domain/entities/chalet_requests.dart' as domain;

class ChaletMapper {
  // Chalet mapping
  static Chalet toEntity(ChaletModel model) {
    return Chalet(
      id: model.id,
      name: model.name,
      numberOfRooms: model.numberOfRooms,
      pricePerNight: model.pricePerNight,
      notes: model.notes,
      location: model.location,
      unitNumber: model.unitNumber,
      isAvailable: model.isAvailable,
      createdAt: model.createdAt,
      mainImage: model.mainImage,
      imageCount: model.imageCount,
      images:
          (model.images as List<ChaletImageModel>)
              .map(ChaletImageMapper.toEntity)
              .toList(),
    );
  }

  static ChaletModel toModel(Chalet entity) {
    return ChaletModel(
      id: entity.id,
      name: entity.name,
      numberOfRooms: entity.numberOfRooms,
      pricePerNight: entity.pricePerNight,
      notes: entity.notes,
      location: entity.location,
      unitNumber: entity.unitNumber,
      isAvailable: entity.isAvailable,
      createdAt: entity.createdAt,
      mainImage: entity.mainImage,
      imageCount: entity.imageCount,
      images: entity.images.map(ChaletImageMapper.toModel).toList(),
    );
  }

  // PublicChalet mapping
  static PublicChalet toPublicEntity(PublicChaletModel model) {
    return PublicChalet(
      id: model.id,
      ownerName: model.ownerName,
      name: model.name,
      numberOfRooms: model.numberOfRooms,
      pricePerNight: model.pricePerNight,
      notes: model.notes,
      location: model.location,
      unitNumber: model.unitNumber,
      mainImage: model.mainImage,
      imageCount: model.imageCount,
      images:
          (model.images as List<ChaletImageModel>)
              .map(ChaletImageMapper.toEntity)
              .toList(),
    );
  }

  static PublicChaletModel toPublicModel(PublicChalet entity) {
    return PublicChaletModel(
      id: entity.id,
      ownerName: entity.ownerName,
      name: entity.name,
      numberOfRooms: entity.numberOfRooms,
      pricePerNight: entity.pricePerNight,
      notes: entity.notes,
      location: entity.location,
      unitNumber: entity.unitNumber,
      mainImage: entity.mainImage,
      imageCount: entity.imageCount,
      images: entity.images.map(ChaletImageMapper.toModel).toList(),
    );
  }

  // PaginatedChaletResponse mapping
  static domain.PaginatedChaletResponse toPaginatedEntity(
    PaginatedChaletResponse dataModel,
  ) {
    return domain.PaginatedChaletResponse(
      count: dataModel.count,
      nextUrl: dataModel.nextUrl,
      previousUrl: dataModel.previousUrl,
      results: dataModel.results.map(toPublicEntity).toList(),
    );
  }

  // Request mapping
  static ChaletCreateRequest toCreateRequestModel(
    domain.ChaletCreateRequest entity,
  ) {
    return ChaletCreateRequest(
      name: entity.name,
      numberOfRooms: entity.numberOfRooms,
      pricePerNight: entity.pricePerNight,
      notes: entity.notes,
      location: entity.location,
      unitNumber: entity.unitNumber,
      isAvailable: entity.isAvailable,
    );
  }

  static ChaletUpdateRequest toUpdateRequestModel(
    domain.ChaletUpdateRequest entity,
  ) {
    return ChaletUpdateRequest(
      name: entity.name,
      numberOfRooms: entity.numberOfRooms,
      pricePerNight: entity.pricePerNight,
      notes: entity.notes,
      location: entity.location,
      unitNumber: entity.unitNumber,
      isAvailable: entity.isAvailable,
    );
  }

  // Image upload response mapping
  static domain.ChaletImageUploadResponse toImageUploadEntity(
    ChaletImageUploadResponse model,
  ) {
    return domain.ChaletImageUploadResponse(
      message: model.message,
      images: model.images.map(ChaletImageMapper.toEntity).toList(),
    );
  }
}

class ChaletImageMapper {
  static ChaletImage toEntity(ChaletImageModel model) {
    return ChaletImage(
      id: model.id,
      image: model.image,
      isMain: model.isMain,
      caption: model.caption,
      order: model.order,
      createdAt: model.createdAt,
    );
  }

  static ChaletImageModel toModel(ChaletImage entity) {
    return ChaletImageModel(
      id: entity.id,
      image: entity.image,
      isMain: entity.isMain,
      caption: entity.caption,
      order: entity.order,
      createdAt: entity.createdAt,
    );
  }
}
