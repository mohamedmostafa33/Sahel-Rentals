import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/image_picker_service.dart'
    show ImagePickerService, ImageSource;
import '../../domain/entities/user.dart';
import 'package:flutter_sahel/features/auth/presentation/bloc/profile/profile_image_bloc.dart';

class ProfileImageWidget extends StatelessWidget {
  final User user;
  final double size;
  final bool showEditButton;
  final VoidCallback? onImageChanged;

  const ProfileImageWidget({
    super.key,
    required this.user,
    this.size = 120,
    this.showEditButton = true,
    this.onImageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileImageBloc, ProfileImageState>(
      builder: (context, state) {
        return Stack(
          children: [
            // Main Profile Image Container
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size / 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 25,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(size / 2),
                child: _buildImageContent(context, state),
              ),
            ),

            // Edit Button
            if (showEditButton)
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => _showImageOptions(context),
                  child: Container(
                    width: size * 0.25,
                    height: size * 0.25,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(size * 0.125),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.surface,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: size * 0.12,
                    ),
                  ),
                ),
              ),

            // Upload Progress Indicator
            if (state is ProfileImageUploading)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(size / 2),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(
                          value: state.progress,
                          backgroundColor: Colors.white.withOpacity(0.3),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${(state.progress * 100).toInt()}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildImageContent(BuildContext context, ProfileImageState state) {
    // استخدام URL من الـ state أولاً، ثم من user
    String? imageUrl = user.profileImage;

    // إذا كان هناك صورة جديدة مرفوعة في الـ state، استخدمها فوراً
    if (state is ProfileImageUploadSuccess) {
      imageUrl = state.imageUrl;
    } else if (state is ProfileImageDeleted ||
        state is ProfileImageDeleteSuccess ||
        state is ProfileImageInitial) {
      imageUrl = null; // أزل الصورة فوراً بعد الحذف أو عند إعادة التعيين
    }

    if (imageUrl != null && imageUrl.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
        // Force cache refresh when state is reset
        key:
            state is ProfileImageInitial
                ? ValueKey('reset_${DateTime.now().millisecondsSinceEpoch}')
                : ValueKey(imageUrl),
        placeholder: (context, url) => _buildDefaultAvatar(context),
        errorWidget: (context, url, error) => _buildDefaultAvatar(context),
      );
    }

    return _buildDefaultAvatar(context);
  }

  Widget _buildDefaultAvatar(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          user.fullName.isNotEmpty ? user.fullName[0].toUpperCase() : '?',
          style: TextStyle(
            fontSize: size * 0.4,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _showImageOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder:
          (context) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Handle bar
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: AppConstants.defaultPadding),

                // Title
                Text(
                  'صورة البروفايل',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AppConstants.defaultPadding),

                // Options
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Camera Option
                    _buildOptionButton(
                      context: context,
                      icon: Icons.camera_alt,
                      label: 'كاميرا',
                      onTap: () async {
                        // احفظ reference للـ context قبل إغلاق الـ modal
                        final parentContext = context;
                        Navigator.pop(context);

                        // انتظر قليلاً لضمان انتهاء إغلاق الـ modal
                        await Future.delayed(const Duration(milliseconds: 100));
                        _pickImage(parentContext, ImageSource.camera);
                      },
                    ),

                    // Gallery Option
                    _buildOptionButton(
                      context: context,
                      icon: Icons.photo_library,
                      label: 'المعرض',
                      onTap: () async {
                        // احفظ reference للـ context قبل إغلاق الـ modal
                        final parentContext = context;
                        Navigator.pop(context);

                        // انتظر قليلاً لضمان انتهاء إغلاق الـ modal
                        await Future.delayed(const Duration(milliseconds: 100));
                        _pickImage(parentContext, ImageSource.gallery);
                      },
                    ),

                    // Delete Option (only if user has image)
                    if (user.profileImage != null &&
                        user.profileImage!.isNotEmpty)
                      _buildOptionButton(
                        context: context,
                        icon: Icons.delete,
                        label: 'حذف',
                        color: Colors.red,
                        onTap: () {
                          Navigator.pop(context);
                          _deleteImage(context);
                        },
                      ),
                  ],
                ),
                const SizedBox(height: AppConstants.defaultPadding),
              ],
            ),
          ),
    );
  }

  Widget _buildOptionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? color,
  }) {
    final optionColor = color ?? Theme.of(context).colorScheme.primary;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: optionColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: optionColor.withOpacity(0.3), width: 1),
            ),
            child: Icon(icon, color: optionColor, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: optionColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    try {
      print('🔍 Starting image selection from: ${source.name}');

      // احفظ reference للـ bloc قبل العملية async
      final profileImageBloc = context.read<ProfileImageBloc>();

      // تعطيل التقطيع مؤقتاً لتجنب مشاكل الواجهة
      final pickedFile = await ImagePickerService.pickAndCropImage(
        source: source,
        enableCrop: true, // تفعيل التقطيع
      );
      if (pickedFile != null) {
        print('✅ Image selected successfully, uploading...');

        // استخدم الـ bloc المحفوظ بدلاً من context.read()
        profileImageBloc.add(UploadProfileImageEvent(imageFile: pickedFile));
        onImageChanged?.call();
      } else {
        print('ℹ️ User cancelled image selection');
      }
    } catch (e, stackTrace) {
      print('❌ Image selection failed: $e');
      print('📍 Stack trace: $stackTrace');

      // تحقق من أن الـ context ما زال نشط قبل إظهار SnackBar
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطأ في اختيار الصورة: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }
  }

  void _deleteImage(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('حذف صورة البروفايل'),
            content: const Text('هل أنت متأكد من حذف صورة البروفايل؟'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('إلغاء'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<ProfileImageBloc>().add(
                    DeleteProfileImageEvent(),
                  );
                  onImageChanged?.call();
                },
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('حذف'),
              ),
            ],
          ),
    );
  }
}
