import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/chalet.dart';
import '../repositories/chalet_repository.dart';

class GetChaletDetails implements UseCase<Chalet, int> {
  final ChaletRepository repository;

  GetChaletDetails(this.repository);

  @override
  Future<Either<Failure, Chalet>> call(int chaletId) async {
    return await repository.getChaletDetails(chaletId);
  }
}
