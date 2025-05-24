// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'Language';

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
