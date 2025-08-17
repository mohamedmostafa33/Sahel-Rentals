import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../config/routes/routes_config.dart';
import '../../core/language/app_localizations.dart';
import '../../features/auth/presentation/bloc/app/app_auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _progressController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _progressController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
      ),
    );

    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );

    _startAnimation();
    _navigateToNext();
  }

  void _startAnimation() {
    _animationController.forward();
    _progressController.forward();
  }

  void _navigateToNext() async {
    // Wait for animations to complete
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    // Check authentication status instead of directly navigating to login
    context.read<AppAuthBloc>().add(CheckAuthStatus());
  }

  @override
  void dispose() {
    _animationController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return BlocListener<AppAuthBloc, AppAuthState>(
      listener: (context, state) {
        if (state is AppAuthenticated) {
          // User is logged in, navigate to home
          context.go(RoutesConfig.home);
        } else if (state is AppUnauthenticated) {
          // User is not logged in, navigate to login
          context.go(RoutesConfig.login);
        }
        // Keep loading while in AppAuthLoading state
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1E3A8A), // Deep blue
                Color(0xFF3B82F6), // Blue
                Color(0xFF06B6D4), // Cyan
              ],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),

                  // Logo Container with Advanced Animation
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return FadeTransition(
                        opacity: _fadeAnimation,
                        child: ScaleTransition(
                          scale: _scaleAnimation,
                          child: Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.white, Color(0xFFF8FAFC)],
                              ),
                              borderRadius: BorderRadius.circular(70),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 30,
                                  offset: const Offset(0, 15),
                                  spreadRadius: 0,
                                ),
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(-5, -5),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.beach_access_rounded,
                              size: 70,
                              color: Color(0xFF1E3A8A),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 40),

                  // App Name with Slide Animation
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _slideAnimation.value),
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: const Text(
                            'Sahel Rentals',
                            style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 3.0,
                              fontFamily: 'Playfair Display',
                              shadows: [
                                Shadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 3),
                                  blurRadius: 8,
                                ),
                                Shadow(
                                  color: Colors.blue,
                                  offset: Offset(0, 0),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  // Subtitle with Delayed Animation
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _slideAnimation.value * 0.5),
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Text(
                            localizations.splashWelcomeMessage,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              letterSpacing: 0.5,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const Spacer(flex: 3),

                  // Custom Progress Indicator
                  AnimatedBuilder(
                    animation: _progressAnimation,
                    builder: (context, child) {
                      return Container(
                        width: 200,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 200 * _progressAnimation.value,
                            height: 4,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Colors.white, Color(0xFFE0F2FE)],
                              ),
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Loading Text
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      localizations.loading,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
