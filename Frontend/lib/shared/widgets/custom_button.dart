import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final ButtonSize size;
  final Widget? icon;
  final bool isLoading;
  final bool isFullWidth;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  });

  const CustomButton.primary({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : type = ButtonType.primary;

  const CustomButton.secondary({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : type = ButtonType.secondary;

  const CustomButton.outline({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : type = ButtonType.outline;

  const CustomButton.text({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : type = ButtonType.text;

  const CustomButton.danger({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : type = ButtonType.danger;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: _getHeight(),
      child: _buildButton(context),
    );
  }

  Widget _buildButton(BuildContext context) {
    switch (type) {
      case ButtonType.primary:
        return _buildElevatedButton(
          backgroundColor: const Color(0xFF2196F3),
          foregroundColor: Colors.white,
          elevation: 2,
        );
      case ButtonType.secondary:
        return _buildElevatedButton(
          backgroundColor: const Color(0xFF64748B),
          foregroundColor: Colors.white,
          elevation: 1,
        );
      case ButtonType.outline:
        return _buildOutlinedButton();
      case ButtonType.text:
        return _buildTextButton();
      case ButtonType.danger:
        return _buildElevatedButton(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          elevation: 2,
        );
    }
  }

  Widget _buildElevatedButton({
    required Color backgroundColor,
    required Color foregroundColor,
    required double elevation,
  }) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: elevation,
        shadowColor: backgroundColor.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        ),
        padding: _getPadding(),
        textStyle: _getTextStyle(),
      ),
      child: _buildButtonChild(foregroundColor),
    );
  }

  Widget _buildOutlinedButton() {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF2196F3),
        side: const BorderSide(color: Color(0xFF2196F3), width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        ),
        padding: _getPadding(),
        textStyle: _getTextStyle(),
      ),
      child: _buildButtonChild(const Color(0xFF2196F3)),
    );
  }

  Widget _buildTextButton() {
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF2196F3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        ),
        padding: _getPadding(),
        textStyle: _getTextStyle(),
      ),
      child: _buildButtonChild(const Color(0xFF2196F3)),
    );
  }

  Widget _buildButtonChild(Color textColor) {
    if (isLoading) {
      return SizedBox(
        width: _getIconSize(),
        height: _getIconSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(textColor),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [icon!, const SizedBox(width: 8), Text(text)],
      );
    }

    return Text(text);
  }

  double _getHeight() {
    switch (size) {
      case ButtonSize.small:
        return 36;
      case ButtonSize.medium:
        return 48;
      case ButtonSize.large:
        return 56;
    }
  }

  double _getBorderRadius() {
    switch (size) {
      case ButtonSize.small:
        return 8;
      case ButtonSize.medium:
        return 12;
      case ButtonSize.large:
        return 16;
    }
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case ButtonSize.small:
        return const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
      case ButtonSize.medium:
        return const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
      case ButtonSize.large:
        return const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
    }
  }

  double _getIconSize() {
    switch (size) {
      case ButtonSize.small:
        return 16;
      case ButtonSize.medium:
        return 20;
      case ButtonSize.large:
        return 24;
    }
  }
}

enum ButtonType { primary, secondary, outline, text, danger }

enum ButtonSize { small, medium, large }

// Floating Action Button variant
class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final String? tooltip;
  final bool isExtended;
  final String? label;

  const CustomFloatingActionButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.tooltip,
    this.isExtended = false,
    this.label,
  });

  const CustomFloatingActionButton.extended({
    super.key,
    this.onPressed,
    required this.icon,
    this.tooltip,
    required this.label,
  }) : isExtended = true;

  @override
  Widget build(BuildContext context) {
    if (isExtended && label != null) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          label!,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        tooltip: tooltip,
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      );
    }

    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      backgroundColor: const Color(0xFF2196F3),
      foregroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: icon,
    );
  }
}

// Icon Button variant
class CustomIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final String? tooltip;
  final Color? color;
  final Color? backgroundColor;
  final double size;
  final bool isCircular;

  const CustomIconButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.tooltip,
    this.color,
    this.backgroundColor,
    this.size = 24,
    this.isCircular = false,
  });

  const CustomIconButton.circular({
    super.key,
    this.onPressed,
    required this.icon,
    this.tooltip,
    this.color,
    this.backgroundColor,
    this.size = 24,
  }) : isCircular = true;

  @override
  Widget build(BuildContext context) {
    if (isCircular) {
      return Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.grey[100],
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          tooltip: tooltip,
          color: color ?? Colors.grey[700],
          iconSize: size,
        ),
      );
    }

    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      tooltip: tooltip,
      color: color ?? Colors.grey[700],
      iconSize: size,
    );
  }
}
