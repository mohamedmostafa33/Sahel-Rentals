import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_error_handler.dart';
import '../../domain/entities/favorite.dart' as domain;
import '../../domain/repositories/favorites_repository.dart';
import '../../../chalets/data/mappers/chalet_mapper.dart';
import '../datasources/favorites_remote_data_source.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;
  FavoritesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<domain.Favorite>>> getFavorites({int page = 1}) async {
    try {
      final list = await remoteDataSource.getFavorites(page: page);
      final mapped = list
          .map((m) => domain.Favorite(
                id: m.id,
                chalet: ChaletMapper.toPublicEntity(m.chalet),
              ))
          .toList();
      return Right(mapped);
    } catch (e) {
      return Left(ServerFailure(ApiErrorHandler.handle(e).message));
    }
  }

  @override
  Future<Either<Failure, domain.Favorite>> addFavorite({required int chaletId}) async {
    try {
      final m = await remoteDataSource.addFavorite(chaletId);
      final mapped = domain.Favorite(
        id: m.id,
        chalet: ChaletMapper.toPublicEntity(m.chalet),
      );
      return Right(mapped);
    } catch (e) {
      return Left(ServerFailure(ApiErrorHandler.handle(e).message));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavoriteByFavoriteId(int favoriteId) async {
    try {
      await remoteDataSource.removeFavoriteByChaletId(favoriteId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(ApiErrorHandler.handle(e).message));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavoriteByChaletId(int chaletId) async {
    try {
      await remoteDataSource.removeFavoriteByChaletId(chaletId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(ApiErrorHandler.handle(e).message));
    }
  }
}
