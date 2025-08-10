import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/chalet.dart';
import '../../domain/entities/chalet_image.dart';
import '../../domain/entities/chalet_requests.dart';
import '../../domain/usecases/get_owner_chalets.dart';
import '../../domain/usecases/get_chalet_details.dart';
import '../../domain/usecases/create_chalet.dart' as usecases;
import '../../domain/usecases/update_chalet.dart' as usecases;
import '../../domain/usecases/delete_chalet.dart' as usecases;
import '../../../../core/usecases/usecase.dart';

part 'chalet_management_bloc_clean.freezed.dart';

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
    required List<Chalet> chalets,
    required List<Chalet> filteredChalets,
    @Default('') String searchQuery,
    @Default(ChaletSortBy.newest) ChaletSortBy sortBy,
  }) = Loaded;
  const factory ChaletManagementState.error(String message) = Error;
  
  // Specific action states
  const factory ChaletManagementState.creating() = Creating;
  const factory ChaletManagementState.created(Chalet chalet) = Created;
  const factory ChaletManagementState.updating() = Updating;
  const factory ChaletManagementState.updated(Chalet chalet) = Updated;
  const factory ChaletManagementState.deleting() = Deleting;
  const factory ChaletManagementState.deleted(int chaletId) = Deleted;
  const factory ChaletManagementState.uploadingImages() = UploadingImages;
  const factory ChaletManagementState.imagesUploaded(int chaletId, List<ChaletImage> images) = ImagesUploaded;
}

class ChaletManagementBlocClean extends Bloc<ChaletManagementEvent, ChaletManagementState> {
  final GetOwnerChalets _getOwnerChalets;
  final GetChaletDetails _getChaletDetails;
  final usecases.CreateChalet _createChalet;
  final usecases.UpdateChalet _updateChalet;
  final usecases.DeleteChalet _deleteChalet;

  List<Chalet> _allChalets = [];

  ChaletManagementBlocClean({
    required GetOwnerChalets getOwnerChalets,
    required GetChaletDetails getChaletDetails,
    required usecases.CreateChalet createChalet,
    required usecases.UpdateChalet updateChalet,
    required usecases.DeleteChalet deleteChalet,
  })  : _getOwnerChalets = getOwnerChalets,
        _getChaletDetails = getChaletDetails,
        _createChalet = createChalet,
        _updateChalet = updateChalet,
        _deleteChalet = deleteChalet,
        super(const ChaletManagementState.initial()) {
    on<LoadChalets>(_onLoadChalets);
    on<RefreshChalets>(_onRefreshChalets);
    on<CreateChalet>(_onCreateChalet);
    on<UpdateChalet>(_onUpdateChalet);
    on<DeleteChalet>(_onDeleteChalet);
    on<SortChalets>(_onSortChalets);
    on<SearchChalets>(_onSearchChalets);
  }

  Future<void> _onLoadChalets(
    LoadChalets event,
    Emitter<ChaletManagementState> emit,
  ) async {
    emit(const ChaletManagementState.loading());
    
    final result = await _getOwnerChalets(NoParams());
    
    result.fold(
      (failure) => emit(ChaletManagementState.error(failure.message)),
      (chalets) {
        _allChalets = chalets;
        emit(ChaletManagementState.loaded(
          chalets: chalets,
          filteredChalets: chalets,
        ));
      },
    );
  }

  Future<void> _onRefreshChalets(
    RefreshChalets event,
    Emitter<ChaletManagementState> emit,
  ) async {
    add(const ChaletManagementEvent.loadChalets());
  }

  Future<void> _onCreateChalet(
    CreateChalet event,
    Emitter<ChaletManagementState> emit,
  ) async {
    emit(const ChaletManagementState.creating());
    
    final result = await _createChalet(event.request);
    
    result.fold(
      (failure) => emit(ChaletManagementState.error(failure.message)),
      (chalet) {
        _allChalets.add(chalet);
        emit(ChaletManagementState.created(chalet));
        // Refresh the list
        emit(ChaletManagementState.loaded(
          chalets: _allChalets,
          filteredChalets: _allChalets,
        ));
      },
    );
  }

  Future<void> _onUpdateChalet(
    UpdateChalet event,
    Emitter<ChaletManagementState> emit,
  ) async {
    emit(const ChaletManagementState.updating());
    
    final result = await _updateChalet(usecases.UpdateChaletParams(
      chaletId: event.id,
      request: event.request,
    ));
    
    result.fold(
      (failure) => emit(ChaletManagementState.error(failure.message)),
      (updatedChalet) {
        final index = _allChalets.indexWhere((c) => c.id == event.id);
        if (index != -1) {
          _allChalets[index] = updatedChalet;
        }
        emit(ChaletManagementState.updated(updatedChalet));
        // Refresh the list
        emit(ChaletManagementState.loaded(
          chalets: _allChalets,
          filteredChalets: _allChalets,
        ));
      },
    );
  }

  Future<void> _onDeleteChalet(
    DeleteChalet event,
    Emitter<ChaletManagementState> emit,
  ) async {
    emit(const ChaletManagementState.deleting());
    
    final result = await _deleteChalet(event.id);
    
    result.fold(
      (failure) => emit(ChaletManagementState.error(failure.message)),
      (_) {
        _allChalets.removeWhere((c) => c.id == event.id);
        emit(ChaletManagementState.deleted(event.id));
        // Refresh the list
        emit(ChaletManagementState.loaded(
          chalets: _allChalets,
          filteredChalets: _allChalets,
        ));
      },
    );
  }

  Future<void> _onSortChalets(
    SortChalets event,
    Emitter<ChaletManagementState> emit,
  ) async {
    final currentState = state;
    if (currentState is Loaded) {
      final sortedChalets = List<Chalet>.from(currentState.filteredChalets);
      
      switch (event.sortBy) {
        case ChaletSortBy.newest:
          sortedChalets.sort((a, b) => b.createdAt.compareTo(a.createdAt));
          break;
        case ChaletSortBy.oldest:
          sortedChalets.sort((a, b) => a.createdAt.compareTo(b.createdAt));
          break;
        case ChaletSortBy.priceAsc:
          sortedChalets.sort((a, b) => a.pricePerNight.compareTo(b.pricePerNight));
          break;
        case ChaletSortBy.priceDesc:
          sortedChalets.sort((a, b) => b.pricePerNight.compareTo(a.pricePerNight));
          break;
        case ChaletSortBy.nameAsc:
          sortedChalets.sort((a, b) => a.name.compareTo(b.name));
          break;
        case ChaletSortBy.nameDesc:
          sortedChalets.sort((a, b) => b.name.compareTo(a.name));
          break;
      }
      
      emit(currentState.copyWith(
        filteredChalets: sortedChalets,
        sortBy: event.sortBy,
      ));
    }
  }

  Future<void> _onSearchChalets(
    SearchChalets event,
    Emitter<ChaletManagementState> emit,
  ) async {
    final currentState = state;
    if (currentState is Loaded) {
      final query = event.query.toLowerCase();
      final filteredChalets = query.isEmpty
          ? _allChalets
          : _allChalets.where((chalet) =>
              chalet.name.toLowerCase().contains(query) ||
              chalet.location.toLowerCase().contains(query) ||
              chalet.unitNumber.toLowerCase().contains(query)).toList();
      
      emit(currentState.copyWith(
        filteredChalets: filteredChalets,
        searchQuery: event.query,
      ));
    }
  }
}
