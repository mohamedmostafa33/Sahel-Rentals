import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/favorite_model.dart';

class FavoritesRemoteDataSource {
  final Dio dio;
  FavoritesRemoteDataSource(this.dio);

  Future<List<FavoriteModel>> getFavorites({int page = 1}) async {
    final response = await dio.get(
      ApiConstants.favorites,
      queryParameters: {'page': page},
    );

    if (response.data is Map<String, dynamic> &&
        response.data['results'] is List) {
      final List results = response.data['results'];
      return results
          .map((e) => FavoriteModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    // Fallback for non-paginated list
    if (response.data is List) {
      final List data = response.data as List;
      return data
          .map((e) => FavoriteModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [];
  }

  Future<FavoriteModel> addFavorite(int chaletId) async {
    final response = await dio.post(
      ApiConstants.favorites,
      data: {'chalet_id': chaletId},
    );
    return FavoriteModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> removeFavoriteByChaletId(int chaletId) async {
    int page = 1;
    while (true) {
      final response = await dio.get(
        ApiConstants.favorites,
        queryParameters: {'page': page},
      );

      if (response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        final results = (data['results'] as List?) ?? [];
        for (final item in results) {
          final fav = FavoriteModel.fromJson(item as Map<String, dynamic>);
          if (fav.chalet.id == chaletId) {
            await dio.delete('${ApiConstants.favorites}${fav.id}/');
            return;
          }
        }
        final next = data['next'];
        if (next == null) break;
        page += 1;
      } else if (response.data is List) {
        final List data = response.data as List;
        for (final item in data) {
          final fav = FavoriteModel.fromJson(item as Map<String, dynamic>);
          if (fav.chalet.id == chaletId) {
            await dio.delete('${ApiConstants.favorites}${fav.id}/');
            return;
          }
        }
        break;
      } else {
        break;
      }
    }
  }
}
