import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerService {
  static final ImagePicker _picker = ImagePicker();

  /// Pick image from camera with permission handling
  static Future<File?> pickFromCamera() async {
    try {
      // Request camera permission
      final permission = await Permission.camera.request();
      
      if (permission.isDenied) {
        throw 'تم رفض إذن الكاميرا';
      }
      
      if (permission.isPermanentlyDenied) {
        throw 'إذن الكاميرا مرفوض بشكل دائم. يرجى تفعيله من الإعدادات';
      }

      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        maxWidth: 1000,
        maxHeight: 1000,
      );

      if (image != null) {
        return File(image.path);
      }
      return null;
    } catch (e) {
      print('❌ Camera pick failed: $e');
      rethrow;
    }
  }

  /// Pick image from gallery with permission handling
  static Future<File?> pickFromGallery() async {
    try {
      // Request photos permission
      final permission = await Permission.photos.request();
      
      if (permission.isDenied) {
        throw 'تم رفض إذن الوصول للصور';
      }
      
      if (permission.isPermanentlyDenied) {
        throw 'إذن الوصول للصور مرفوض بشكل دائم. يرجى تفعيله من الإعدادات';
      }

      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 1000,
        maxHeight: 1000,
      );

      if (image != null) {
        return File(image.path);
      }
      return null;
    } catch (e) {
      print('❌ Gallery pick failed: $e');
      rethrow;
    }
  }

  /// Crop image to circular format
  static Future<File?> cropImage(File imageFile) async {
    try {
      final CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        cropStyle: CropStyle.circle,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 80,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'تعديل الصورة',
            toolbarColor: const Color(0xFF2196F3),
            toolbarWidgetColor: const Color(0xFFFFFFFF),
            activeControlsWidgetColor: const Color(0xFF2196F3),
            backgroundColor: const Color(0xFF000000),
            cropGridColor: const Color(0xFF2196F3),
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
            hideBottomControls: false,
            showCropGrid: true,
          ),
          IOSUiSettings(
            title: 'تعديل الصورة',
            doneButtonTitle: 'تم',
            cancelButtonTitle: 'إلغاء',
            aspectRatioLockEnabled: true,
            resetAspectRatioEnabled: false,
            aspectRatioPickerButtonHidden: true,
            rotateButtonsHidden: false,
            rotateClockwiseButtonHidden: false,
          ),
        ],
      );

      if (croppedFile != null) {
        return File(croppedFile.path);
      }
      return null;
    } catch (e) {
      print('❌ Image crop failed: $e');
      rethrow;
    }
  }

  /// Complete flow: Pick -> Crop -> Return
  static Future<File?> pickAndCropImage({required ImageSource source}) async {
    try {
      File? pickedImage;
      
      if (source == ImageSource.camera) {
        pickedImage = await pickFromCamera();
      } else {
        pickedImage = await pickFromGallery();
      }

      if (pickedImage != null) {
        return await cropImage(pickedImage);
      }
      return null;
    } catch (e) {
      print('❌ Pick and crop failed: $e');
      rethrow;
    }
  }

  /// Validate image file
  static String? validateImageFile(File imageFile) {
    try {
      // Check file size (max 5MB)
      final bytes = imageFile.lengthSync();
      final mb = bytes / (1024 * 1024);
      
      if (mb > 5) {
        return 'حجم الصورة يجب أن يكون أقل من 5 ميجابايت';
      }

      // Check file extension
      final extension = imageFile.path.split('.').last.toLowerCase();
      final allowedExtensions = ['jpg', 'jpeg', 'png'];
      
      if (!allowedExtensions.contains(extension)) {
        return 'نوع الملف غير مدعوم. يُسمح فقط بـ JPG و PNG';
      }

      return null; // Valid
    } catch (e) {
      return 'خطأ في فحص الملف';
    }
  }
}
