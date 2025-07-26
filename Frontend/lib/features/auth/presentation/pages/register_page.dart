import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/routes_config.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/validators.dart';
import '../bloc/auth_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String _selectedUserType = 'renter'; // Default to renter

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      // Combine first and last name for full_name
      final fullName = '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}';
      
      context.read<AuthBloc>().add(
        RegisterEvent(
          email: _emailController.text.trim(),
          fullName: fullName,
          phone: _phoneController.text.trim(),
          userType: _selectedUserType,
          password1: _passwordController.text,
          password2: _confirmPasswordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.register),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
            // Navigate to home
            context.go(RoutesConfig.home);
          } else if (state is AuthFailure) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final isLoading = state is AuthLoading;
            
            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: AppConstants.defaultPadding),
                      
                      // Title
                      Text(
                        'إنشاء حساب جديد',
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppConstants.smallPadding),
                      Text(
                        'املأ البيانات التالية لإنشاء حساب',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      const SizedBox(height: AppConstants.largePadding * 2),
                      
                      // User Type Selection - Enhanced Design (moved to top)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'اختر نوع حسابك أولاً',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedUserType = 'renter';
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: _selectedUserType == 'renter'
                                          ? const Color(0xFF3B82F6).withOpacity(0.1)
                                          : Theme.of(context).colorScheme.surface,
                                      border: Border.all(
                                        color: _selectedUserType == 'renter'
                                            ? const Color(0xFF3B82F6)
                                            : Theme.of(context).colorScheme.outline.withOpacity(0.3),
                                        width: _selectedUserType == 'renter' ? 2 : 1,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: _selectedUserType == 'renter'
                                          ? [
                                              BoxShadow(
                                                color: const Color(0xFF3B82F6).withOpacity(0.2),
                                                blurRadius: 8,
                                                offset: const Offset(0, 4),
                                              ),
                                            ]
                                          : null,
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.search_rounded,
                                          size: 32,
                                          color: _selectedUserType == 'renter'
                                              ? const Color(0xFF3B82F6)
                                              : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          'مستأجر',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: _selectedUserType == 'renter'
                                                ? const Color(0xFF3B82F6)
                                                : Theme.of(context).colorScheme.onSurface,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'أبحث عن شاليهات\nللإيجار',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: _selectedUserType == 'renter'
                                                ? const Color(0xFF3B82F6).withOpacity(0.8)
                                                : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                                            height: 1.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedUserType = 'owner';
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: _selectedUserType == 'owner'
                                          ? const Color(0xFF3B82F6).withOpacity(0.1)
                                          : Theme.of(context).colorScheme.surface,
                                      border: Border.all(
                                        color: _selectedUserType == 'owner'
                                            ? const Color(0xFF3B82F6)
                                            : Theme.of(context).colorScheme.outline.withOpacity(0.3),
                                        width: _selectedUserType == 'owner' ? 2 : 1,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: _selectedUserType == 'owner'
                                          ? [
                                              BoxShadow(
                                                color: const Color(0xFF3B82F6).withOpacity(0.2),
                                                blurRadius: 8,
                                                offset: const Offset(0, 4),
                                              ),
                                            ]
                                          : null,
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.home_work_rounded,
                                          size: 32,
                                          color: _selectedUserType == 'owner'
                                              ? const Color(0xFF3B82F6)
                                              : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          'مالك',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: _selectedUserType == 'owner'
                                                ? const Color(0xFF3B82F6)
                                                : Theme.of(context).colorScheme.onSurface,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'أملك شاليهات\nللإيجار',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: _selectedUserType == 'owner'
                                                ? const Color(0xFF3B82F6).withOpacity(0.8)
                                                : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                                            height: 1.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: AppConstants.largePadding),
                      
                      // First Name Field
                      TextFormField(
                        controller: _firstNameController,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                          labelText: AppStrings.firstName,
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        validator: (value) => Validators.validateName(value, AppStrings.firstName),
                      ),
                      
                      const SizedBox(height: AppConstants.defaultPadding),
                      
                      // Last Name Field
                      TextFormField(
                        controller: _lastNameController,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                          labelText: AppStrings.lastName,
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        validator: (value) => Validators.validateName(value, AppStrings.lastName),
                      ),
                      
                      const SizedBox(height: AppConstants.defaultPadding),
                      
                      // Email Field
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textDirection: TextDirection.ltr,
                        decoration: const InputDecoration(
                          labelText: AppStrings.email,
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: Validators.validateEmail,
                      ),
                      
                      const SizedBox(height: AppConstants.defaultPadding),
                      
                      // Phone Field
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        textDirection: TextDirection.ltr,
                        decoration: const InputDecoration(
                          labelText: AppStrings.phone,
                          prefixIcon: Icon(Icons.phone_outlined),
                        ),
                        validator: Validators.validatePhone,
                      ),
                      
                      const SizedBox(height: AppConstants.defaultPadding),
                      
                      // Password Field
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        textDirection: TextDirection.ltr,
                        decoration: InputDecoration(
                          labelText: AppStrings.password,
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        validator: Validators.validatePassword,
                      ),
                      
                      const SizedBox(height: AppConstants.defaultPadding),
                      
                      // Confirm Password Field
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: !_isConfirmPasswordVisible,
                        textDirection: TextDirection.ltr,
                        decoration: InputDecoration(
                          labelText: AppStrings.confirmPassword,
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isConfirmPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) => Validators.validateConfirmPassword(
                          value,
                          _passwordController.text,
                        ),
                      ),
                      
                      const SizedBox(height: AppConstants.largePadding * 2),
                      
                      // Register Button - Enhanced Design
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: isLoading
                                ? [Colors.grey.shade400, Colors.grey.shade500]
                                : [
                                    const Color(0xFF3B82F6), // Lighter blue
                                    const Color(0xFF60A5FA), // Even lighter blue
                                  ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: isLoading
                              ? null
                              : [
                                  BoxShadow(
                                    color: const Color(0xFF3B82F6).withOpacity(0.3),
                                    blurRadius: 12,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                        ),
                        child: ElevatedButton(
                          onPressed: isLoading ? null : _register,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: isLoading
                              ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                )
                              : const Text(
                                  AppStrings.register,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      
                      const SizedBox(height: AppConstants.defaultPadding),
                      
                      // Login Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(AppStrings.alreadyHaveAccount),
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: const Text(AppStrings.login),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: AppConstants.defaultPadding),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
