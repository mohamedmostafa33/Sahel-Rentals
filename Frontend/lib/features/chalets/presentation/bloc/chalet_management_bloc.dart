import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/chalet_models.dart';
import '../../data/services/chalet_api_service.dart';
import '../../../../core/network/api_result.dart';

part 'chalet_management_bloc.freezed.dart';

// Events
@freezed
class ChaletManagementEvent with _$ChaletManagementEvent {
  const factory ChaletManagementEvent.loadChalets() = LoadChalets;
  const factory ChaletManagementEvent.refreshChalets() = RefreshChalets;
  const factory ChaletManagementEvent.createChalet(ChaletCreateRequest request) = CreateChalet;
  const factory ChaletManagementEvent.updateChalet(int id, ChaletUpdateRequest request) = UpdateChalet;
  const factory ChaletManagementEvent.deleteChalet(int id) = DeleteChalet;
  const factory ChaletManagementEvent.uploadImages(int chaletId, List<File> images, {Map<String, String>? captions}) = UploadImages;
  const factory ChaletManagementEvent.deleteImage(int chaletId, int imageId) = DeleteImage;
  const factory ChaletManagementEvent.setMainImage(int chaletId, int imageId) = SetMainImage;
  const factory ChaletManagementEvent.toggleAvailability(int chaletId, bool isAvailable) = ToggleAvailability;
  const factory ChaletManagementEvent.sortChalets(ChaletSortBy sortBy) = SortChalets;
  const factory ChaletManagementEvent.searchChalets(String query) = SearchChalets;
}

// States
@freezed
class ChaletManagementState with _$ChaletManagementState {
  const factory ChaletManagementState.initial() = Initial;
  const factory ChaletManagementState.loading() = Loading;
  const factory ChaletManagementState.loaded({
    required List<ChaletModel> chalets,
    required List<ChaletModel> filteredChalets,
    @Default('') String searchQuery,
    @Default(ChaletSortBy.newest) ChaletSortBy sortBy,
  }) = Loaded;
  const factory ChaletManagementState.error(String message) = Error;
  
  // Specific action states
  const factory ChaletManagementState.creating() = Creating;
  const factory ChaletManagementState.created(ChaletModel chalet) = Created;
  const factory ChaletManagementState.updating() = Updating;
  const factory ChaletManagementState.updated(ChaletModel chalet) = Updated;
  const factory ChaletManagementState.deleting() = Deleting;
  const factory ChaletManagementState.deleted(int chaletId) = Deleted;
  const factory ChaletManagementState.uploadingImages() = UploadingImages;
  const factory ChaletManagementState.imagesUploaded(int chaletId, List<ChaletImageModel> images) = ImagesUploaded;
}

class ChaletManagementBloc extends Bloc<ChaletManagementEvent, ChaletManagementState> {
  final ChaletRepository _repository;
  List<ChaletModel> _allChalets = [];
  String _currentSearchQuery = '';
  ChaletSortBy _currentSortBy = ChaletSortBy.newest;

  ChaletManagementBloc(this._repository) : super(const ChaletManagementState.initial()) {
    on<LoadChalets>(_onLoadChalets);
    on<RefreshChalets>(_onRefreshChalets);
    on<CreateChalet>(_onCreateChalet);
    on<UpdateChalet>(_onUpdateChalet);
    on<DeleteChalet>(_onDeleteChalet);
    on<UploadImages>(_onUploadImages);
    on<DeleteImage>(_onDeleteImage);
    on<SetMainImage>(_onSetMainImage);
    on<ToggleAvailability>(_onToggleAvailability);
    on<SortChalets>(_onSortChalets);
    on<SearchChalets>(_onSearchChalets);
  }

  Future<void> _onLoadChalets(LoadChalets event, Emitter<ChaletManagementState> emit) async {
    emit(const ChaletManagementState.loading());
    
    final result = await _repository.getChalets();
    result.when(
      success: (chalets) {
        _allChalets = chalets;
        final filteredChalets = _applyFiltersAndSort(chalets);
        emit(ChaletManagementState.loaded(
          chalets: chalets,
          filteredChalets: filteredChalets,
          searchQuery: _currentSearchQuery,
          sortBy: _currentSortBy,
        ));
      },
      failure: (error) => emit(ChaletManagementState.error(error.message)),
    );
  }

  Future<void> _onRefreshChalets(RefreshChalets event, Emitter<ChaletManagementState> emit) async {
    // Don't show loading for refresh, keep current state
    final result = await _repository.getChalets();
    result.when(
      success: (chalets) {
        _allChalets = chalets;
        final filteredChalets = _applyFiltersAndSort(chalets);
        emit(ChaletManagementState.loaded(
          chalets: chalets,
          filteredChalets: filteredChalets,
          searchQuery: _currentSearchQuery,
          sortBy: _currentSortBy,
        ));
      },
      failure: (error) => emit(ChaletManagementState.error(error.message)),
    );
  }

  Future<void> _onCreateChalet(CreateChalet event, Emitter<ChaletManagementState> emit) async {
    emit(const ChaletManagementState.creating());
    
    final result = await _repository.createChalet(event.request);
    result.when(
      success: (chalet) {
        emit(ChaletManagementState.created(chalet));
        // Reload chalets to get updated list
        add(const ChaletManagementEvent.loadChalets());
      },
      failure: (error) => emit(ChaletManagementState.error(error.message)),
    );
  }

  Future<void> _onUpdateChalet(UpdateChalet event, Emitter<ChaletManagementState> emit) async {
    emit(const ChaletManagementState.updating());
    
    final result = await _repository.updateChalet(event.id, event.request);
    result.when(
      success: (chalet) {
        emit(ChaletManagementState.updated(chalet));
        // Update local list
        _updateChaletInList(chalet);
        final filteredChalets = _applyFiltersAndSort(_allChalets);
        emit(ChaletManagementState.loaded(
          chalets: _allChalets,
          filteredChalets: filteredChalets,
          searchQuery: _currentSearchQuery,
          sortBy: _currentSortBy,
        ));
      },
      failure: (error) => emit(ChaletManagementState.error(error.message)),
    );
  }

  Future<void> _onDeleteChalet(DeleteChalet event, Emitter<ChaletManagementState> emit) async {
    emit(const ChaletManagementState.deleting());
    
    final result = await _repository.deleteChalet(event.id);
    result.when(
      success: (_) {
        emit(ChaletManagementState.deleted(event.id));
        // Remove from local list
        _allChalets.removeWhere((chalet) => chalet.id == event.id);
        final filteredChalets = _applyFiltersAndSort(_allChalets);
        emit(ChaletManagementState.loaded(
          chalets: _allChalets,
          filteredChalets: filteredChalets,
          searchQuery: _currentSearchQuery,
          sortBy: _currentSortBy,
        ));
      },
      failure: (error) => emit(ChaletManagementState.error(error.message)),
    );
  }

  Future<void> _onUploadImages(UploadImages event, Emitter<ChaletManagementState> emit) async {
    emit(const ChaletManagementState.uploadingImages());
    
    final result = await _repository.uploadChaletImages(
      event.chaletId,
      event.images,
      captions: event.captions,
    );
    
    result.when(
      success: (response) {
        emit(ChaletManagementState.imagesUploaded(event.chaletId, response.images));
        // Refresh chalets to get updated image data
        add(const ChaletManagementEvent.refreshChalets());
      },
      failure: (error) => emit(ChaletManagementState.error(error.message)),
    );
  }

  Future<void> _onDeleteImage(DeleteImage event, Emitter<ChaletManagementState> emit) async {
    final result = await _repository.deleteChaletImage(event.chaletId, event.imageId);
    result.when(
      success: (_) {
        // Refresh chalets to get updated image data
        add(const ChaletManagementEvent.refreshChalets());
      },
      failure: (error) => emit(ChaletManagementState.error(error.message)),
    );
  }

  Future<void> _onSetMainImage(SetMainImage event, Emitter<ChaletManagementState> emit) async {
    final result = await _repository.updateChaletImage(
      event.chaletId,
      event.imageId,
      isMain: true,
    );
    result.when(
      success: (_) {
        // Refresh chalets to get updated image data
        add(const ChaletManagementEvent.refreshChalets());
      },
      failure: (error) => emit(ChaletManagementState.error(error.message)),
    );
  }

  Future<void> _onToggleAvailability(ToggleAvailability event, Emitter<ChaletManagementState> emit) async {
    final updateRequest = ChaletUpdateRequest(isAvailable: event.isAvailable);
    final result = await _repository.updateChalet(event.chaletId, updateRequest);
    
    result.when(
      success: (chalet) {
        _updateChaletInList(chalet);
        final filteredChalets = _applyFiltersAndSort(_allChalets);
        emit(ChaletManagementState.loaded(
          chalets: _allChalets,
          filteredChalets: filteredChalets,
          searchQuery: _currentSearchQuery,
          sortBy: _currentSortBy,
        ));
      },
      failure: (error) => emit(ChaletManagementState.error(error.message)),
    );
  }

  void _onSortChalets(SortChalets event, Emitter<ChaletManagementState> emit) {
    _currentSortBy = event.sortBy;
    final filteredChalets = _applyFiltersAndSort(_allChalets);
    
    final currentState = state;
    if (currentState is Loaded) {
      emit(currentState.copyWith(
        filteredChalets: filteredChalets,
        sortBy: _currentSortBy,
      ));
    }
  }

  void _onSearchChalets(SearchChalets event, Emitter<ChaletManagementState> emit) {
    _currentSearchQuery = event.query;
    final filteredChalets = _applyFiltersAndSort(_allChalets);
    
    final currentState = state;
    if (currentState is Loaded) {
      emit(currentState.copyWith(
        filteredChalets: filteredChalets,
        searchQuery: _currentSearchQuery,
      ));
    }
  }

  List<ChaletModel> _applyFiltersAndSort(List<ChaletModel> chalets) {
    List<ChaletModel> filtered = List.from(chalets);

    // Apply search filter
    if (_currentSearchQuery.isNotEmpty) {
      filtered = filtered.where((chalet) {
        return chalet.name.toLowerCase().contains(_currentSearchQuery.toLowerCase()) ||
               chalet.location.toLowerCase().contains(_currentSearchQuery.toLowerCase()) ||
               chalet.unitNumber.toLowerCase().contains(_currentSearchQuery.toLowerCase());
      }).toList();
    }

    // Apply sorting
    switch (_currentSortBy) {
      case ChaletSortBy.newest:
        filtered.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case ChaletSortBy.oldest:
        filtered.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        break;
      case ChaletSortBy.priceAsc:
        filtered.sort((a, b) => a.pricePerNight.compareTo(b.pricePerNight));
        break;
      case ChaletSortBy.priceDesc:
        filtered.sort((a, b) => b.pricePerNight.compareTo(a.pricePerNight));
        break;
      case ChaletSortBy.nameAsc:
        filtered.sort((a, b) => a.name.compareTo(b.name));
        break;
      case ChaletSortBy.nameDesc:
        filtered.sort((a, b) => b.name.compareTo(a.name));
        break;
    }

    return filtered;
  }

  void _updateChaletInList(ChaletModel updatedChalet) {
    final index = _allChalets.indexWhere((chalet) => chalet.id == updatedChalet.id);
    if (index != -1) {
      _allChalets[index] = updatedChalet;
    }
  }
}
