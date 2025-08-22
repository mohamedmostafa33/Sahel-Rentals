import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../chalets/domain/entities/public_chalet.dart';
import '../../domain/usecases/get_favorites.dart';
import '../../domain/usecases/add_favorite.dart';
import '../../domain/usecases/remove_favorite.dart';

abstract class FavoritesEvent {}
class LoadFavoritesEvent extends FavoritesEvent {}
class AddFavoriteEvent extends FavoritesEvent { final int chaletId; AddFavoriteEvent(this.chaletId); }
class RemoveFavoriteEvent extends FavoritesEvent { final int chaletId; RemoveFavoriteEvent(this.chaletId); }

abstract class FavoritesState {}
class FavoritesInitial extends FavoritesState {}
class FavoritesLoading extends FavoritesState {}
class FavoritesLoaded extends FavoritesState { final List<PublicChalet> chalets; FavoritesLoaded(this.chalets); }
class FavoritesError extends FavoritesState { final String message; FavoritesError(this.message); }

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavorites getFavorites;
  final AddFavorite addFavorite;
  final RemoveFavorite removeFavorite;

  FavoritesBloc({
    required this.getFavorites,
    required this.addFavorite,
    required this.removeFavorite,
  }) : super(FavoritesInitial()) {
    on<LoadFavoritesEvent>(_onLoad);
    on<AddFavoriteEvent>(_onAdd);
    on<RemoveFavoriteEvent>(_onRemove);
  }

  Future<void> _onLoad(LoadFavoritesEvent event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoading());
    final res = await getFavorites(1);
    res.fold(
      (f) {
        // If it's an auth error, just emit empty favorites instead of error
        if (f.message.contains('401') || f.message.toLowerCase().contains('unauthorized')) {
          emit(FavoritesLoaded([]));
        } else {
          emit(FavoritesError(f.message));
        }
      },
      (list) {
        final chalets = list.map((e) => e.chalet).toList();
        emit(FavoritesLoaded(chalets));
      },
    );
  }

  Future<void> _onAdd(AddFavoriteEvent event, Emitter<FavoritesState> emit) async {
    final current = state;
    final result = await addFavorite(AddFavoriteParams(event.chaletId));
    result.fold(
      (f) => emit(FavoritesError(f.message)),
      (fav) {
        if (current is FavoritesLoaded) {
          final updated = List<PublicChalet>.from(current.chalets);
          if (!updated.any((c) => c.id == fav.chalet.id)) {
            updated.insert(0, fav.chalet);
          }
          emit(FavoritesLoaded(updated));
        } else {
          add(LoadFavoritesEvent());
        }
      },
    );
  }

  Future<void> _onRemove(RemoveFavoriteEvent event, Emitter<FavoritesState> emit) async {
    final current = state;
    print('🗑️ Removing favorite: ${event.chaletId}');
    final result = await removeFavorite(RemoveFavoriteParams(event.chaletId));
    result.fold(
      (f) {
        print('❌ Remove failed: ${f.message}');
        emit(FavoritesError(f.message));
      },
      (_) {
        print('✅ Remove successful for chalet: ${event.chaletId}');
        if (current is FavoritesLoaded) {
          final updated = current.chalets.where((c) => c.id != event.chaletId).toList();
          print('📋 Updated favorites list: ${updated.map((c) => c.id).toList()}');
          emit(FavoritesLoaded(updated));
        } else {
          print('🔄 Reloading favorites after remove');
          add(LoadFavoritesEvent());
        }
      },
    );
  }
}
