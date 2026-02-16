// lib/core/app_preferences.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:police_com/core/constants/app_constants.dart';
import 'package:police_com/core/enums/lango_enum.dart';
import 'package:police_com/core/theme/theme_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appPreferencesProvider = Provider<AppPreferences>((ref) {
  return AppPreferences();
});

/// A class that handles application preferences such as theme mode, language,
/// and user authentication state.
///
/// Sensitive auth data (employee IDs, login status) is stored in
/// [FlutterSecureStorage] and cached in memory after [loadAuthData] is called.
class AppPreferences {
  static const _secureStorage = FlutterSecureStorage();

  // In-memory cache populated by [loadAuthData] at startup.
  String? _employeeId;
  String? _employeeUserId;
  bool _isLoggedIn = false;

  /// Must be called once at app startup to hydrate the in-memory cache
  /// from secure storage. Includes one-time migration from SharedPreferences
  /// for users upgrading from previous versions.
  Future<void> loadAuthData() async {
    _employeeId = await _secureStorage.read(key: AppConstants.kEmployeeIdKey);
    _employeeUserId = await _secureStorage.read(
      key: AppConstants.kEmployeeUserIdKey,
    );
    final loginStr = await _secureStorage.read(key: AppConstants.isLoggedInKey);

    // One-time migration from SharedPreferences → SecureStorage
    if (_employeeId == null && _employeeUserId == null && loginStr == null) {
      final prefs = await SharedPreferences.getInstance();
      final legacyId = prefs.getString(AppConstants.kEmployeeIdKey);
      final legacyUserId = prefs.getString(AppConstants.kEmployeeUserIdKey);
      final legacyLoginBool = prefs.getBool(AppConstants.isLoggedInKey);
      final legacyLogin = legacyLoginBool?.toString();

      if (legacyId != null || legacyUserId != null || legacyLogin != null) {
        if (legacyId != null) {
          _employeeId = legacyId;
          await _secureStorage.write(
            key: AppConstants.kEmployeeIdKey,
            value: legacyId,
          );
          await prefs.remove(AppConstants.kEmployeeIdKey);
        }
        if (legacyUserId != null) {
          _employeeUserId = legacyUserId;
          await _secureStorage.write(
            key: AppConstants.kEmployeeUserIdKey,
            value: legacyUserId,
          );
          await prefs.remove(AppConstants.kEmployeeUserIdKey);
        }
        if (legacyLogin != null) {
          await _secureStorage.write(
            key: AppConstants.isLoggedInKey,
            value: legacyLogin,
          );
          await prefs.remove(AppConstants.isLoggedInKey);
        }
      }
    }

    _isLoggedIn =
        (loginStr ??
            await _secureStorage.read(key: AppConstants.isLoggedInKey)) ==
        'true';
  }

  // --- Theme (non-sensitive, stays in SharedPreferences) ---

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

  ThemeMode getThemeMode(SharedPreferences prefs) {
    final themeString = prefs.getString(AppConstants.themeKey);
    if (themeString == ThemeStrings.light) return ThemeMode.light;
    if (themeString == ThemeStrings.dark) return ThemeMode.dark;
    return ThemeMode.system;
  }

  // --- Language (non-sensitive, stays in SharedPreferences) ---

  Future<void> setLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.languageKey, language);
  }

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

  // --- Auth State (sensitive, stored in FlutterSecureStorage) ---

  Future<void> setUserLoginStatus(
    bool isLoggedIn,
    SharedPreferences prefs,
  ) async {
    _isLoggedIn = isLoggedIn;
    await _secureStorage.write(
      key: AppConstants.isLoggedInKey,
      value: isLoggedIn.toString(),
    );
  }

  bool getUserLoginStatus(SharedPreferences prefs) {
    return _isLoggedIn;
  }

  Future<void> setEmployeeId(
    String? employeeId,
    SharedPreferences prefs,
  ) async {
    _employeeId = employeeId;
    await _secureStorage.write(
      key: AppConstants.kEmployeeIdKey,
      value: employeeId,
    );
  }

  String? getEmployeeId(SharedPreferences prefs) {
    return _employeeId;
  }

  Future<void> setEmployeeUserId(
    String? employeeUserId,
    SharedPreferences prefs,
  ) async {
    _employeeUserId = employeeUserId;
    await _secureStorage.write(
      key: AppConstants.kEmployeeUserIdKey,
      value: employeeUserId,
    );
  }

  String? getEmployeeUserId(SharedPreferences prefs) {
    return _employeeUserId;
  }

  Future<void> clearAuthData(SharedPreferences prefs) async {
    _employeeId = null;
    _employeeUserId = null;
    _isLoggedIn = false;
    await _secureStorage.delete(key: AppConstants.kEmployeeIdKey);
    await _secureStorage.delete(key: AppConstants.kEmployeeUserIdKey);
    await _secureStorage.write(key: AppConstants.isLoggedInKey, value: 'false');
  }
}
