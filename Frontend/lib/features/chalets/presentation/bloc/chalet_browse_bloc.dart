import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/chalet_models.dart';
import '../../data/services/chalet_api_service.dart';
import '../../../../core/network/api_result.dart';

part 'chalet_browse_bloc.freezed.dart';

// Events
@freezed
class ChaletBrowseEvent with _$ChaletBrowseEvent {
  const factory ChaletBrowseEvent.loadChalets() = LoadChaletsEvent;
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
  const factory ChaletBrowseState.loaded(List<PublicChaletModel> chalets) = ChaletBrowseLoaded;
  const factory ChaletBrowseState.chaletDetailLoaded(PublicChaletModel chalet, List<PublicChaletModel> previousList) = ChaletDetailLoaded;
  const factory ChaletBrowseState.failure(String errorMessage) = ChaletBrowseFailure;
}

class ChaletBrowseBloc extends Bloc<ChaletBrowseEvent, ChaletBrowseState> {
  final ChaletRepository _repository;
  List<PublicChaletModel> _allChalets = [];
  List<PublicChaletModel> _filteredChalets = [];
  String _currentSearchQuery = '';

  ChaletBrowseBloc(this._repository) : super(const ChaletBrowseState.initial()) {
    on<LoadChaletsEvent>(_onLoadChalets);
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
      print('🚀 ChaletBrowseBloc: Starting to load chalets...');
      emit(const ChaletBrowseState.loading());
      
      print('📡 ChaletBrowseBloc: Calling repository.getPublicChalets()...');
      final result = await _repository.getPublicChalets();
      
      print('📦 ChaletBrowseBloc: Got result from repository');
      result.when(
        success: (chalets) {
          print('✅ ChaletBrowseBloc: Success! Got ${chalets.length} chalets');
          _allChalets = chalets;
          _filteredChalets = chalets;
          _currentSearchQuery = '';
          for (int i = 0; i < chalets.length && i < 3; i++) {
            final chalet = chalets[i];
            print('🏠 Chalet $i: ${chalet.name} (Owner: ${chalet.ownerName})');
          }
          emit(ChaletBrowseState.loaded(chalets));
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

  Future<void> _onRefreshChalets(
    RefreshChaletsEvent event,
    Emitter<ChaletBrowseState> emit,
  ) async {
    // Don't show loading for refresh, just refresh the data
    final result = await _repository.getPublicChalets();
    
    result.when(
      success: (chalets) {
        _allChalets = chalets;
        _filteredChalets = chalets;
        _currentSearchQuery = '';
        emit(ChaletBrowseState.loaded(chalets));
      },
      failure: (error) {
        emit(ChaletBrowseState.failure(error.message));
      },
    );
  }

  Future<void> _onLoadChaletDetail(
    LoadChaletDetailEvent event,
    Emitter<ChaletBrowseState> emit,
  ) async {
    // Get current list to preserve it
    final currentList = _filteredChalets.isNotEmpty ? _filteredChalets : _allChalets;
    
    emit(const ChaletBrowseState.loading());
    
    final result = await _repository.getPublicChaletDetail(event.chaletId);
    
    result.when(
      success: (chalet) {
        emit(ChaletBrowseState.chaletDetailLoaded(chalet, currentList));
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
    
    if (event.query.trim().isEmpty) {
      _filteredChalets = _allChalets;
      emit(ChaletBrowseState.loaded(_allChalets));
      return;
    }

    final query = event.query.toLowerCase().trim();
    final filteredChalets = _allChalets.where((chalet) {
      return chalet.name.toLowerCase().contains(query) ||
          chalet.location.toLowerCase().contains(query) ||
          chalet.unitNumber.toLowerCase().contains(query);
    }).toList();

    _filteredChalets = filteredChalets;
    emit(ChaletBrowseState.loaded(filteredChalets));
  }

  void _onRestoreChaletsList(
    RestoreChaletsListEvent event,
    Emitter<ChaletBrowseState> emit,
  ) {
    print('🔄 ChaletBrowseBloc: Restoring chalets list. All: ${_allChalets.length}, Filtered: ${_filteredChalets.length}, Query: "$_currentSearchQuery"');
    
    // Always restore the appropriate list based on current search state
    if (_currentSearchQuery.isEmpty) {
      if (_allChalets.isNotEmpty) {
        _filteredChalets = _allChalets;
        print('🔄 Restoring full list with ${_allChalets.length} chalets');
        emit(ChaletBrowseState.loaded(_allChalets));
      } else {
        print('🔄 No cached chalets, triggering reload...');
        add(const ChaletBrowseEvent.loadChalets());
      }
    } else {
      if (_filteredChalets.isNotEmpty) {
        print('🔄 Restoring filtered list with ${_filteredChalets.length} chalets');
        emit(ChaletBrowseState.loaded(_filteredChalets));
      } else {
        print('🔄 Re-applying search filter...');
        add(ChaletBrowseEvent.searchChalets(_currentSearchQuery));
      }
    }
  }
}
