import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  Map<String, String> _localizedStrings = {};

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Future<bool> load() async {
    String jsonString = await rootBundle
        .loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  // Getters for easy access
  String get appName => translate('app_name');
  String get ok => translate('ok');
  String get cancel => translate('cancel');
  String get retry => translate('retry');
  String get loading => translate('loading');
  String get error => translate('error');
  String get success => translate('success');
  String get noData => translate('no_data');
  String get refresh => translate('refresh');

  // Auth
  String get login => translate('login');
  String get register => translate('register');
  String get logout => translate('logout');
  String get email => translate('email');
  String get password => translate('password');
  String get confirmPassword => translate('confirm_password');
  String get fullName => translate('full_name');
  String get phone => translate('phone');
  String get accountType => translate('account_type');
  String get profile => translate('profile');
  String get editProfile => translate('edit_profile');
  String get save => translate('save');
  String get deleteAccount => translate('delete_account');
  String get forgotPassword => translate('forgot_password');
  String get resetPassword => translate('reset_password');
  String get dontHaveAccount => translate('dont_have_account');
  String get alreadyHaveAccount => translate('already_have_account');

  // Navigation
  String get navigation => translate('navigation');
  String get account => translate('account');
  String get chalets => translate('chalets');
  String get myBookings => translate('my_bookings');
  String get favorites => translate('favorites');
  String get settings => translate('settings');
  String get helpCenter => translate('help_center');

  // Settings
  String get appSettings => translate('app_settings');
  String get notifications => translate('notifications');
  String get language => translate('language');
  String get theme => translate('theme');
  String get privacySecurity => translate('privacy_security');
  String get privacyPolicy => translate('privacy_policy');
  String get security => translate('security');
  String get dangerZone => translate('danger_zone');
  String get deleteAccountPermanently => translate('delete_account_permanently');
  String get appInformation => translate('app_information');
  String get aboutApp => translate('about_app');
  String get contactUs => translate('contact_us');

  // Chalets
  String get availableChalets => translate('available_chalets');
  String get search => translate('search');
  String get price => translate('price');
  String get location => translate('location');
  String get capacity => translate('capacity');
  String get perNight => translate('per_night');
  String get chaletNumber => translate('chalet_number');
  String get northCoast => translate('north_coast');
  String get people => translate('people');
  String get egp => translate('egp');

  // Validation Messages
  String get emailRequired => translate('email_required');
  String get emailInvalid => translate('email_invalid');
  String get passwordRequired => translate('password_required');
  String get passwordTooShort => translate('password_too_short');
  String get passwordsNotMatch => translate('passwords_not_match');
  String get fullNameRequired => translate('full_name_required');
  String get phoneRequired => translate('phone_required');

  // Dialog Messages
  String get confirmLogout => translate('confirm_logout');
  String get confirmLogoutMessage => translate('confirm_logout_message');
  String get confirmDeleteAccount => translate('confirm_delete_account');
  String get confirmDeleteAccountMessage => translate('confirm_delete_account_message');

  // Page not found
  String get pageNotFound => translate('page_not_found');
  String get backToHome => translate('back_to_home');

  // Error Messages
  String get networkError => translate('network_error');
  String get serverError => translate('server_error');
  String get unknownError => translate('unknown_error');

  // Status Messages
  String get bookingsInDevelopment => translate('bookings_in_development');
  String get favoritesInDevelopment => translate('favorites_in_development');
  String get helpCenterInDevelopment => translate('help_center_in_development');
  String get settingsInDevelopment => translate('settings_in_development');
  
  // Auth UI Messages
  String get welcomeBack => translate('welcomeBack');
  String get loginSuccess => translate('loginSuccess');
  String get createNewAccount => translate('createNewAccount');
  String get fillDataToCreateAccount => translate('fillDataToCreateAccount');
  String get selectSuitableType => translate('selectSuitableType');
  String get tenant => translate('tenant');
  String get lookingForChalets => translate('lookingForChalets');
  String get owner => translate('owner');
  String get ownChaletsAndRent => translate('ownChaletsAndRent');
  String get splashWelcomeMessage => translate('splashWelcomeMessage');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ar', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
