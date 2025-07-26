import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../config/routes_config.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/validators.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  // Load saved credentials if remember me was enabled
  Future<void> _loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final rememberMe = prefs.getBool('remember_me') ?? false;
    
    if (mounted) {
      if (rememberMe) {
        final email = prefs.getString('saved_email') ?? '';
        final password = prefs.getString('saved_password') ?? '';
        
        setState(() {
          _emailController.text = email;
          _passwordController.text = password;
          _rememberMe = true;
        });
        print('📋 Loaded saved credentials: $email, RememberMe: true');
      } else {
        setState(() {
          _rememberMe = false;
        });
        print('📋 RememberMe is disabled');
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      // Save credentials if remember me is enabled
      final prefs = await SharedPreferences.getInstance();
      if (_rememberMe) {
        await prefs.setBool('remember_me', true);
        await prefs.setString('saved_email', _emailController.text.trim());
        await prefs.setString('saved_password', _passwordController.text);
        print('💾 Saved credentials with RememberMe: true');
      } else {
        await prefs.setBool('remember_me', false);
        await prefs.remove('saved_email');
        await prefs.remove('saved_password');
        print('🗑️ Cleared saved credentials, RememberMe: false');
      }

      // Add logging to see what's being sent
      print('🚀 Starting login request...');
      print('📧 Email: ${_emailController.text.trim()}');
      print('🔒 Password: ${_passwordController.text.substring(0, 2)}***'); // Only show first 2 chars for security

      context.read<AuthBloc>().add(
        LoginEvent(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('مرحباً ${state.user.fullName}! تم تسجيل الدخول بنجاح'),
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
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                const Spacer(),
                
                // Logo and Title
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF1E3A8A),
                              Color(0xFF3B82F6),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(60),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 25,
                              offset: const Offset(0, 12),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(-3, -3),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.beach_access_rounded,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: AppConstants.defaultPadding),
                      Text(
                        'Sahel Rentals',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.5,
                          fontSize: 32,
                          color: const Color(0xFF1E3A8A),
                          fontFamily: 'Playfair Display',
                          shadows: [
                            Shadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppConstants.smallPadding),
                      Text(
                        'مرحباً بك مرة أخرى',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: AppConstants.largePadding * 2),
                
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
                
                const SizedBox(height: AppConstants.smallPadding),
                
                // Remember Me & Forgot Password Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Remember Me Checkbox
                    InkWell(
                      onTap: () {
                        setState(() {
                          _rememberMe = !_rememberMe;
                        });
                      },
                      borderRadius: BorderRadius.circular(6),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: _rememberMe ? const Color(0xFF3B82F6) : Colors.transparent,
                                border: Border.all(
                                  color: _rememberMe ? const Color(0xFF3B82F6) : Colors.grey.shade400,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: _rememberMe ? [
                                  BoxShadow(
                                    color: const Color(0xFF3B82F6).withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ] : null,
                              ),
                              child: _rememberMe
                                  ? const Icon(
                                      Icons.check,
                                      size: 12,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              AppStrings.rememberMe,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF374151),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // Forgot Password
                    TextButton(
                      onPressed: () {
                        context.push('/forgot-password');
                      },
                      child: const Text(AppStrings.forgotPassword),
                    ),
                  ],
                ),
                
                const SizedBox(height: AppConstants.largePadding),
                
                // Login Button - Enhanced Design
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
                    onPressed: isLoading ? null : _login,
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
                            AppStrings.login,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                
                const SizedBox(height: AppConstants.defaultPadding),
                
                // Register Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(AppStrings.dontHaveAccount),
                    TextButton(
                      onPressed: () {
                        context.push(RoutesConfig.register);
                      },
                      child: const Text(AppStrings.register),
                    ),
                  ],
                ),
                
                const Spacer(),
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
