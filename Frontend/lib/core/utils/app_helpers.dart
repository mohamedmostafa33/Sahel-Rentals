import 'package:intl/intl.dart';

class AppHelpers {
  // Format date
  static String formatDate(DateTime date, {String pattern = 'yyyy/MM/dd'}) {
    return DateFormat(pattern, 'ar').format(date);
  }
  
  // Format currency
  static String formatCurrency(double amount, {String currency = 'ج.م'}) {
    final formatter = NumberFormat('#,##0.00', 'ar');
    return '${formatter.format(amount)} $currency';
  }
  
  // Format phone number
  static String formatPhoneNumber(String phone) {
    // Remove all non-digit characters
    final digits = phone.replaceAll(RegExp(r'\D'), '');
    
    if (digits.length == 11) {
      return '${digits.substring(0, 3)} ${digits.substring(3, 6)} ${digits.substring(6)}';
    }
    
    return phone;
  }
  
  // Get time ago
  static String getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays > 0) {
      return 'منذ ${difference.inDays} ${difference.inDays == 1 ? 'يوم' : 'أيام'}';
    } else if (difference.inHours > 0) {
      return 'منذ ${difference.inHours} ${difference.inHours == 1 ? 'ساعة' : 'ساعات'}';
    } else if (difference.inMinutes > 0) {
      return 'منذ ${difference.inMinutes} ${difference.inMinutes == 1 ? 'دقيقة' : 'دقائق'}';
    } else {
      return 'الآن';
    }
  }
  
  // Truncate text
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}...';
  }
  
  // Generate random string
  static String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = DateTime.now().millisecondsSinceEpoch;
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(random % chars.length),
      ),
    );
  }
  
  // Validate and format email
  static String normalizeEmail(String email) {
    return email.toLowerCase().trim();
  }
  
  // Calculate reading time
  static String calculateReadingTime(String text) {
    const wordsPerMinute = 200;
    final wordCount = text.split(' ').length;
    final minutes = (wordCount / wordsPerMinute).ceil();
    return '$minutes دقيقة قراءة';
  }
}
