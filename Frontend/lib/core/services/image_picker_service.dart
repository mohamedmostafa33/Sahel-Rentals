import 'dart:io';
import 'package:image_picker/image_picker.dart' as picker;
import 'package:permission_handler/permission_handler.dart';

enum ImageSource { camera, gallery }

class ImagePickerService {
  static final picker.ImagePicker _picker = picker.ImagePicker();

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

      final picker.XFile? image = await _picker.pickImage(
        source: picker.ImageSource.camera,
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
      print('🔍 Starting gallery picker...');
      
      final picker.XFile? image = await _picker.pickImage(
        source: picker.ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 1000,
        maxHeight: 1000,
      );

      if (image != null) {
        print('✅ Image picked from gallery: ${image.path}');
        return File(image.path);
      } else {
        print('ℹ️ No image selected from gallery');
        return null;
      }
    } catch (e, stackTrace) {
      print('❌ Gallery pick failed: $e');
      print('📍 Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// Complete flow: Pick image without crop
  static Future<File?> pickAndCropImage({
    required ImageSource source,
    bool enableCrop = false, // معطل الآن
  }) async {
    try {
      print('🔍 Starting image pick from: ${source.name}');
      File? pickedImage;
      
      if (source == ImageSource.camera) {
        pickedImage = await ImagePickerService.pickFromCamera();
      } else {
        pickedImage = await ImagePickerService.pickFromGallery();
      }

      if (pickedImage != null) {
        print('✅ Image picked successfully: ${pickedImage.path}');
        return pickedImage;
      } else {
        print('❌ No image was picked');
        return null;
      }
    } catch (e, stackTrace) {
      print('❌ Pick and crop failed: $e');
      print('📍 Stack trace: $stackTrace');
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
