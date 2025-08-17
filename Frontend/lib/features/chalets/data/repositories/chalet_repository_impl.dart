import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_error_handler.dart';
import '../../domain/repositories/chalet_repository.dart';
import '../../domain/entities/chalet.dart';
import '../../domain/entities/public_chalet.dart';
import '../../domain/entities/paginated_chalet_response.dart' as domain;
import '../../domain/entities/chalet_requests.dart' as domain;
import '../datasources/chalet_remote_data_source.dart';
import '../mappers/chalet_mapper.dart';

class ChaletRepositoryImpl implements ChaletRepository {
  final ChaletRemoteDataSource _remoteDataSource;

  ChaletRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, domain.PaginatedChaletResponse>> getPublicChalets({
    int page = 1,
    int pageSize = 10,
    String? search,
    domain.ChaletSortBy? sortBy,
  }) async {
    try {
      final response = await _remoteDataSource.getPublicChaletsPaginated(
        page: page,
        pageSize: pageSize,
        search: search?.isNotEmpty == true ? search : null,
      );
      return Right(ChaletMapper.toPaginatedEntity(response));
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.handle(error).message));
    }
  }

  @override
  Future<Either<Failure, PublicChalet>> getPublicChaletDetails(
    int chaletId,
  ) async {
    try {
      final chalet = await _remoteDataSource.getPublicChaletDetail(chaletId);
      return Right(ChaletMapper.toPublicEntity(chalet));
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.handle(error).message));
    }
  }

  @override
  Future<Either<Failure, List<PublicChalet>>> searchPublicChalets(
    String query,
  ) async {
    try {
      final response = await _remoteDataSource.getPublicChaletsPaginated(
        search: query,
        pageSize: 100,
      );
      return Right(response.results.map(ChaletMapper.toPublicEntity).toList());
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.handle(error).message));
    }
  }

  @override
  Future<Either<Failure, List<Chalet>>> getOwnerChalets() async {
    try {
      final chalets = await _remoteDataSource.getChalets();
      return Right(chalets.map(ChaletMapper.toEntity).toList());
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.handle(error).message));
    }
  }

  @override
  Future<Either<Failure, Chalet>> getChaletDetails(int chaletId) async {
    try {
      final chalet = await _remoteDataSource.getChaletDetail(chaletId);
      return Right(ChaletMapper.toEntity(chalet));
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.handle(error).message));
    }
  }

  @override
  Future<Either<Failure, Chalet>> createChalet(
    domain.ChaletCreateRequest request,
  ) async {
    try {
      final modelRequest = ChaletMapper.toCreateRequestModel(request);
      final chalet = await _remoteDataSource.createChalet(modelRequest);
      return Right(ChaletMapper.toEntity(chalet));
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.handle(error).message));
    }
  }

  @override
  Future<Either<Failure, Chalet>> updateChalet(
    int chaletId,
    domain.ChaletUpdateRequest request,
  ) async {
    try {
      final modelRequest = ChaletMapper.toUpdateRequestModel(request);
      final chalet = await _remoteDataSource.updateChalet(
        chaletId,
        modelRequest,
      );
      return Right(ChaletMapper.toEntity(chalet));
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.handle(error).message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteChalet(int chaletId) async {
    try {
      await _remoteDataSource.deleteChalet(chaletId);
      return const Right(null);
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.handle(error).message));
    }
  }

  @override
  Future<Either<Failure, domain.ChaletImageUploadResponse>> uploadChaletImages(
    int chaletId,
    List<File> images,
  ) async {
    try {
      // Convert files to multipart
      final multipartFiles = <MultipartFile>[];
      for (final file in images) {
        multipartFiles.add(
          await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        );
      }

      final response = await _remoteDataSource.uploadChaletImages(
        chaletId,
        multipartFiles,
        null,
      );
      return Right(ChaletMapper.toImageUploadEntity(response));
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.handle(error).message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteChaletImage(
    int chaletId,
    int imageId,
  ) async {
    try {
      await _remoteDataSource.deleteChaletImage(chaletId, imageId);
      return const Right(null);
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.handle(error).message));
    }
  }

  @override
  Future<Either<Failure, void>> updateChaletImageOrder(
    int chaletId,
    List<int> imageIds,
  ) async {
    return Left(ServerFailure('Image order update not implemented'));
  }

  @override
  Future<Either<Failure, void>> setMainChaletImage(
    int chaletId,
    int imageId,
  ) async {
    try {
      await _remoteDataSource.updateChaletImage(chaletId, imageId, {
        'is_main': true,
      });
      return const Right(null);
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.handle(error).message));
    }
  }

  @override
  Future<Either<Failure, Chalet>> toggleChaletAvailability(int chaletId) async {
    return Left(ServerFailure('Toggle availability not implemented'));
  }
}
