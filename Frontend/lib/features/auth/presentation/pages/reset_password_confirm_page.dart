import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/language/app_localizations.dart';
import '../../../../core/utils/validators.dart';
import '../bloc/auth/reset_password_bloc.dart';

class ResetPasswordConfirmPage extends StatefulWidget {
  final String email;
  
  const ResetPasswordConfirmPage({
    super.key,
    required this.email,
  });

  @override
  State<ResetPasswordConfirmPage> createState() => _ResetPasswordConfirmPageState();
}

class _ResetPasswordConfirmPageState extends State<ResetPasswordConfirmPage> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _otpController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      print('🔄 Resetting password for: ${widget.email}');
      print('🔐 OTP: ${_otpController.text}');
      
      context.read<ResetPasswordBloc>().add(
        ConfirmPasswordResetEvent(
          email: widget.email,
          otp: _otpController.text.trim(),
          newPassword: _newPasswordController.text,
          confirmPassword: _confirmPasswordController.text,
        ),
      );
    }
  }

  void _resendOtp() {
    print('🔄 Resending OTP to: ${widget.email}');
    
    context.read<ResetPasswordBloc>().add(
      RequestPasswordResetEvent(
        email: widget.email,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF1565C0), 
        title: Text(localizations.resetPasswordTitle),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1E88E5),
                Color(0xFF1565C0),
              ],
            ),
          ),
        ),
      ),
      body: BlocListener<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم تغيير كلمة المرور بنجاح!'),
                backgroundColor: Colors.green,
              ),
            );
            context.go('/login');
          } else if (state is ResetPasswordOtpSent) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(localizations.verificationCodeSentAgain),
                backgroundColor: Colors.blue,
              ),
            );
          } else if (state is ResetPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
          builder: (context, state) {
            final isLoading = state is ResetPasswordLoading;

            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: AppConstants.largePadding),
                      
                      Container(
                        alignment: Alignment.center,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3B82F6).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.security_rounded,
                            size: 50,
                            color: Color(0xFF3B82F6),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: AppConstants.largePadding),
                      
                      Text(
                        localizations.resetPasswordTitle,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      const SizedBox(height: AppConstants.smallPadding),
                      
                      Text(
                        '${localizations.verificationCodeSent} ${widget.email}',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      const SizedBox(height: AppConstants.largePadding * 2),
                      
                      TextFormField(
                        controller: _otpController,
                        keyboardType: TextInputType.number,
                        textDirection: TextDirection.ltr,
                        enabled: !isLoading,
                        maxLength: 6,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          labelText: localizations.otpCode,
                          prefixIcon: Icon(Icons.pin_outlined),
                          hintText: '123456',
                          counterText: '',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return localizations.enterVerificationCode;
                          }
                          if (value.length != 6) {
                            return localizations.verificationCodeMustBe6Digits;
                          }
                          return null;
                        },
                      ),
                      
                      const SizedBox(height: AppConstants.smallPadding),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(localizations.didntReceiveCode),
                          TextButton(
                            onPressed: isLoading ? null : _resendOtp,
                            child: Text(localizations.resendCode),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: AppConstants.defaultPadding),
                      
                      TextFormField(
                        controller: _newPasswordController,
                        obscureText: !_isNewPasswordVisible,
                        textDirection: TextDirection.ltr,
                        enabled: !isLoading,
                        decoration: InputDecoration(
                          labelText: localizations.newPassword,
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isNewPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _isNewPasswordVisible = !_isNewPasswordVisible;
                              });
                            },
                          ),
                        ),
                        validator: Validators.validatePassword,
                      ),
                      
                      const SizedBox(height: AppConstants.defaultPadding),
                      
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: !_isConfirmPasswordVisible,
                        textDirection: TextDirection.ltr,
                        enabled: !isLoading,
                        decoration: InputDecoration(
                          labelText: localizations.confirmPassword,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return localizations.confirmPasswordRequired;
                          }
                          if (value != _newPasswordController.text) {
                            return localizations.passwordsNotMatch;
                          }
                          return null;
                        },
                      ),
                      
                      const SizedBox(height: AppConstants.largePadding),
                      
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
                                    const Color(0xFF3B82F6),
                                    const Color(0xFF60A5FA),
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
                          onPressed: isLoading ? null : _resetPassword,
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
                              : Text(
                                  localizations.resetPasswordButton,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      
                      const SizedBox(height: AppConstants.largePadding),
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
