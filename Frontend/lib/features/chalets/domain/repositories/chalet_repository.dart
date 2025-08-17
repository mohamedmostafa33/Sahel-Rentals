import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/chalet.dart';
import '../entities/public_chalet.dart';
import '../entities/paginated_chalet_response.dart';
import '../entities/chalet_requests.dart';

abstract class ChaletRepository {
  // Public browsing operations (no authentication required)
  Future<Either<Failure, PaginatedChaletResponse>> getPublicChalets({
    int page = 1,
    int pageSize = 10,
    String? search,
    ChaletSortBy? sortBy,
  });

  Future<Either<Failure, PublicChalet>> getPublicChaletDetails(int chaletId);

  Future<Either<Failure, List<PublicChalet>>> searchPublicChalets(String query);

  // Owner operations (authentication required)
  Future<Either<Failure, List<Chalet>>> getOwnerChalets();

  Future<Either<Failure, Chalet>> getChaletDetails(int chaletId);

  Future<Either<Failure, Chalet>> createChalet(ChaletCreateRequest request);

  Future<Either<Failure, Chalet>> updateChalet(
    int chaletId,
    ChaletUpdateRequest request,
  );

  Future<Either<Failure, void>> deleteChalet(int chaletId);

  // Image operations
  Future<Either<Failure, ChaletImageUploadResponse>> uploadChaletImages(
    int chaletId,
    List<File> images,
  );

  Future<Either<Failure, void>> deleteChaletImage(int chaletId, int imageId);

  Future<Either<Failure, void>> updateChaletImageOrder(
    int chaletId,
    List<int> imageIds,
  );

  Future<Either<Failure, void>> setMainChaletImage(int chaletId, int imageId);

  // Availability operations
  Future<Either<Failure, Chalet>> toggleChaletAvailability(int chaletId);
}
