import 'package:flutter/material.dart';

class AppConstants {
  // App Info
  static const String appName = 'Sahel Rentals';
  static const String appVersion = '1.0.0';

  // Colors
  static const Color primaryColor = Color(0xFF2196F3);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color errorColor = Color(0xFFB00020);

  // Spacing
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;

  // Border Radius
  static const double defaultRadius = 8.0;
  static const double smallRadius = 4.0;
  static const double largeRadius = 16.0;

  // Text Sizes
  static const double headlineSize = 24.0;
  static const double titleSize = 20.0;
  static const double bodySize = 16.0;
  static const double captionSize = 12.0;

  // Animation Duration
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);

  // Validation
  static const int minPasswordLength = 8;
  static const int maxNameLength = 50;
}
