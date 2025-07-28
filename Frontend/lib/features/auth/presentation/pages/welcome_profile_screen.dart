import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../widgets/profile_image_widget.dart';
import '../bloc/profile_image_bloc.dart';
import '../bloc/profile_bloc.dart';
import '../../data/models/auth_models.dart';
import '../../../../core/constants/app_constants.dart';
import '../widgets/default_avatar_widget.dart';

class WelcomeProfileScreen extends StatefulWidget {
  final UserModel user;

  const WelcomeProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<WelcomeProfileScreen> createState() => _WelcomeProfileScreenState();
}

class _WelcomeProfileScreenState extends State<WelcomeProfileScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  
  // إضافة متغير للمستخدم المحديث
  late UserModel currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = widget.user; // تهيئة المستخدم الحالي
    _setupAnimations();
    _startAnimations();
  }

  void _setupAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutBack,
    ));
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 300), () {
      _fadeController.forward();
    });
    
    Future.delayed(const Duration(milliseconds: 500), () {
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: BlocListener<ProfileImageBloc, ProfileImageState>(
        listener: (context, state) {
          if (state is ProfileImageUploadSuccess) {
            // تحديث بيانات المستخدم بعد رفع الصورة بنجاح
            setState(() {
              currentUser = currentUser.copyWith(
                profileImageUrl: state.imageUrl,
              );
            });
            
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
              ),
            );
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Header with skip button
                _buildHeader(context),
                
                // Main content
                Expanded(
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Welcome text
                          _buildWelcomeText(),
                          
                          const SizedBox(height: 40),
                          
                          // Profile image section
                          _buildProfileImageSection(),
                          
                          const SizedBox(height: 40),
                          
                          // Description
                          _buildDescription(),
                          
                          const SizedBox(height: 60),
                          
                          // Action buttons
                          _buildActionButtons(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 60), // For balance
        const Text(
          'إعداد الملف الشخصي',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        TextButton(
          onPressed: () => _navigateToHome(context),
          child: const Text(
            'تخطي',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF64748B),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '👋',
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(width: 8),
            Text(
              'مرحباً ${widget.user.fullName}!',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'أكمل ملفك الشخصي لتجربة أفضل',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImageSection() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF2196F3).withOpacity(0.1),
            const Color(0xFF21CBF3).withOpacity(0.1),
          ],
        ),
      ),
      child: ProfileImageWidget(
        user: currentUser, // استخدام البيانات المحدثة بدلاً من widget.user
        size: 160,
        showEditButton: true,
        onImageChanged: () {
          // يمكن إضافة أي منطق إضافي هنا إذا لزم الأمر
          print('✅ Image changed in Welcome screen');
        },
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(
            Icons.camera_alt,
            size: 32,
            color: Color(0xFF2196F3),
          ),
          const SizedBox(height: 12),
          const Text(
            'أضف صورتك الشخصية',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'ساعد الآخرين على التعرف عليك بإضافة صورة شخصية.\nيمكنك إضافتها لاحقاً من صفحة الملف الشخصي.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        // Continue button
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () => _navigateToHome(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2196F3),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'متابعة إلى التطبيق',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, size: 20),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Skip link
        TextButton(
          onPressed: () => _navigateToHome(context),
          child: const Text(
            'سأقوم بإضافة الصورة لاحقاً',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  void _navigateToHome(BuildContext context) {
    // Add smooth transition animation
    Future.delayed(const Duration(milliseconds: 200), () {
      context.go('/chalets');
    });
  }
}
