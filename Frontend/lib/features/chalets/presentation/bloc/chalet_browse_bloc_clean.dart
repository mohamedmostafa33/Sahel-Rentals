import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/public_chalet.dart';
import '../../domain/entities/pagination_info.dart';
import '../../domain/usecases/get_public_chalets.dart';
import '../../domain/usecases/get_public_chalet_details.dart';
import '../../domain/usecases/search_public_chalets.dart';

part 'chalet_browse_bloc_clean.freezed.dart';

// Events
@freezed
class ChaletBrowseEvent with _$ChaletBrowseEvent {
  const factory ChaletBrowseEvent.loadChalets() = LoadChaletsEvent;
  const factory ChaletBrowseEvent.loadMoreChalets() = LoadMoreChaletsEvent;
  const factory ChaletBrowseEvent.refreshChalets() = RefreshChaletsEvent;
  const factory ChaletBrowseEvent.loadChaletDetail(int chaletId) = LoadChaletDetailEvent;
  const factory ChaletBrowseEvent.searchChalets(String query) = SearchChaletsEvent;
  const factory ChaletBrowseEvent.restoreChaletsList() = RestoreChaletsListEvent;
}

// States
@freezed
class ChaletBrowseState with _$ChaletBrowseState {
  const factory ChaletBrowseState.initial() = ChaletBrowseInitial;
  const factory ChaletBrowseState.loading() = ChaletBrowseLoading;
  const factory ChaletBrowseState.loaded(
    List<PublicChalet> chalets,
    PaginationInfo? paginationInfo,
  ) = ChaletBrowseLoaded;
  const factory ChaletBrowseState.loadingMore(
    List<PublicChalet> chalets,
    PaginationInfo? paginationInfo,
  ) = ChaletBrowseLoadingMore;
  const factory ChaletBrowseState.chaletDetailLoaded(
    PublicChalet chalet, 
    List<PublicChalet> previousList,
    PaginationInfo? paginationInfo,
  ) = ChaletDetailLoaded;
  const factory ChaletBrowseState.failure(String errorMessage) = ChaletBrowseFailure;
}

class ChaletBrowseBlocClean extends Bloc<ChaletBrowseEvent, ChaletBrowseState> {
  final GetPublicChalets _getPublicChalets;
  final GetPublicChaletDetails _getPublicChaletDetails;
  final SearchPublicChalets _searchPublicChalets;

  List<PublicChalet> _allChalets = [];
  List<PublicChalet> _filteredChalets = [];
  String _currentSearchQuery = '';
  PaginationInfo? _currentPaginationInfo;
  bool _isLoadingMore = false;

  ChaletBrowseBlocClean({
    required GetPublicChalets getPublicChalets,
    required GetPublicChaletDetails getPublicChaletDetails,
    required SearchPublicChalets searchPublicChalets,
  })  : _getPublicChalets = getPublicChalets,
        _getPublicChaletDetails = getPublicChaletDetails,
        _searchPublicChalets = searchPublicChalets,
        super(const ChaletBrowseState.initial()) {
    on<LoadChaletsEvent>(_onLoadChalets);
    on<LoadMoreChaletsEvent>(_onLoadMoreChalets);
    on<RefreshChaletsEvent>(_onRefreshChalets);
    on<LoadChaletDetailEvent>(_onLoadChaletDetail);
    on<SearchChaletsEvent>(_onSearchChalets);
    on<RestoreChaletsListEvent>(_onRestoreChaletsList);
  }

  Future<void> _onLoadChalets(
    LoadChaletsEvent event,
    Emitter<ChaletBrowseState> emit,
  ) async {
    emit(const ChaletBrowseState.loading());
    
    final result = await _getPublicChalets(const GetPublicChaletsParams(page: 1));
    
    result.fold(
      (failure) => emit(ChaletBrowseState.failure(failure.message)),
      (response) {
        final paginationInfo = response.toPaginationInfo(1, 10);
        _allChalets = response.results;
        _filteredChalets = _allChalets;
        _currentPaginationInfo = paginationInfo;
        emit(ChaletBrowseState.loaded(_filteredChalets, paginationInfo));
      },
    );
  }

  Future<void> _onLoadMoreChalets(
    LoadMoreChaletsEvent event,
    Emitter<ChaletBrowseState> emit,
  ) async {
    if (_isLoadingMore || _currentPaginationInfo?.hasNext != true) return;

    _isLoadingMore = true;
    emit(ChaletBrowseState.loadingMore(_filteredChalets, _currentPaginationInfo));

    final nextPage = (_currentPaginationInfo?.currentPage ?? 0) + 1;
    final result = await _getPublicChalets(
      GetPublicChaletsParams(
        page: nextPage,
        search: _currentSearchQuery.isNotEmpty ? _currentSearchQuery : null,
      ),
    );

    result.fold(
      (failure) {
        _isLoadingMore = false;
        emit(ChaletBrowseState.failure(failure.message));
      },
      (response) {
        final paginationInfo = response.toPaginationInfo(nextPage, 10);
        _allChalets.addAll(response.results);
        _filteredChalets = _allChalets;
        _currentPaginationInfo = paginationInfo;
        _isLoadingMore = false;
        emit(ChaletBrowseState.loaded(_filteredChalets, paginationInfo));
      },
    );
  }

  Future<void> _onRefreshChalets(
    RefreshChaletsEvent event,
    Emitter<ChaletBrowseState> emit,
  ) async {
    _allChalets.clear();
    _filteredChalets.clear();
    _currentSearchQuery = '';
    _currentPaginationInfo = null;
    _isLoadingMore = false;
    
    add(const ChaletBrowseEvent.loadChalets());
  }

  Future<void> _onLoadChaletDetail(
    LoadChaletDetailEvent event,
    Emitter<ChaletBrowseState> emit,
  ) async {
    final result = await _getPublicChaletDetails(event.chaletId);
    
    result.fold(
      (failure) => emit(ChaletBrowseState.failure(failure.message)),
      (chalet) => emit(ChaletBrowseState.chaletDetailLoaded(
        chalet,
        _filteredChalets,
        _currentPaginationInfo,
      )),
    );
  }

  Future<void> _onSearchChalets(
    SearchChaletsEvent event,
    Emitter<ChaletBrowseState> emit,
  ) async {
    _currentSearchQuery = event.query;
    
    if (event.query.isEmpty) {
      _filteredChalets = _allChalets;
      emit(ChaletBrowseState.loaded(_filteredChalets, _currentPaginationInfo));
      return;
    }

    emit(const ChaletBrowseState.loading());
    
    final result = await _searchPublicChalets(event.query);
    
    result.fold(
      (failure) => emit(ChaletBrowseState.failure(failure.message)),
      (chalets) {
        _filteredChalets = chalets;
        // Create a simple pagination info for search results
        final searchPaginationInfo = PaginationInfo(
          currentPage: 1,
          totalPages: 1,
          totalItems: chalets.length,
          itemsPerPage: chalets.length,
          hasNext: false,
          hasPrevious: false,
        );
        emit(ChaletBrowseState.loaded(_filteredChalets, searchPaginationInfo));
      },
    );
  }

  Future<void> _onRestoreChaletsList(
    RestoreChaletsListEvent event,
    Emitter<ChaletBrowseState> emit,
  ) async {
    emit(ChaletBrowseState.loaded(_filteredChalets, _currentPaginationInfo));
  }
}
