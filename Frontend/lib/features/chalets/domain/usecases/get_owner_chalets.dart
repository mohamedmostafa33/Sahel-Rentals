import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/chalet.dart';
import '../repositories/chalet_repository.dart';

class GetOwnerChalets implements UseCase<List<Chalet>, NoParams> {
  final ChaletRepository repository;

  GetOwnerChalets(this.repository);

  @override
  Future<Either<Failure, List<Chalet>>> call(NoParams params) async {
    return await repository.getOwnerChalets();
  }
}
