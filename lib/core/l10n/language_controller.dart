// use State Notifier to manage the language state
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/app_preferences.dart';
import 'package:police_com/core/enums/lango_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends StateNotifier<Lango> {
  final AppPreferences _appPref;

  LanguageController(this._appPref) : super(Lango.en) {
    _initialize();
  }

  Future<void> _initialize() async {
    final prefs = await SharedPreferences.getInstance();
    state = _appPref.getLanguage(prefs);
  }

  Future<void> updateLanguage(Lango language) async {
    state = language;
    await _appPref.setLanguage(language.code);
  }
}

final languageControllerProvider =
    StateNotifierProvider<LanguageController, Lango>((ref) {
      return LanguageController(ref.watch(appPreferencesProvider));
    });
