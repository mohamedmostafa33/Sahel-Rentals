class ApiConstants {
  // Base URL - Using 10.0.2.2 for Android emulator (no /api suffix)
  static const String baseUrl = 'http://10.0.2.2:8000';

  // Auth endpoints
  static const String login = '/api/accounts/login/';
  static const String register = '/api/accounts/register/';
  static const String logout = '/api/accounts/logout/';
  static const String profile = '/api/accounts/profile/';
  static const String profileImage = '/api/accounts/profile/image/';
  static const String refreshToken = '/api/accounts/refresh/';
  static const String deleteAccount = '/api/accounts/delete-account/';
  static const String resetPasswordRequest = '/api/accounts/reset-password/';
  static const String resetPasswordConfirm = '/api/accounts/reset-password-confirm/';

  // Chalets endpoints
  static const String chalets = '/api/chalets/';
  static const String chaletDetail = '/api/chalets/{id}/';
  static const String chaletSearch = '/api/chalets/search/';
  static const String publicChalets = '/api/chalets/browse/';
  static const String publicChaletDetail = '/api/chalets/browse/{id}/';
  static const String favorites = '/api/chalets/favorites/';

  // Headers
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Timeouts
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
}
