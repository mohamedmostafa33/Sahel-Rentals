import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/chalet_models.dart';

part 'chalet_remote_data_source.g.dart';

@RestApi()
abstract class ChaletRemoteDataSource {
  factory ChaletRemoteDataSource(Dio dio) = _ChaletRemoteDataSource;

  // Get owner's chalets
  @GET('/api/chalets/list/')
  Future<List<ChaletModel>> getChalets();

  // Get single chalet
  @GET('/api/chalets/detail/{id}/')
  Future<ChaletModel> getChaletDetail(@Path('id') int id);

  // Create new chalet
  @POST('/api/chalets/add/')
  Future<ChaletModel> createChalet(@Body() ChaletCreateRequest request);

  // Update chalet
  @PUT('/api/chalets/update/{id}/')
  Future<ChaletModel> updateChalet(
    @Path('id') int id,
    @Body() ChaletUpdateRequest request,
  );

  // Delete chalet
  @DELETE('/api/chalets/delete/{id}/')
  Future<void> deleteChalet(@Path('id') int id);

  // Upload chalet images
  @POST('/api/chalets/{chaletId}/images/upload/')
  @MultiPart()
  Future<ChaletImageUploadResponse> uploadChaletImages(
    @Path('chaletId') int chaletId,
    @Part(name: 'images') List<MultipartFile> images,
    @Part() Map<String, String>? captions,
  );

  // Delete chalet image
  @DELETE('/api/chalets/{chaletId}/images/{imageId}/delete/')
  Future<void> deleteChaletImage(
    @Path('chaletId') int chaletId,
    @Path('imageId') int imageId,
  );

  // Update chalet image
  @PATCH('/api/chalets/{chaletId}/images/{imageId}/update/')
  Future<ChaletImageModel> updateChaletImage(
    @Path('chaletId') int chaletId,
    @Path('imageId') int imageId,
    @Body() Map<String, dynamic> updateData,
  );

  // Public browsing endpoints (no authentication required)
  @GET('/api/chalets/browse/')
  Future<PaginatedChaletResponse> getPublicChaletsPaginated({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Query('search') String? search,
  });

  @GET('/api/chalets/browse/{id}/')
  Future<PublicChaletModel> getPublicChaletDetail(@Path('id') int id);
}
