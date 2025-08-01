import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/chalet_models.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_error_handler.dart';

part 'chalet_api_service.g.dart';

@RestApi()
abstract class ChaletApiService {
  factory ChaletApiService(Dio dio) = _ChaletApiService;

  // Get owner's chalets
  @GET('/api/chalets/list/')
  Future<List<ChaletModel>> getChalets();

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
}

class ChaletRepository {
  final ChaletApiService _apiService;

  ChaletRepository(this._apiService);

  // Get chalets with error handling
  Future<ApiResult<List<ChaletModel>>> getChalets() async {
    try {
      final chalets = await _apiService.getChalets();
      return ApiResult.success(chalets);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  // Create chalet with validation
  Future<ApiResult<ChaletModel>> createChalet(ChaletCreateRequest request) async {
    try {
      // Validate request
      final validationErrors = request.validate();
      if (validationErrors.isNotEmpty) {
        return ApiResult.failure(
          ApiErrorHandler.handle(
            Exception('Validation failed: ${validationErrors.join(', ')}')
          )
        );
      }

      final chalet = await _apiService.createChalet(request);
      return ApiResult.success(chalet);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  // Update chalet
  Future<ApiResult<ChaletModel>> updateChalet(
    int id, 
    ChaletUpdateRequest request
  ) async {
    try {
      final chalet = await _apiService.updateChalet(id, request);
      return ApiResult.success(chalet);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  // Delete chalet
  Future<ApiResult<void>> deleteChalet(int id) async {
    try {
      await _apiService.deleteChalet(id);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  // Upload images with compression and validation
  Future<ApiResult<ChaletImageUploadResponse>> uploadChaletImages(
    int chaletId,
    List<File> imageFiles, {
    Map<String, String>? captions,
  }) async {
    try {
      // Validate images
      if (imageFiles.isEmpty) {
        return ApiResult.failure(
          ApiErrorHandler.handle(Exception('No images selected'))
        );
      }

      if (imageFiles.length > 10) {
        return ApiResult.failure(
          ApiErrorHandler.handle(Exception('Maximum 10 images allowed'))
        );
      }

      // Convert files to multipart
      final multipartFiles = <MultipartFile>[];
      final formattedCaptions = <String, String>{};
      
      for (int i = 0; i < imageFiles.length; i++) {
        final file = imageFiles[i];
        
        // Validate file size (max 5MB per image)
        final fileSizeInMB = file.lengthSync() / (1024 * 1024);
        if (fileSizeInMB > 5) {
          return ApiResult.failure(
            ApiErrorHandler.handle(
              Exception('Image ${file.path.split('/').last} is too large. Maximum size is 5MB')
            )
          );
        }

        // Validate file type
        final extension = file.path.split('.').last.toLowerCase();
        if (!['jpg', 'jpeg', 'png', 'webp'].contains(extension)) {
          return ApiResult.failure(
            ApiErrorHandler.handle(
              Exception('Invalid image format. Supported: JPG, PNG, WebP')
            )
          );
        }

        multipartFiles.add(
          await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        );
        
        // Format captions as expected by backend (caption_0, caption_1, etc.)
        if (captions != null) {
          final fileName = file.path.split('/').last;
          final caption = captions[fileName];
          if (caption != null && caption.isNotEmpty) {
            formattedCaptions['caption_$i'] = caption;
          }
        }
      }

      final response = await _apiService.uploadChaletImages(
        chaletId,
        multipartFiles,
        formattedCaptions.isNotEmpty ? formattedCaptions : null,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  // Delete image
  Future<ApiResult<void>> deleteChaletImage(int chaletId, int imageId) async {
    try {
      await _apiService.deleteChaletImage(chaletId, imageId);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  // Update image (set as main, update caption)
  Future<ApiResult<ChaletImageModel>> updateChaletImage(
    int chaletId,
    int imageId, {
    bool? isMain,
    String? caption,
    int? order,
  }) async {
    try {
      final updateData = <String, dynamic>{};
      if (isMain != null) updateData['is_main'] = isMain;
      if (caption != null) updateData['caption'] = caption;
      if (order != null) updateData['order'] = order;

      final image = await _apiService.updateChaletImage(chaletId, imageId, updateData);
      return ApiResult.success(image);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
