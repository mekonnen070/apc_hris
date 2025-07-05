// lib/core/app_preferences.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/app_constants.dart';
import 'package:police_com/core/enums/lango_enum.dart';
import 'package:police_com/core/theme/theme_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

// The Architect's Note:
// A provider is the correct way to expose this class to the rest of the app.
// This prevents direct instantiation and improves testability.
final appPreferencesProvider = Provider<AppPreferences>((ref) {
  return AppPreferences();
});

/// A class that handles application preferences such as theme mode, language,
/// and now, user authentication state.
class AppPreferences {
  /// Sets the theme mode in shared preferences.
  ///
  Future<void> setThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    String themeString;
    switch (themeMode) {
      case ThemeMode.light:
        themeString = ThemeStrings.light;
        break;
      case ThemeMode.dark:
        themeString = ThemeStrings.dark;
        break;
      default:
        themeString = ThemeStrings.system;
    }
    await prefs.setString(AppConstants.themeKey, themeString);
  }

  /// Gets the theme mode from shared preferences.
  ///
  ThemeMode getThemeMode(SharedPreferences prefs) {
    final themeString = prefs.getString(AppConstants.themeKey);
    if (themeString == ThemeStrings.light) return ThemeMode.light;
    if (themeString == ThemeStrings.dark) return ThemeMode.dark;
    return ThemeMode.system;
  }

  /// Sets the language in shared preferences.
  ///
  Future<void> setLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.languageKey, language);
  }

  /// Gets the language from shared preferences.
  ///
  Lango getLanguage(SharedPreferences prefs) {
    final languageString = prefs.getString(AppConstants.languageKey);
    if (languageString == null) {
      return Lango.en;
    } else {
      return Lango.values.firstWhere(
        (lango) => lango.code == languageString,
        orElse: () => Lango.en,
      );
    }
  }

  /// sets user login status
  Future<void> setUserLoginStatus(bool isLoggedIn, SharedPreferences prefs) async {
    await prefs.setBool(AppConstants.isLoggedInKey, isLoggedIn);
  }

  /// gets user login status
  bool getUserLoginStatus(SharedPreferences prefs) {
    return prefs.getBool(AppConstants.isLoggedInKey) ?? false;
  }

  // --- Auth State Management ---
  Future<void> setLoginStatus(
    bool isLoggedIn,
    SharedPreferences prefs,
  ) async {
    await prefs.setBool(AppConstants.isLoggedInKey, isLoggedIn);
  }

  bool getLoginStatus(SharedPreferences prefs) {
    return prefs.getBool(AppConstants.isLoggedInKey) ?? false;
  }

  Future<void> setToken(String token, SharedPreferences prefs) async {
    await prefs.setString(AppConstants.kAuthTokenKey, token);
  }

  String? getToken(SharedPreferences prefs) {
    return prefs.getString(AppConstants.kAuthTokenKey);
  }

  // The Architect's Note:
  // These are the only methods needed for managing the user's identity.
  // We store and retrieve the ID, nothing more.

  /// Saves the employee ID to SharedPreferences.
  Future<void> setEmployeeId(String employeeId, SharedPreferences prefs) async {
    await prefs.setString(AppConstants.kEmployeeIdKey, employeeId);
  }

  /// Retrieves the employee ID from SharedPreferences.
  String? getEmployeeId(SharedPreferences prefs) {
    return prefs.getString(AppConstants.kEmployeeIdKey);
  }

  /// Sets the employee User ID to SharedPreferences.
  Future<void> setEmployeeUserId(String employeeUserId, SharedPreferences prefs) async {
    await prefs.setString(AppConstants.kEmployeeUserIdKey, employeeUserId);
  }

  /// Retrieves the employee User ID from SharedPreferences.
  String? getEmployeeUserId(SharedPreferences prefs) {
    return prefs.getString(AppConstants.kEmployeeUserIdKey);
  }

  /// Clears all authentication and user identity data.
  Future<void> clearAuthData(SharedPreferences prefs) async {
    await prefs.remove(AppConstants.kAuthTokenKey);
    await prefs.remove(AppConstants.kEmployeeIdKey);
    await prefs.remove(AppConstants.kEmployeeUserIdKey);
    await prefs.setBool(AppConstants.isLoggedInKey, false);
  }
}
