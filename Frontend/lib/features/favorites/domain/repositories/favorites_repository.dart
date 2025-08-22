import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/favorite.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<Favorite>>> getFavorites({int page = 1});
  Future<Either<Failure, Favorite>> addFavorite({required int chaletId});
  Future<Either<Failure, void>> removeFavoriteByFavoriteId(int favoriteId);
  Future<Either<Failure, void>> removeFavoriteByChaletId(int chaletId);
}
