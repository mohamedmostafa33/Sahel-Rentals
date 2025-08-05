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

  // Helper method for string interpolation
  String translateWithParams(String key, Map<String, String> params) {
    String text = translate(key);
    params.forEach((key, value) {
      text = text.replaceAll('{$key}', value);
    });
    return text;
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
  String get forgotPassword => translate('forgotPassword');
  String get resetPassword => translate('resetPassword');
  String get dontHaveAccount => translate('dontHaveAccount');
  String get alreadyHaveAccount => translate('alreadyHaveAccount');

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
  String get noChaletsAvailable => translate('no_chalets_available'); 
  String get pullToRefresh => translate('pull_to_refresh');
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
  String get firstName => translate('firstName');
  String get lastName => translate('lastName');
  String get rememberMe => translate('rememberMe');
  String get otpCode => translate('otpCode');
  String get newPassword => translate('newPassword');
  
  // Reset Password Pages
  String get forgotPasswordTitle => translate('forgotPasswordTitle');
  String get forgotPasswordSubtitle => translate('forgotPasswordSubtitle');
  String get sendVerificationCode => translate('sendVerificationCode');
  String get resetPasswordTitle => translate('resetPasswordTitle');
  String get verificationCodeSent => translate('verificationCodeSent');
  String get verificationCodeSentAgain => translate('verificationCodeSentAgain');
  String get enterVerificationCode => translate('enterVerificationCode');
  String get verificationCodeMustBe6Digits => translate('verificationCodeMustBe6Digits');
  String get confirmPasswordRequired => translate('confirmPasswordRequired');
  String get resetPasswordButton => translate('resetPasswordButton');
  String get resendCode => translate('resendCode');
  
  // Profile Page
  String get profileTitle => translate('profileTitle');
  String get editData => translate('editData');
  String get saveChanges => translate('saveChanges');
  String get cancelEdit => translate('cancelEdit');
  String get profileUpdatedSuccessfully => translate('profileUpdatedSuccessfully');
  
  // Additional Auth Messages
  String get rememberPassword => translate('rememberPassword');
  String get backToLogin => translate('backToLogin');
  String get didntReceiveCode => translate('didntReceiveCode');
  
  // Welcome Profile Screen
  String get setupProfile => translate('setupProfile');
  String get skip => translate('skip');
  String get welcomeUser => translate('welcomeUser');
  String get welcomeUserName => translate('welcomeUserName');
  String get completeProfileForBetterExperience => translate('completeProfileForBetterExperience');
  String get addYourProfilePicture => translate('addYourProfilePicture');
  String get helpOthersRecognizeYou => translate('helpOthersRecognizeYou');
  String get continueToApp => translate('continueToApp');
  String get addPictureLater => translate('addPictureLater');
  String get notSpecified => translate('notSpecified');

  // Chalet Management
  String get addChalet => translate('addChalet');
  String get editChalet => translate('editChalet');
  String get chaletManagement => translate('chaletManagement');
  String get chaletDetails => translate('chaletDetails');
  String get chaletNotFound => translate('chalet_not_found');
  String get basicInformation => translate('basicInformation');
  String get chaletPhotos => translate('chaletPhotos');
  String get chaletName => translate('chaletName');
  String get description => translate('description');
  String get pricePerNight => translate('pricePerNight');
  String get numberOfRooms => translate('numberOfRooms');
  String get unitNumber => translate('unitNumber');
  String get notes => translate('notes');
  String get available => translate('available');
  String get unavailable => translate('unavailable');
  String get notAvailable => translate('notAvailable');
  String get rooms => translate('rooms');
  String get unit => translate('unit');
  String get imageCount => translate('imageCount');
  String get all => translate('all');
  String get availability => translate('availability');
  String get filters => translate('filters');
  String get clear => translate('clear');
  String get apply => translate('apply');
  String get priceRange => translate('priceRange');
  String get minPrice => translate('minPrice');
  String get maxPrice => translate('maxPrice');
  String get any => translate('any');
  String get sortBy => translate('sortBy');
  String get name => translate('name');
  String get priceSort => translate('priceSort');
  String get createdDate => translate('createdDate');
  String get ascending => translate('ascending');
  String get descending => translate('descending');
  String get next => translate('next');
  String get previous => translate('previous');
  String get createChalet => translate('createChalet');
  String get chaletCreatedSuccessfully => translate('chaletCreatedSuccessfully');
  String get chaletUpdatedSuccessfully => translate('chaletUpdatedSuccessfully');
  String get chaletDeletedSuccessfully => translate('chaletDeletedSuccessfully');
  String get confirmDeleteChalet => translate('confirmDeleteChalet');
  String get confirmDeleteChaletMessage => translate('confirmDeleteChaletMessage');
  String get delete => translate('delete');
  String get edit => translate('edit');
  String get view => translate('view');
  String get required => translate('required');
  String get pleaseEnterChaletName => translate('pleaseEnterChaletName');
  String get pleaseEnterDescription => translate('pleaseEnterDescription');
  String get pleaseEnterValidPrice => translate('pleaseEnterValidPrice');
  String get pleaseEnterValidRooms => translate('pleaseEnterValidRooms');
  String get pleaseEnterLocation => translate('pleaseEnterLocation');
  String get pleaseEnterUnitNumber => translate('pleaseEnterUnitNumber');
  String get searchChalets => translate('searchChalets');
  String get noChaletsFound => translate('noChaletsFound');
  String get tapToAddFirstChalet => translate('tapToAddFirstChalet');
  String get noSearchResults => translate('noSearchResults');
  String get tryDifferentKeywords => translate('tryDifferentKeywords');
  String get loadingChalets => translate('loadingChalets');
  String get errorLoadingChalets => translate('errorLoadingChalets');
  String get refreshToTryAgain => translate('refreshToTryAgain');
  
  // Additional chalet management getters
  String get myChalets => translate('myChalets');
  String get comingSoon => translate('comingSoon');
  String get newest => translate('newest');
  String get oldest => translate('oldest');
  String get priceLowToHigh => translate('priceLowToHigh');
  String get priceHighToLow => translate('priceHighToLow');
  String get nameAToZ => translate('nameAToZ');
  String get nameZToA => translate('nameZToA');
  String get status => translate('status');
  String get deleteChalet => translate('deleteChalet');
  String get addNewChalet => translate('addNewChalet');
  String get basicInfo => translate('basicInfo');
  String get details => translate('details');
  String get photos => translate('photos');
  String get enterBasicChaletInfo => translate('enterBasicChaletInfo');
  String get enterDetailedInformation => translate('enterDetailedInformation');
  String get addPhotosToShowcase => translate('addPhotosToShowcase');
  String get uploadChaletPhotos => translate('uploadChaletPhotos');
  String get uploadPhotosDescription => translate('uploadPhotosDescription');
  String get camera => translate('camera');
  String get gallery => translate('gallery');
  String get selectedPhotos => translate('selectedPhotos');
  String get uploadPhotos => translate('uploadPhotos');
  String get done => translate('done');
  String get imagesUploadedSuccessfully => translate('imagesUploadedSuccessfully');
  String get main => translate('main');
  String get additionalNotes => translate('additionalNotes');
  
  // Chalet form validation getters
  String get enterChaletName => translate('enterChaletName');
  String get chaletNameRequired => translate('chaletNameRequired');
  String get chaletNameTooShort => translate('chaletNameTooShort');
  String get enterLocation => translate('enterLocation');
  String get locationRequired => translate('locationRequired');
  String get enterDescription => translate('enterDescription');
  String get unitNumberRequired => translate('unitNumberRequired');
  String get numberOfRoomsRequired => translate('numberOfRoomsRequired');
  String get invalidNumberOfRooms => translate('invalidNumberOfRooms');
  String get tooManyRooms => translate('tooManyRooms');
  String get enterAdditionalNotes => translate('enterAdditionalNotes');
  String get priceRequired => translate('priceRequired');
  String get invalidPrice => translate('invalidPrice');
  String get priceTooHigh => translate('priceTooHigh');
  String get uploadingPhotos => translate('uploadingPhotos');
  
  // Missing getters for edit chalet page
  String get images => translate('images');
  String get review => translate('review');
  String get fieldRequired => translate('fieldRequired');
  String get nameMinLength => translate('nameMinLength');
  String get invalidNumber => translate('invalidNumber');
  String get currency => translate('currency');
  String get isAvailable => translate('isAvailable');
  String get existingImages => translate('existingImages');
  String get mainImage => translate('mainImage');
  String get addNewImages => translate('addNewImages');
  String get selectImages => translate('selectImages');
  String get selectedImages => translate('selectedImages');
  String get chaletInformation => translate('chaletInformation');
  String get updateChalet => translate('updateChalet');
  String get chaletUpdatedMessage => translate('chaletUpdatedMessage');
  String get wouldYouLikeToUploadImages => translate('wouldYouLikeToUploadImages');
  String get skipImages => translate('skipImages');
  String get uploadImages => translate('uploadImages');
  String get newImages => translate('newImages');
  
  // Method to handle chalet deletion confirmation
  String deleteChaletConfirmation(String chaletName) {
    return translateWithParams('confirmDeleteChaletMessage', {'name': chaletName});
  }
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
