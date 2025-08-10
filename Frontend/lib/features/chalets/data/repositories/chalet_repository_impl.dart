import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/chalet_repository.dart';
import '../../domain/entities/chalet.dart';
import '../../domain/entities/public_chalet.dart';
import '../../domain/entities/paginated_chalet_response.dart' as domain;
import '../../domain/entities/chalet_requests.dart' as domain;
import '../services/chalet_api_service.dart' as data;
import '../mappers/chalet_mapper.dart';

class ChaletRepositoryImpl implements ChaletRepository {
  final data.ChaletRepository _dataRepository; // Use the data layer's repository from chalet_api_service.dart

  ChaletRepositoryImpl(this._dataRepository);

  @override
  Future<Either<Failure, domain.PaginatedChaletResponse>> getPublicChalets({
    int page = 1,
    int pageSize = 10,
    String? search,
    domain.ChaletSortBy? sortBy,
  }) async {
    final result = await _dataRepository.getPublicChaletsPaginated(
      page: page,
      pageSize: pageSize,
      search: search,
    );
    
    return result.when(
      success: (data) => Right(ChaletMapper.toPaginatedEntity(data)),
      failure: (error) => Left(ServerFailure(error.message)),
    );
  }

  @override
  Future<Either<Failure, PublicChalet>> getPublicChaletDetails(int chaletId) async {
    final result = await _dataRepository.getPublicChaletDetail(chaletId);
    
    return result.when(
      success: (data) => Right(ChaletMapper.toPublicEntity(data)),
      failure: (error) => Left(ServerFailure(error.message)),
    );
  }

  @override
  Future<Either<Failure, List<PublicChalet>>> searchPublicChalets(String query) async {
    final result = await _dataRepository.getPublicChaletsPaginated(
      search: query,
      pageSize: 100, // Get more results for search
    );
    
    return result.when(
      success: (data) => Right(data.results.map(ChaletMapper.toPublicEntity).toList()),
      failure: (error) => Left(ServerFailure(error.message)),
    );
  }

  @override
  Future<Either<Failure, List<Chalet>>> getOwnerChalets() async {
    final result = await _dataRepository.getChalets();
    
    return result.when(
      success: (data) => Right(data.map(ChaletMapper.toEntity).toList()),
      failure: (error) => Left(ServerFailure(error.message)),
    );
  }

  @override
  Future<Either<Failure, Chalet>> getChaletDetails(int chaletId) async {
    final result = await _dataRepository.getChaletDetail(chaletId);
    
    return result.when(
      success: (data) => Right(ChaletMapper.toEntity(data)),
      failure: (error) => Left(ServerFailure(error.message)),
    );
  }

  @override
  Future<Either<Failure, Chalet>> createChalet(domain.ChaletCreateRequest request) async {
    final modelRequest = ChaletMapper.toCreateRequestModel(request);
    final result = await _dataRepository.createChalet(modelRequest);
    
    return result.when(
      success: (data) => Right(ChaletMapper.toEntity(data)),
      failure: (error) => Left(ServerFailure(error.message)),
    );
  }

  @override
  Future<Either<Failure, Chalet>> updateChalet(
    int chaletId,
    domain.ChaletUpdateRequest request,
  ) async {
    final modelRequest = ChaletMapper.toUpdateRequestModel(request);
    final result = await _dataRepository.updateChalet(chaletId, modelRequest);
    
    return result.when(
      success: (data) => Right(ChaletMapper.toEntity(data)),
      failure: (error) => Left(ServerFailure(error.message)),
    );
  }

  @override
  Future<Either<Failure, void>> deleteChalet(int chaletId) async {
    final result = await _dataRepository.deleteChalet(chaletId);
    
    return result.when(
      success: (_) => const Right(null),
      failure: (error) => Left(ServerFailure(error.message)),
    );
  }

  @override
  Future<Either<Failure, domain.ChaletImageUploadResponse>> uploadChaletImages(
    int chaletId,
    List<File> images,
  ) async {
    final result = await _dataRepository.uploadChaletImages(chaletId, images);
    
    return result.when(
      success: (data) => Right(ChaletMapper.toImageUploadEntity(data)),
      failure: (error) => Left(ServerFailure(error.message)),
    );
  }

  @override
  Future<Either<Failure, void>> deleteChaletImage(
    int chaletId,
    int imageId,
  ) async {
    final result = await _dataRepository.deleteChaletImage(chaletId, imageId);
    
    return result.when(
      success: (_) => const Right(null),
      failure: (error) => Left(ServerFailure(error.message)),
    );
  }

  @override
  Future<Either<Failure, void>> updateChaletImageOrder(
    int chaletId,
    List<int> imageIds,
  ) async {
    // This method might not be available in the current API service
    // For now, return a not implemented failure
    return Left(ServerFailure('Image order update not implemented'));
  }

  @override
  Future<Either<Failure, void>> setMainChaletImage(
    int chaletId,
    int imageId,
  ) async {
    final result = await _dataRepository.updateChaletImage(
      chaletId,
      imageId,
      isMain: true,
    );
    
    return result.when(
      success: (_) => const Right(null),
      failure: (error) => Left(ServerFailure(error.message)),
    );
  }

  @override
  Future<Either<Failure, Chalet>> toggleChaletAvailability(int chaletId) async {
    // This would require getting the current chalet first, then updating its availability
    // Since this is a specific business operation, it might need a dedicated API endpoint
    return Left(ServerFailure('Toggle availability not implemented'));
  }
}
