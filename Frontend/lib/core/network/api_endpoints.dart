class ApiEndpoints {
  // Base URL - Try localhost for emulator
  static const String baseUrl = 'http://10.0.2.2:8000';
  
  // Auth endpoints
  static const String register = '/api/accounts/register/';
  static const String login = '/api/accounts/login/';
  static const String logout = '/api/accounts/logout/';
  static const String refreshToken = '/api/accounts/refresh/';
  static const String profile = '/api/accounts/profile/';
  static const String resetPassword = '/api/accounts/reset-password/';
  static const String resetPasswordConfirm = '/api/accounts/reset-password-confirm/';

  // Chalets endpoints
  static const String chalets = '/api/chalets/';
  static const String chaletById = '/api/chalets/{id}/';
  static const String chaletsByOwner = '/api/chalets/owner/';
  static const String chaletBookings = '/api/chalets/{id}/bookings/';
}
