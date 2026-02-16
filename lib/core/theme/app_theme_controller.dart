import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/app_preferences.dart';
import 'package:police_com/core/theme/app_colors.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeControllerProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  late AppPreferences _appPref;

  ThemeMode get themeMode => _themeMode;

  ThemeData get currentThemeData {
    switch (_themeMode) {
      case ThemeMode.light:
        return lightThemeData;
      case ThemeMode.dark:
        return darkThemeData;
      case ThemeMode.system:
        return darkThemeData;
    }
  }

  ThemeData get lightThemeData => FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
  ).copyWith(cardTheme: const CardThemeData(color: AppColors.cardColorLight));

  ThemeData get darkThemeData => FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
  ).copyWith(cardTheme: const CardThemeData(color: AppColors.cardColorDark));

  Future<ThemeData> initialize(
    SharedPreferences prefs, {
    AppPreferences? appPreferences,
  }) async {
    _appPref = appPreferences ?? AppPreferences();
    _themeMode = _appPref.getThemeMode(prefs);
    notifyListeners();
    return currentThemeData;
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    _themeMode = themeMode;
    await _appPref.setThemeMode(themeMode);
    notifyListeners();
  }
}

/// A provider for the [ThemeControllerProvider] class.
final themeControllerProvider = ChangeNotifierProvider<ThemeControllerProvider>(
  (ref) {
    final controller = ThemeControllerProvider();
    final appPref = ref.watch(appPreferencesProvider);
    final prefs = ref.watch(sharedPreferencesProvider);
    controller.initialize(prefs, appPreferences: appPref);
    return controller;
  },
);
