/// A class that holds constant values used throughout the application.
///
/// This class contains keys for storing and retrieving theme mode and language
/// preferences from persistent storage.
class AppConstants {
  /// The key used to store and retrieve the theme mode preference.
  static const String themeKey = 'theme_mode';

  /// The key used to store and retrieve the language preference.
  static const String languageKey = 'language';

  /// The key used to store and retrieve the user login status.
  static const String isLoggedInKey = 'is_logged_in';

  /// Shared Preferences Keys
  static const String kLoggedInPrefKey = 'isLoggedIn';
  static const String kOnBoardedPrefKey = 'isOnBoarded';
  static const String kUpdateAndOffers = 'updateAndOffers';
  static const String kThemeModePrefKey = 'themeMode';
  static const String kLanguagePrefKey = 'language';
  static const String kAuthTokenKey = 'authToken';
  static const String kEmployeeIdKey = 'employeeId';
  static const String kServerIpKey = 'server_ip';
  static const String kServerPortKey = 'server_port';
  static const String kEmployeeUserIdKey = 'employeeUserId';

}
