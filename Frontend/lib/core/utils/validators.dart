class Validators {
  // Helper method to convert Arabic numerals to English numerals
  static String convertArabicToEnglishNumbers(String input) {
    const arabicNumerals = '٠١٢٣٤٥٦٧٨٩';
    const englishNumerals = '0123456789';
    
    String result = input;
    for (int i = 0; i < arabicNumerals.length; i++) {
      result = result.replaceAll(arabicNumerals[i], englishNumerals[i]);
    }
    return result;
  }

  // Helper method to check if string contains only numbers (Arabic or English)
  static bool isNumeric(String? value) {
    if (value == null || value.isEmpty) return false;
    
    // Convert Arabic numerals to English
    String converted = convertArabicToEnglishNumbers(value);
    
    // Check if it's a valid number
    return double.tryParse(converted) != null;
  }

  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'البريد الإلكتروني غير صحيح';
    }

    return null;
  }

  // Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }

    if (value.length < 8) {
      return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
    }

    return null;
  }

  // Confirm password validation
  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'تأكيد كلمة المرور مطلوب';
    }

    if (value != password) {
      return 'كلمات المرور غير متطابقة';
    }

    return null;
  }

  // Name validation
  static String? validateName(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName مطلوب';
    }

    if (value.length < 2) {
      return '$fieldName يجب أن يكون حرفين على الأقل';
    }

    if (value.length > 50) {
      return '$fieldName طويل جداً';
    }

    return null;
  }

  // Phone validation
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الهاتف مطلوب';
    }

    final phoneRegex = RegExp(r'^[+]?[0-9]{10,15}$');
    if (!phoneRegex.hasMatch(value.replaceAll(' ', '').replaceAll('-', ''))) {
      return 'رقم الهاتف غير صحيح';
    }

    return null;
  }

  // Required field validation
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName مطلوب';
    }
    return null;
  }

  // Price validation with Arabic numerals support
  static String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'السعر مطلوب';
    }

    // Convert Arabic numerals to English
    String convertedValue = convertArabicToEnglishNumbers(value.trim());
    
    // Try to parse as double
    double? price = double.tryParse(convertedValue);
    
    if (price == null) {
      return 'السعر غير صحيح - استخدم أرقام فقط';
    }

    if (price <= 0) {
      return 'السعر يجب أن يكون أكبر من صفر';
    }

    if (price > 100000) {
      return 'السعر مرتفع جداً';
    }

    return null;
  }

  // Number of rooms validation with Arabic numerals support
  static String? validateRooms(String? value) {
    if (value == null || value.isEmpty) {
      return 'عدد الغرف مطلوب';
    }

    // Convert Arabic numerals to English
    String convertedValue = convertArabicToEnglishNumbers(value.trim());
    
    // Try to parse as integer
    int? rooms = int.tryParse(convertedValue);
    
    if (rooms == null) {
      return 'عدد الغرف غير صحيح - استخدم أرقام صحيحة فقط';
    }

    if (rooms <= 0) {
      return 'عدد الغرف يجب أن يكون أكبر من صفر';
    }

    if (rooms > 50) {
      return 'عدد الغرف كبير جداً';
    }

    return null;
  }

  // Generic number validation with Arabic numerals support
  static String? validateNumber(String? value, String fieldName, {
    double? min,
    double? max,
    bool allowDecimals = true,
  }) {
    if (value == null || value.isEmpty) {
      return '$fieldName مطلوب';
    }

    // Convert Arabic numerals to English
    String convertedValue = convertArabicToEnglishNumbers(value.trim());
    
    // Try to parse as number
    double? number = double.tryParse(convertedValue);
    
    if (number == null) {
      return '$fieldName غير صحيح - استخدم أرقام فقط';
    }

    // Check if decimals are allowed
    if (!allowDecimals && number != number.floor()) {
      return '$fieldName يجب أن يكون رقم صحيح';
    }

    // Check minimum value
    if (min != null && number < min) {
      return '$fieldName يجب أن يكون $min على الأقل';
    }

    // Check maximum value
    if (max != null && number > max) {
      return '$fieldName يجب أن يكون $max على الأكثر';
    }

    return null;
  }
}
