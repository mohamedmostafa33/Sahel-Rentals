import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class TokenStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  // Keys
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userIdKey = 'user_id';
  static const String _userEmailKey = 'user_email';
  static const String _userNameKey = 'user_name';
  static const String _userTypeKey = 'user_type';

  // Save tokens after successful authentication
  static Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required int userId,
    required String userEmail,
    required String userName,
    required String userType,
  }) async {
    await Future.wait([
      _storage.write(key: _accessTokenKey, value: accessToken),
      _storage.write(key: _refreshTokenKey, value: refreshToken),
      _storage.write(key: _userIdKey, value: userId.toString()),
      _storage.write(key: _userEmailKey, value: userEmail),
      _storage.write(key: _userNameKey, value: userName),
      _storage.write(key: _userTypeKey, value: userType),
    ]);
  }

  // Get tokens
  static Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  // Save only access token (for refresh scenarios)
  static Future<void> saveAccessToken(String accessToken) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
  }

  // Get user info
  static Future<Map<String, String?>> getUserInfo() async {
    final results = await Future.wait([
      _storage.read(key: _userIdKey),
      _storage.read(key: _userEmailKey),
      _storage.read(key: _userNameKey),
      _storage.read(key: _userTypeKey),
    ]);

    return {
      'id': results[0],
      'email': results[1],
      'name': results[2],
      'type': results[3],
    };
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final accessToken = await getAccessToken();
    return accessToken != null && accessToken.isNotEmpty;
  }

  // Clear all tokens (logout)
  static Future<void> clearTokens() async {
    await _storage.deleteAll();
  }

  // Check if access token is expired (basic check)
  static Future<bool> isTokenExpired() async {
    final token = await getAccessToken();
    if (token == null) return true;

    try {
      // Decode JWT token to check expiration
      final parts = token.split('.');
      if (parts.length != 3) return true;

      // Decode the payload (second part)
      final payload = parts[1];
      // Add padding if necessary
      final normalizedPayload = payload.length % 4 == 0 
          ? payload 
          : payload + '=' * (4 - payload.length % 4);
      
      final decoded = utf8.decode(base64Url.decode(normalizedPayload));
      final Map<String, dynamic> payloadMap = json.decode(decoded);

      // Check if token has an expiration time
      if (!payloadMap.containsKey('exp')) {
        // If no expiration, consider it valid for basic implementation
        return false;
      }

      final exp = payloadMap['exp'] as int;
      final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      
      // Add a buffer of 60 seconds to refresh before actual expiration
      return currentTime >= (exp - 60);
    } catch (e) {
      // If there's any error decoding, consider token expired
      print('Error checking token expiration: $e');
      return true;
    }
  }
}
