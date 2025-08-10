import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/public_chalet.dart';
import '../repositories/chalet_repository.dart';

class SearchPublicChalets implements UseCase<List<PublicChalet>, String> {
  final ChaletRepository repository;

  SearchPublicChalets(this.repository);

  @override
  Future<Either<Failure, List<PublicChalet>>> call(String query) async {
    return await repository.searchPublicChalets(query);
  }
}
