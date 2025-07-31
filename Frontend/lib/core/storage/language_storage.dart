import 'package:shared_preferences/shared_preferences.dart';

class LanguageStorage {
  static const String _languageKey = 'app_language';
  final SharedPreferences _prefs;

  LanguageStorage(this._prefs);

  String getLanguage() {
    return _prefs.getString(_languageKey) ?? 'ar'; // Default to Arabic
  }

  Future<void> setLanguage(String languageCode) async {
    await _prefs.setString(_languageKey, languageCode);
  }

  Future<void> clearLanguage() async {
    await _prefs.remove(_languageKey);
  }
}
