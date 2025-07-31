import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../auth/presentation/bloc/profile_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void _deleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف الحساب'),
        content: const Text(
          'هل أنت متأكد من حذف الحساب؟ هذا الإجراء لا يمكن التراجع عنه.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              context.read<ProfileBloc>().add(DeleteAccountEvent());
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('حذف الحساب'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileDeleted) {
            // Navigate to login after successful deletion
            context.go('/login');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is ProfileFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: ListView(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          children: [
            // App Settings Section
            const _SectionHeader(title: 'إعدادات التطبيق'),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('الإشعارات'),
                    subtitle: const Text('إدارة إشعارات التطبيق'),
                    trailing: Switch(
                      value: true, // TODO: Connect to actual setting
                      onChanged: (value) {
                        // TODO: Implement notification toggle
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('إعدادات الإشعارات قيد التطوير')),
                        );
                      },
                    ),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('اللغة'),
                    subtitle: const Text('العربية'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // TODO: Implement language selection
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('اختيار اللغة قيد التطوير')),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: const Text('المظهر'),
                    subtitle: const Text('فاتح / داكن'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // TODO: Implement theme selection
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('إعدادات المظهر قيد التطوير')),
                      );
                    },
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: AppConstants.largePadding),
            
            // Privacy Settings Section
            const _SectionHeader(title: 'الخصوصية والأمان'),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.privacy_tip),
                    title: const Text('سياسة الخصوصية'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // TODO: Navigate to privacy policy
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('سياسة الخصوصية قيد التطوير')),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.security),
                    title: const Text('الأمان'),
                    subtitle: const Text('كلمة المرور والمصادقة'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // TODO: Navigate to security settings
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('إعدادات الأمان قيد التطوير')),
                      );
                    },
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: AppConstants.largePadding),
            
            // Danger Zone Section
            const _SectionHeader(title: 'المنطقة الخطيرة'),
            Card(
              color: Colors.red.shade50,
              child: ListTile(
                leading: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
                title: const Text(
                  'حذف الحساب',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text(
                  'حذف الحساب نهائياً مع جميع البيانات',
                  style: TextStyle(color: Colors.red),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.red,
                ),
                onTap: () => _deleteAccount(context),
              ),
            ),
            
            const SizedBox(height: AppConstants.largePadding),
            
            // App Information Section
            const _SectionHeader(title: 'معلومات التطبيق'),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('حول التطبيق'),
                    subtitle: const Text('الإصدار 1.0.0'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // TODO: Show about dialog
                      showAboutDialog(
                        context: context,
                        applicationName: 'ساحل للايجارات',
                        applicationVersion: '1.0.0',
                        applicationLegalese: '© 2025 ساحل للايجارات. جميع الحقوق محفوظة.',
                        children: [
                          const Text('تطبيق لحجز الشاليهات والمنتجعات السياحية'),
                        ],
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.contact_support),
                    title: const Text('التواصل معنا'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // TODO: Navigate to contact page
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('صفحة التواصل قيد التطوير')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppConstants.smallPadding,
        top: AppConstants.smallPadding,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: AppConstants.primaryColor,
        ),
      ),
    );
  }
}
