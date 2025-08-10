import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/paginated_chalet_response.dart';
import '../entities/chalet_requests.dart';
import '../repositories/chalet_repository.dart';

class GetPublicChalets implements UseCase<PaginatedChaletResponse, GetPublicChaletsParams> {
  final ChaletRepository repository;

  GetPublicChalets(this.repository);

  @override
  Future<Either<Failure, PaginatedChaletResponse>> call(GetPublicChaletsParams params) async {
    return await repository.getPublicChalets(
      page: params.page,
      pageSize: params.pageSize,
      search: params.search,
      sortBy: params.sortBy,
    );
  }
}

class GetPublicChaletsParams {
  final int page;
  final int pageSize;
  final String? search;
  final ChaletSortBy? sortBy;

  const GetPublicChaletsParams({
    this.page = 1,
    this.pageSize = 10,
    this.search,
    this.sortBy,
  });
}
