class AppSettings {
  final bool notificationsEnabled;
  final String language;
  final String theme;

  const AppSettings({
    required this.notificationsEnabled,
    required this.language,
    required this.theme,
  });

  AppSettings copyWith({
    bool? notificationsEnabled,
    String? language,
    String? theme,
  }) {
    return AppSettings(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      language: language ?? this.language,
      theme: theme ?? this.theme,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppSettings &&
        other.notificationsEnabled == notificationsEnabled &&
        other.language == language &&
        other.theme == theme;
  }

  @override
  int get hashCode {
    return notificationsEnabled.hashCode ^ language.hashCode ^ theme.hashCode;
  }

  @override
  String toString() {
    return 'AppSettings(notificationsEnabled: $notificationsEnabled, language: $language, theme: $theme)';
  }
}
