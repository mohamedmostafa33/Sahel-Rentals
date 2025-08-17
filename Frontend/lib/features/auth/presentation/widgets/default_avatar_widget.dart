import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';

class DefaultAvatarWidget extends StatelessWidget {
  final User user;
  final double size;

  const DefaultAvatarWidget({super.key, required this.user, this.size = 120});

  @override
  Widget build(BuildContext context) {
    final initials = _getInitials(user.fullName);
    final gradientColors = _getGradientColors(user);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(size / 2),
        boxShadow: [
          BoxShadow(
            color: gradientColors.first.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: Text(
          initials,
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.4,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  String _getInitials(String fullName) {
    if (fullName.isEmpty) return 'م';

    final words = fullName.trim().split(' ');
    if (words.length == 1) {
      return words.first.substring(0, 1).toUpperCase();
    }

    return (words.first.substring(0, 1) + words.last.substring(0, 1))
        .toUpperCase();
  }

  List<Color> _getGradientColors(User user) {
    // Generate colors based on user properties for consistency
    final hash = user.email.hashCode + user.fullName.hashCode;
    final colorIndex = hash.abs() % _gradientOptions.length;
    return _gradientOptions[colorIndex];
  }

  static const List<List<Color>> _gradientOptions = [
    // Blue gradient
    [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
    // Purple gradient
    [Color(0xFF7C3AED), Color(0xFFA855F7)],
    // Green gradient
    [Color(0xFF059669), Color(0xFF10B981)],
    // Orange gradient
    [Color(0xFFEA580C), Color(0xFFF97316)],
    // Pink gradient
    [Color(0xFFDB2777), Color(0xFFEC4899)],
    // Teal gradient
    [Color(0xFF0D9488), Color(0xFF14B8A6)],
    // Indigo gradient
    [Color(0xFF4338CA), Color(0xFF6366F1)],
    // Red gradient
    [Color(0xFFDC2626), Color(0xFFEF4444)],
    // Yellow gradient
    [Color(0xFFD97706), Color(0xFFF59E0B)],
    // Cyan gradient
    [Color(0xFF0891B2), Color(0xFF06B6D4)],
  ];
}
