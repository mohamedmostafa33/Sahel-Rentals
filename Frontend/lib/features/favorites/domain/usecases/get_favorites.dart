import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/favorite.dart';
import '../repositories/favorites_repository.dart';

class GetFavorites implements UseCase<List<Favorite>, int> {
  final FavoritesRepository repository;
  GetFavorites(this.repository);

  @override
  Future<Either<Failure, List<Favorite>>> call(int params) {
    return repository.getFavorites(page: params);
  }
}
