import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/favorite.dart';
import '../repositories/favorites_repository.dart';

class AddFavoriteParams {
  final int chaletId;
  const AddFavoriteParams(this.chaletId);
}

class AddFavorite implements UseCase<Favorite, AddFavoriteParams> {
  final FavoritesRepository repository;
  AddFavorite(this.repository);

  @override
  Future<Either<Failure, Favorite>> call(AddFavoriteParams params) {
    return repository.addFavorite(chaletId: params.chaletId);
  }
}
