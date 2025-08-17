import 'package:flutter/material.dart';
import 'dart:math' as math;

class DefaultAvatarWidget extends StatelessWidget {
  final String name;
  final double size;
  final double fontSize;
  final bool showBorder;
  final Color? borderColor;
  final double borderWidth;

  const DefaultAvatarWidget({
    super.key,
    required this.name,
    this.size = 80,
    this.fontSize = 32,
    this.showBorder = true,
    this.borderColor,
    this.borderWidth = 3,
  });

  @override
  Widget build(BuildContext context) {
    final firstLetter = _getFirstLetter(name);
    final colors = _getColorFromName(name);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        border:
            showBorder
                ? Border.all(
                  color: borderColor ?? Colors.white,
                  width: borderWidth,
                )
                : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          firstLetter,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  /// Extract first letter from name
  String _getFirstLetter(String name) {
    if (name.isEmpty) return '؟';

    final trimmedName = name.trim();
    if (trimmedName.isEmpty) return '؟';

    return trimmedName[0].toUpperCase();
  }

  /// Generate gradient colors based on name
  List<Color> _getColorFromName(String name) {
    final hash = name.hashCode;
    final random = math.Random(hash);

    // Predefined beautiful gradient combinations
    final gradients = [
      [const Color(0xFF667eea), const Color(0xFF764ba2)], // Purple-Blue
      [const Color(0xFFf093fb), const Color(0xFFf5576c)], // Pink-Red
      [const Color(0xFF4facfe), const Color(0xFF00f2fe)], // Blue-Cyan
      [const Color(0xFF43e97b), const Color(0xFF38f9d7)], // Green-Turquoise
      [const Color(0xFFfa709a), const Color(0xFFfee140)], // Pink-Yellow
      [const Color(0xFF30cfd0), const Color(0xFF91a7ff)], // Cyan-Blue
      [const Color(0xFFa8edea), const Color(0xFFfed6e3)], // Mint-Pink
      [const Color(0xFFff9a9e), const Color(0xFFfecfef)], // Coral-Pink
      [const Color(0xFF96fbc4), const Color(0xFFf9f586)], // Green-Yellow
      [const Color(0xFF89f7fe), const Color(0xFF66a6ff)], // Light Blue
      [const Color(0xFFfbc2eb), const Color(0xFFa6c1ee)], // Pink-Purple
      [const Color(0xFF85FFBD), const Color(0xFFfffb7d)], // Green-Yellow
    ];

    final selectedGradient = gradients[random.nextInt(gradients.length)];
    return selectedGradient;
  }
}
