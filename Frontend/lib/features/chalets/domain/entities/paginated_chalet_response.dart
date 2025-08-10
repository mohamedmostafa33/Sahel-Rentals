import 'package:equatable/equatable.dart';
import 'public_chalet.dart';
import 'pagination_info.dart';

class PaginatedChaletResponse extends Equatable {
  final int count;
  final String? nextUrl;
  final String? previousUrl;
  final List<PublicChalet> results;

  const PaginatedChaletResponse({
    required this.count,
    this.nextUrl,
    this.previousUrl,
    required this.results,
  });

  @override
  List<Object?> get props => [count, nextUrl, previousUrl, results];

  PaginatedChaletResponse copyWith({
    int? count,
    String? nextUrl,
    String? previousUrl,
    List<PublicChalet>? results,
  }) {
    return PaginatedChaletResponse(
      count: count ?? this.count,
      nextUrl: nextUrl ?? this.nextUrl,
      previousUrl: previousUrl ?? this.previousUrl,
      results: results ?? this.results,
    );
  }

  // Create pagination info from response
  PaginationInfo toPaginationInfo(int page, int pageSize) {
    final totalPages = (count / pageSize).ceil();
    return PaginationInfo(
      currentPage: page,
      totalPages: totalPages,
      totalItems: count,
      itemsPerPage: pageSize,
      hasNext: nextUrl != null,
      hasPrevious: previousUrl != null,
    );
  }
}
