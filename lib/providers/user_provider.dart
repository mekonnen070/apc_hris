import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/app_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserControllerNotifier extends StateNotifier<bool> {
  UserControllerNotifier() : super(false) {
    _initialize();
  }

  Future<void> _initialize() async {
    final prefs = await SharedPreferences.getInstance();
    state = AppPreferences().getUserLoginStatus(prefs);
  }

  Future<void> updateUserLoginStatus(bool isLoggedIn) async {
    state = isLoggedIn;
    await AppPreferences().setUserLoginStatus(isLoggedIn);
  }

  Future<void> logout() async {
    state = false;
    await AppPreferences().setUserLoginStatus(false);
  }
}

final userControllerProvider =
    StateNotifierProvider<UserControllerNotifier, bool>((ref) {
      return UserControllerNotifier();
    });
