import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/public_chalet.dart';
import '../repositories/chalet_repository.dart';

class GetPublicChaletDetails implements UseCase<PublicChalet, int> {
  final ChaletRepository repository;

  GetPublicChaletDetails(this.repository);

  @override
  Future<Either<Failure, PublicChalet>> call(int chaletId) async {
    return await repository.getPublicChaletDetails(chaletId);
  }
}
