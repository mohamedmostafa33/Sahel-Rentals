import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/chalet.dart';
import '../entities/chalet_requests.dart';
import '../repositories/chalet_repository.dart';

class UpdateChalet implements UseCase<Chalet, UpdateChaletParams> {
  final ChaletRepository repository;

  UpdateChalet(this.repository);

  @override
  Future<Either<Failure, Chalet>> call(UpdateChaletParams params) async {
    return await repository.updateChalet(params.chaletId, params.request);
  }
}

class UpdateChaletParams {
  final int chaletId;
  final ChaletUpdateRequest request;

  const UpdateChaletParams({
    required this.chaletId,
    required this.request,
  });
}
