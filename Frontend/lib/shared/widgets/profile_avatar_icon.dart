import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../features/auth/presentation/bloc/profile_bloc.dart';
import '../../features/auth/presentation/bloc/profile_image_bloc.dart';
import '../../features/auth/data/models/auth_models.dart';

class ProfileAvatarIcon extends StatelessWidget {
  final double size;
  final VoidCallback? onTap;

  const ProfileAvatarIcon({
    super.key,
    this.size = 32,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        UserModel? user;
        
        if (profileState is ProfileLoaded) {
          user = profileState.user;
        } else if (profileState is ProfileUpdated) {
          user = profileState.user;
        }

        return BlocBuilder<ProfileImageBloc, ProfileImageState>(
          builder: (context, imageState) {
            return GestureDetector(
              onTap: onTap,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: _buildAvatarContent(user, imageState),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildAvatarContent(UserModel? user, ProfileImageState imageState) {
    // استخدام الصورة من الـ user مباشرة (أكثر استقراراً)
    String? imageUrl = user?.profileImageUrl;
    
    // تحديث الصورة فقط في حالات محددة
    if (imageState is ProfileImageUploadSuccess) {
      imageUrl = imageState.imageUrl;
    } else if (imageState is ProfileImageDeleteSuccess) {
      imageUrl = null;
    }

    // إذا كان فيه صورة، اعرضها مباشرة بدون انتظار
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
        placeholder: (context, url) => _buildDefaultAvatar(user), // استخدام الصورة الافتراضية كـ placeholder
        errorWidget: (context, url, error) => _buildDefaultAvatar(user),
        memCacheWidth: 100, // تحسين الذاكرة
        memCacheHeight: 100,
        fadeInDuration: Duration(milliseconds: 100), // تسريع الانتقال
      );
    }

    // إذا مافيش صورة، اعرض الحرف الأول
    return _buildDefaultAvatar(user);
  }

  Widget _buildDefaultAvatar(UserModel? user) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1E3A8A), // Blue 900
            const Color(0xFF3B82F6), // Blue 500
          ],
        ),
      ),
      child: Center(
        child: Text(
          user?.fullName.isNotEmpty == true 
            ? user!.fullName[0].toUpperCase() 
            : '؟',
          style: TextStyle(
            fontSize: size * 0.5,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
