class ApiConstants {
  // Base URL
  static const String baseUrl = 'http://127.0.0.1:8000/api';
  
  // Auth endpoints
  static const String login = '/accounts/login/';
  static const String register = '/accounts/register/';
  static const String logout = '/accounts/logout/';
  static const String profile = '/accounts/profile/';
  
  // Chalets endpoints
  static const String chalets = '/chalets/';
  static const String chaletDetail = '/chalets/{id}/';
  static const String chaletSearch = '/chalets/search/';
  
  // Headers
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  
  // Timeouts
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
}
