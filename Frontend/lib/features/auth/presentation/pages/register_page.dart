import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/routes/routes_config.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/language/app_localizations.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/app/app_auth_bloc.dart';

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
  String _selectedUserType = 'renter'; 

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
    final localizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF1565C0), 
        title: Text(localizations.register),
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
      body: BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
    if (state is RegisterSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: Colors.green,
        ),
      );
      // Trigger app auth state update after successful registration
      context.read<AppAuthBloc>().add(CheckAuthStatus());
      context.go(RoutesConfig.welcomeProfile, extra: state.user);
    } else if (state is AuthSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: Colors.green,
        ),
      );
      // Trigger app auth state update after successful login
      context.read<AppAuthBloc>().add(CheckAuthStatus());
      context.go(RoutesConfig.home);
    } else if (state is AuthFailure) {
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
              mainAxisAlignment: MainAxisAlignment.center, 
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppConstants.largePadding * 2),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      localizations.selectSuitableType,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 16,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                        Expanded(
                          flex: 1, 
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedUserType = 'renter';
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: _selectedUserType == 'renter'
                                    ? const Color(0xFF3B82F6).withOpacity(0.08)
                                    : Theme.of(context).colorScheme.surface,
                                border: Border.all(
                                  color: _selectedUserType == 'renter'
                                      ? const Color(0xFF3B82F6)
                                      : Theme.of(context).colorScheme.outline.withOpacity(0.2),
                                  width: _selectedUserType == 'renter' ? 2 : 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: _selectedUserType == 'renter'
                                            ? const Color(0xFF3B82F6)
                                            : Theme.of(context).colorScheme.outline.withOpacity(0.5),
                                        width: 2,
                                      ),
                                      color: _selectedUserType == 'renter'
                                          ? const Color(0xFF3B82F6)
                                          : Colors.transparent,
                                    ),
                                    child: _selectedUserType == 'renter'
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 12,
                                          )
                                        : null,
                                  ),
                                  const SizedBox(height: 12),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: _selectedUserType == 'renter'
                                          ? const Color(0xFF3B82F6).withOpacity(0.15)
                                          : Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Icon(
                                      Icons.person_rounded,
                                      size: 28,
                                      color: _selectedUserType == 'renter'
                                          ? const Color(0xFF3B82F6)
                                          : Theme.of(context).colorScheme.primary.withOpacity(0.7),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    localizations.tenant,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: _selectedUserType == 'renter'
                                          ? const Color(0xFF3B82F6)
                                          : Theme.of(context).colorScheme.onSurface,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    localizations.lookingForChalets,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
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
                          flex: 1, 
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedUserType = 'owner';
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: _selectedUserType == 'owner'
                                    ? const Color(0xFF3B82F6).withOpacity(0.08)
                                    : Theme.of(context).colorScheme.surface,
                                border: Border.all(
                                  color: _selectedUserType == 'owner'
                                      ? const Color(0xFF3B82F6)
                                      : Theme.of(context).colorScheme.outline.withOpacity(0.2),
                                  width: _selectedUserType == 'owner' ? 2 : 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: _selectedUserType == 'owner'
                                            ? const Color(0xFF3B82F6)
                                            : Theme.of(context).colorScheme.outline.withOpacity(0.5),
                                        width: 2,
                                      ),
                                      color: _selectedUserType == 'owner'
                                          ? const Color(0xFF3B82F6)
                                          : Colors.transparent,
                                    ),
                                    child: _selectedUserType == 'owner'
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 12,
                                          )
                                        : null,
                                  ),
                                  const SizedBox(height: 12),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: _selectedUserType == 'owner'
                                          ? const Color(0xFF3B82F6).withOpacity(0.15)
                                          : Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Icon(
                                      Icons.villa_rounded,
                                      size: 28,
                                      color: _selectedUserType == 'owner'
                                          ? const Color(0xFF3B82F6)
                                          : Theme.of(context).colorScheme.primary.withOpacity(0.7),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    localizations.owner,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: _selectedUserType == 'owner'
                                          ? const Color(0xFF3B82F6)
                                          : Theme.of(context).colorScheme.onSurface,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    localizations.ownChaletsAndRent,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
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
                TextFormField(
                  controller: _firstNameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: localizations.firstName,
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                  validator: (value) => Validators.validateName(value, localizations.firstName),
                ),
                const SizedBox(height: AppConstants.defaultPadding),
                TextFormField(
                  controller: _lastNameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: localizations.lastName,
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                  validator: (value) => Validators.validateName(value, localizations.lastName),
                ),
                const SizedBox(height: AppConstants.defaultPadding),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    labelText: localizations.email,
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                  validator: Validators.validateEmail,
                ),
                const SizedBox(height: AppConstants.defaultPadding),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    labelText: localizations.phone,
                    prefixIcon: const Icon(Icons.phone_outlined),
                  ),
                  validator: Validators.validatePhone,
                ),
                const SizedBox(height: AppConstants.defaultPadding),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    labelText: localizations.password,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
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
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    labelText: localizations.confirmPassword,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
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
                        : Text(
                            localizations.register,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: AppConstants.defaultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(localizations.alreadyHaveAccount),
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(localizations.login),
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
