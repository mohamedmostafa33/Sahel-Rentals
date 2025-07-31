import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_constants.dart';
import '../../features/auth/presentation/bloc/profile_bloc.dart';
import '../../features/auth/data/models/auth_models.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تسجيل الخروج'),
        content: const Text('هل أنت متأكد من تسجيل الخروج؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close drawer
              context.read<ProfileBloc>().add(LogoutEvent());
            },
            child: const Text('تسجيل الخروج'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header with user info - Remove default padding
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              UserModel? user;
              if (state is ProfileLoaded) {
                user = state.user;
              }
              
              return Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 20, // Safe area + padding
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      AppConstants.primaryColor,
                      AppConstants.primaryColor.withOpacity(0.8),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Profile Image
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: user?.profileImageUrl != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: Image.network(
                                user!.profileImageUrl!,
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(
                                  Icons.person,
                                  size: 35,
                                  color: AppConstants.primaryColor,
                                ),
                              ),
                            )
                          : const Icon(
                              Icons.person,
                              size: 35,
                              color: AppConstants.primaryColor,
                            ),
                    ),
                    const SizedBox(height: 12),
                    // User name
                    Text(
                      user?.fullName ?? 'المستخدم',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    // User email
                    Text(
                      user?.email ?? '',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
          
          // Section 1: Navigation items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Navigation Section
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'التنقل',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.villa),
                  title: const Text('الشاليهات'),
                  onTap: () {
                    Navigator.pop(context);
                    context.go('/home');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.book_online),
                  title: const Text('حجوزاتي'),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: Navigate to bookings page
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('صفحة الحجوزات قيد التطوير')),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text('المفضلة'),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: Navigate to favorites page
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('صفحة المفضلة قيد التطوير')),
                    );
                  },
                ),
                
                const Divider(),
                
                // User Section
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'الحساب',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('الملف الشخصي'),
                  onTap: () {
                    Navigator.pop(context);
                    context.go('/profile');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('الإعدادات'),
                  onTap: () {
                    Navigator.pop(context);
                    context.go('/settings');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help_center),
                  title: const Text('مركز المساعدة'),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: Navigate to help center
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('مركز المساعدة قيد التطوير')),
                    );
                  },
                ),
              ],
            ),
          ),
          
          // Logout button at the bottom
          Container(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _logout(context),
                icon: const Icon(Icons.logout),
                label: const Text('تسجيل الخروج'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
