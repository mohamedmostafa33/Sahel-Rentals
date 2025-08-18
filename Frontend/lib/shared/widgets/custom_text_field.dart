import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final String? initialValue;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isRequired;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final TextDirection? textDirection;
  final bool autoDetectDirection;

  const CustomTextField({
    super.key,
    required this.label,
    this.hint,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.isRequired = false,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.controller,
    this.textDirection,
    this.autoDetectDirection = true,
  });

  // Helper method to detect if text is Arabic
  bool _isArabicText(String? text) {
    if (text == null || text.isEmpty) return false;
    // Check if text contains Arabic characters
    return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
  }

  // Helper method to determine text direction
  TextDirection _getTextDirection(String? text) {
    if (textDirection != null) return textDirection!;
    if (!autoDetectDirection) return TextDirection.ltr;
    
    // For email and phone fields, always use LTR
    if (keyboardType == TextInputType.emailAddress || 
        keyboardType == TextInputType.phone ||
        keyboardType == TextInputType.number) {
      return TextDirection.ltr;
    }
    
    // Auto-detect based on content
    if (_isArabicText(text)) {
      return TextDirection.rtl;
    }
    
    return TextDirection.ltr;
  }

  @override
  Widget build(BuildContext context) {
    // Get current text for direction detection
    final currentText = controller?.text ?? initialValue ?? '';
    final detectedDirection = _getTextDirection(currentText);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
            children: [
              if (isRequired)
                const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Text field
        StatefulBuilder(
          builder: (context, setState) {
            return TextFormField(
              controller: controller,
              initialValue: controller == null ? initialValue : null,
              onChanged: (value) {
                if (onChanged != null) onChanged!(value);
                // Update text direction on text change if auto-detect is enabled
                if (autoDetectDirection) {
                  setState(() {});
                }
              },
              validator: validator,
              maxLines: maxLines,
              maxLength: maxLength,
              keyboardType: keyboardType,
              enabled: enabled,
              readOnly: readOnly,
              onTap: onTap,
              textDirection: _getTextDirection(controller?.text ?? initialValue),
              style: const TextStyle(fontSize: 16, color: Color(0xFF1E293B)),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                filled: true,
                fillColor: enabled ? Colors.white : Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF2196F3), width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[200]!, width: 1),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                counterStyle: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            );
          },
        ),
      ],
    );
  }
}

class CustomDropdownField<T> extends StatelessWidget {
  final String label;
  final String? hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final bool isRequired;
  final Widget? prefixIcon;
  final bool enabled;

  const CustomDropdownField({
    super.key,
    required this.label,
    this.hint,
    this.value,
    required this.items,
    this.onChanged,
    this.validator,
    this.isRequired = false,
    this.prefixIcon,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
            children: [
              if (isRequired)
                const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Dropdown field
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: enabled ? onChanged : null,
          validator: validator,
          style: const TextStyle(fontSize: 16, color: Color(0xFF1E293B)),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: enabled ? Colors.white : Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF2196F3), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[200]!, width: 1),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(12),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: enabled ? Colors.grey[600] : Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
