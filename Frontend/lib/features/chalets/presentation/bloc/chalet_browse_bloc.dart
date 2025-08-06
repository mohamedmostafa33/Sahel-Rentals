import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/chalet_models.dart';
import '../../data/services/chalet_api_service.dart';
import '../../../../core/network/api_result.dart';

part 'chalet_browse_bloc.freezed.dart';

// Simple pagination info class
class SimplePaginationInfo {
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final int itemsPerPage;
  final bool hasNext;
  final bool hasPrevious;

  SimplePaginationInfo({
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.itemsPerPage,
    required this.hasNext,
    required this.hasPrevious,
  });
}

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
    List<PublicChaletModel> chalets,
    SimplePaginationInfo? paginationInfo,
  ) = ChaletBrowseLoaded;
  const factory ChaletBrowseState.loadingMore(
    List<PublicChaletModel> chalets,
    SimplePaginationInfo? paginationInfo,
  ) = ChaletBrowseLoadingMore;
  const factory ChaletBrowseState.chaletDetailLoaded(
    PublicChaletModel chalet, 
    List<PublicChaletModel> previousList,
    SimplePaginationInfo? paginationInfo,
  ) = ChaletDetailLoaded;
  const factory ChaletBrowseState.failure(String errorMessage) = ChaletBrowseFailure;
}

class ChaletBrowseBloc extends Bloc<ChaletBrowseEvent, ChaletBrowseState> {
  final ChaletRepository _repository;
  List<PublicChaletModel> _allChalets = [];
  List<PublicChaletModel> _filteredChalets = [];
  String _currentSearchQuery = '';
  SimplePaginationInfo? _currentPaginationInfo;
  bool _isLoadingMore = false;

  ChaletBrowseBloc(this._repository) : super(const ChaletBrowseState.initial()) {
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
    try {
      print('🚀 ChaletBrowseBloc: Loading chalets with pagination...');
      emit(const ChaletBrowseState.loading());
      
      print('📡 ChaletBrowseBloc: Calling getPublicChaletsPaginated(page: 1)...');
      final result = await _repository.getPublicChaletsPaginated(
        page: 1,
        pageSize: 10,
        search: _currentSearchQuery.isEmpty ? null : _currentSearchQuery,
      );
      
      result.when(
        success: (paginatedResponse) {
          print('✅ ChaletBrowseBloc: Success! Got ${paginatedResponse.results.length} chalets, total: ${paginatedResponse.count}');
          _allChalets = paginatedResponse.results;
          _filteredChalets = paginatedResponse.results;
          _currentPaginationInfo = SimplePaginationInfo(
            currentPage: 1,
            totalPages: (paginatedResponse.count / 10).ceil(),
            totalItems: paginatedResponse.count,
            itemsPerPage: 10,
            hasNext: paginatedResponse.nextUrl != null,
            hasPrevious: paginatedResponse.previousUrl != null,
          );
          
          for (int i = 0; i < paginatedResponse.results.length && i < 3; i++) {
            final chalet = paginatedResponse.results[i];
            print('🏠 Chalet $i: ${chalet.name} (Owner: ${chalet.ownerName})');
          }
          
          emit(ChaletBrowseState.loaded(paginatedResponse.results, _currentPaginationInfo));
        },
        failure: (error) {
          print('❌ ChaletBrowseBloc: Repository failure: ${error.message}');
          emit(ChaletBrowseState.failure(error.message));
        },
      );
    } catch (error, stackTrace) {
      print('💥 ChaletBrowseBloc: Unexpected error in _onLoadChalets: $error');
      print('📍 Stack trace: $stackTrace');
      emit(ChaletBrowseState.failure('Unexpected error: $error'));
    }
  }

  Future<void> _onLoadMoreChalets(
    LoadMoreChaletsEvent event,
    Emitter<ChaletBrowseState> emit,
  ) async {
    if (_isLoadingMore || _currentPaginationInfo == null || !_currentPaginationInfo!.hasNext) {
      return;
    }

    try {
      _isLoadingMore = true;
      final currentPage = _currentPaginationInfo!.currentPage;
      print('🔄 ChaletBrowseBloc: Loading more chalets, page: ${currentPage + 1}');
      
      // Emit loading more state with current data
      emit(ChaletBrowseState.loadingMore(_allChalets, _currentPaginationInfo));
      
      final result = await _repository.getPublicChaletsPaginated(
        page: currentPage + 1,
        pageSize: _currentPaginationInfo!.itemsPerPage,
        search: _currentSearchQuery.isEmpty ? null : _currentSearchQuery,
      );
      
      result.when(
        success: (paginatedResponse) {
          print('✅ ChaletBrowseBloc: Loaded ${paginatedResponse.results.length} more chalets');
          final updatedChalets = [..._allChalets, ...paginatedResponse.results];
          _allChalets = updatedChalets;
          _filteredChalets = updatedChalets;
          _currentPaginationInfo = SimplePaginationInfo(
            currentPage: currentPage + 1,
            totalPages: (_currentPaginationInfo!.totalItems / _currentPaginationInfo!.itemsPerPage).ceil(),
            totalItems: _currentPaginationInfo!.totalItems,
            itemsPerPage: _currentPaginationInfo!.itemsPerPage,
            hasNext: paginatedResponse.nextUrl != null,
            hasPrevious: paginatedResponse.previousUrl != null,
          );
          
          emit(ChaletBrowseState.loaded(updatedChalets, _currentPaginationInfo));
        },
        failure: (error) {
          print('❌ ChaletBrowseBloc: Load more failure: ${error.message}');
          // Keep current state on error, just show message
          emit(ChaletBrowseState.loaded(_allChalets, _currentPaginationInfo));
        },
      );
    } catch (error) {
      print('💥 ChaletBrowseBloc: Unexpected error in _onLoadMoreChalets: $error');
      emit(ChaletBrowseState.loaded(_allChalets, _currentPaginationInfo));
    } finally {
      _isLoadingMore = false;
    }
  }

  Future<void> _onRefreshChalets(
    RefreshChaletsEvent event,
    Emitter<ChaletBrowseState> emit,
  ) async {
    // Reset pagination and reload from first page
    _currentPaginationInfo = null;
    _allChalets.clear();
    _filteredChalets.clear();
    
    // Use the same load logic as initial load
    add(const ChaletBrowseEvent.loadChalets());
  }

  Future<void> _onLoadChaletDetail(
    LoadChaletDetailEvent event,
    Emitter<ChaletBrowseState> emit,
  ) async {
    // Get current list to preserve it
    final currentList = _filteredChalets.isNotEmpty ? _filteredChalets : _allChalets;
    final currentPagination = _currentPaginationInfo ?? SimplePaginationInfo(
      currentPage: 1,
      totalPages: 1,
      totalItems: currentList.length,
      itemsPerPage: 10,
      hasNext: false,
      hasPrevious: false,
    );
    
    emit(const ChaletBrowseState.loading());
    
    final result = await _repository.getPublicChaletDetail(event.chaletId);
    
    result.when(
      success: (chalet) {
        emit(ChaletBrowseState.chaletDetailLoaded(chalet, currentList, currentPagination));
      },
      failure: (error) {
        emit(ChaletBrowseState.failure(error.message));
      },
    );
  }

  Future<void> _onSearchChalets(
    SearchChaletsEvent event,
    Emitter<ChaletBrowseState> emit,
  ) async {
    _currentSearchQuery = event.query;
    
    // Reset pagination for search
    _currentPaginationInfo = null;
    _allChalets.clear();
    _filteredChalets.clear();
    
    // Use the same load logic as initial load
    add(const ChaletBrowseEvent.loadChalets());
  }

  void _onRestoreChaletsList(
    RestoreChaletsListEvent event,
    Emitter<ChaletBrowseState> emit,
  ) {
    print('🔄 ChaletBrowseBloc: Restoring chalets list. All: ${_allChalets.length}, Filtered: ${_filteredChalets.length}, Query: "$_currentSearchQuery"');
    
    // Always restore the appropriate list based on current search state
    if (_currentSearchQuery.isEmpty) {
      if (_allChalets.isNotEmpty && _currentPaginationInfo != null) {
        _filteredChalets = _allChalets;
        print('🔄 Restoring full list with ${_allChalets.length} chalets');
        emit(ChaletBrowseState.loaded(_allChalets, _currentPaginationInfo));
      } else {
        print('🔄 No cached chalets, triggering reload...');
        add(const ChaletBrowseEvent.loadChalets());
      }
    } else {
      if (_filteredChalets.isNotEmpty && _currentPaginationInfo != null) {
        print('🔄 Restoring filtered list with ${_filteredChalets.length} chalets');
        emit(ChaletBrowseState.loaded(_filteredChalets, _currentPaginationInfo));
      } else {
        print('🔄 Re-applying search filter...');
        add(ChaletBrowseEvent.searchChalets(_currentSearchQuery));
      }
    }
  }
}
