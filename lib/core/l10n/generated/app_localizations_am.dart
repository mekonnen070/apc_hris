// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AppLocalizationsAm extends AppLocalizations {
  AppLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get language => 'Amharic';

  @override
  String get signInWithGoogle => 'Sign in with Google';

  @override
  String get loginErrorMessage => 'Failed to sign in. Please try again.';

  @override
  String get errorMessage => 'Something went wrong. Please try again.';

  @override
  String get retry => 'Retry';

  @override
  String get changeLanguage => 'Change Language';
}
