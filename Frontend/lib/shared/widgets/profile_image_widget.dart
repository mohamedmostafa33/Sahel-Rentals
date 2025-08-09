import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart' as picker;
import '../../core/services/image_picker_service.dart';
import '../widgets/default_avatar_widget.dart';
import 'package:flutter_sahel/features/auth/presentation/bloc/profile/profile_image_bloc.dart';

class ProfileImageWidget extends StatelessWidget {
  final String userName;
  final String? imageUrl;
  final double size;
  final bool isEditable;
  final VoidCallback? onImageChanged;

  const ProfileImageWidget({
    Key? key,
    required this.userName,
    this.imageUrl,
    this.size = 120,
    this.isEditable = true,
    this.onImageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileImageBloc, ProfileImageState>(
      listener: (context, state) {
        if (state is ProfileImageUploadSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            ),
          );
          onImageChanged?.call();
        } else if (state is ProfileImageDeleted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.orange,
              behavior: SnackBarBehavior.floating,
            ),
          );
          onImageChanged?.call();
        } else if (state is ProfileImageFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            // Main image container
            _buildImageContainer(context, state),
            
            // Edit button (if editable)
            if (isEditable) _buildEditButton(context, state),
            
            // Loading overlay
            if (state is ProfileImageUploading) _buildLoadingOverlay(state),
          ],
        );
      },
    );
  }

  Widget _buildImageContainer(BuildContext context, ProfileImageState state) {
    // Show uploaded image URL from state if available
    String? displayImageUrl = imageUrl;
    if (state is ProfileImageUploadSuccess) {
      displayImageUrl = state.imageUrl;
    } else if (state is ProfileImageDeleted) {
      displayImageUrl = null;
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipOval(
        child: displayImageUrl != null && displayImageUrl.isNotEmpty
            ? _buildNetworkImage(displayImageUrl)
            : DefaultAvatarWidget(
                name: userName,
                size: size,
                fontSize: size * 0.4,
                showBorder: false,
              ),
      ),
    );
  }

  Widget _buildNetworkImage(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: size,
      height: size,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF5F5F5),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
          ),
        ),
      ),
      errorWidget: (context, url, error) => DefaultAvatarWidget(
        name: userName,
        size: size,
        fontSize: size * 0.4,
        showBorder: false,
      ),
    );
  }

  Widget _buildEditButton(BuildContext context, ProfileImageState state) {
    final isLoading = state is ProfileImageLoading || state is ProfileImageUploading;
    
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: isLoading ? null : () => _showImageOptions(context),
        child: Container(
          width: size * 0.3,
          height: size * 0.3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF2196F3),
            border: Border.all(
              color: Colors.white,
              width: 3,
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
            size: size * 0.15,
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingOverlay(ProfileImageUploading state) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.6),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: state.progress,
                strokeWidth: 3,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
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
    );
  }

  void _showImageOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => ImageOptionsBottomSheet(
        hasCurrentImage: imageUrl != null && imageUrl!.isNotEmpty,
        onCameraPressed: () => _pickImage(context, ImageSource.camera),
        onGalleryPressed: () => _pickImage(context, ImageSource.gallery),
        onDeletePressed: () => _deleteImage(context),
      ),
    );
  }

  void _pickImage(BuildContext context, ImageSource source) async {
    Navigator.pop(context); // Close bottom sheet
    
    try {
      final File? imageFile = await ImagePickerService.pickAndCropImage(source: source);
      
      if (imageFile != null) {
        // Validate image
        final validation = ImagePickerService.validateImageFile(imageFile);
        if (validation != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(validation),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
          return;
        }

        // Upload image
        context.read<ProfileImageBloc>().add(
          UploadProfileImageEvent(imageFile: imageFile),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطأ في اختيار الصورة: $e'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _deleteImage(BuildContext context) {
    Navigator.pop(context); // Close bottom sheet
    
    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('حذف الصورة'),
        content: const Text('هل تريد حذف صورة الملف الشخصي؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<ProfileImageBloc>().add(DeleteProfileImageEvent());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }
}

class ImageOptionsBottomSheet extends StatelessWidget {
  final bool hasCurrentImage;
  final VoidCallback onCameraPressed;
  final VoidCallback onGalleryPressed;
  final VoidCallback onDeletePressed;

  const ImageOptionsBottomSheet({
    Key? key,
    required this.hasCurrentImage,
    required this.onCameraPressed,
    required this.onGalleryPressed,
    required this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
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
          const SizedBox(height: 20),
          
          // Title
          const Text(
            'صورة الملف الشخصي',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          
          // Options
          _buildOption(
            icon: Icons.camera_alt,
            title: 'التقاط صورة',
            subtitle: 'استخدم الكاميرا لالتقاط صورة جديدة',
            onTap: onCameraPressed,
          ),
          const SizedBox(height: 10),
          
          _buildOption(
            icon: Icons.photo_library,
            title: 'اختيار من المعرض',
            subtitle: 'اختر صورة من معرض الصور',
            onTap: onGalleryPressed,
          ),
          
          if (hasCurrentImage) ...[
            const SizedBox(height: 10),
            _buildOption(
              icon: Icons.delete,
              title: 'حذف الصورة',
              subtitle: 'إزالة الصورة الحالية',
              onTap: onDeletePressed,
              isDestructive: true,
            ),
          ],
          
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDestructive 
              ? Colors.red.withOpacity(0.1)
              : const Color(0xFF2196F3).withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: isDestructive ? Colors.red : const Color(0xFF2196F3),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: isDestructive ? Colors.red : null,
        ),
      ),
      subtitle: Text(subtitle),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
