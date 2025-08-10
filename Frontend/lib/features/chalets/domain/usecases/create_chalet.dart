import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/chalet.dart';
import '../entities/chalet_requests.dart';
import '../repositories/chalet_repository.dart';

class CreateChalet implements UseCase<Chalet, ChaletCreateRequest> {
  final ChaletRepository repository;

  CreateChalet(this.repository);

  @override
  Future<Either<Failure, Chalet>> call(ChaletCreateRequest request) async {
    return await repository.createChalet(request);
  }
}
