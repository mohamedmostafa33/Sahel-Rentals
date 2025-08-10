import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/chalet_repository.dart';

class DeleteChalet implements UseCase<void, int> {
  final ChaletRepository repository;

  DeleteChalet(this.repository);

  @override
  Future<Either<Failure, void>> call(int chaletId) async {
    return await repository.deleteChalet(chaletId);
  }
}
