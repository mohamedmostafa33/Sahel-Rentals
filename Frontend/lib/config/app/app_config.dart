import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../core/network/api_client.dart';
import '../di/service_locator.dart';

class AppConfig {
  static late SharedPreferences _prefs;
  static late FlutterSecureStorage _secureStorage;
  static late ApiClient _apiClient;
  
  // Storage keys
  static const String _authTokenKey = 'auth_token';
  static const String _userDataKey = 'user_data';
  static const String _languageKey = 'language';
  static const String _themeKey = 'theme';
  
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    );
    _apiClient = ApiClient();
    
    // Initialize Service Locator
    ServiceLocator.instance.init();
  }
  
  // Getters
  static SharedPreferences get prefs => _prefs;
  static FlutterSecureStorage get secureStorage => _secureStorage;
  static ApiClient get apiClient => _apiClient;
  
  // Auth token methods
  static Future<void> setAuthToken(String token) async {
    await _secureStorage.write(key: _authTokenKey, value: token);
    _apiClient.setAuthToken(token);
  }
  
  static Future<String?> getAuthToken() async {
    return await _secureStorage.read(key: _authTokenKey);
  }
  
  static Future<void> removeAuthToken() async {
    await _secureStorage.delete(key: _authTokenKey);
    _apiClient.removeAuthToken();
  }
  
  // User data methods
  static Future<void> setUserData(String userData) async {
    await _prefs.setString(_userDataKey, userData);
  }
  
  static String? getUserData() {
    return _prefs.getString(_userDataKey);
  }
  
  static Future<void> removeUserData() async {
    await _prefs.remove(_userDataKey);
  }
  
  // Language methods
  static Future<void> setLanguage(String language) async {
    await _prefs.setString(_languageKey, language);
  }
  
  static String getLanguage() {
    return _prefs.getString(_languageKey) ?? 'ar';
  }
  
  // Theme methods
  static Future<void> setTheme(String theme) async {
    await _prefs.setString(_themeKey, theme);
  }
  
  static String getTheme() {
    return _prefs.getString(_themeKey) ?? 'system';
  }
  
  // Clear all data
  static Future<void> clearAll() async {
    await _prefs.clear();
    await _secureStorage.deleteAll();
  }
}
