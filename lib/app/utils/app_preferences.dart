import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app.dart';

// SharedPreferences package app interface
class AppPreferences {
  final SharedPreferences _preferences;

  AppPreferences(this._preferences);

//get app preferred language from SharedPreferences
  String get getLanguage =>
      _preferences.getString(AppConfig.language) ?? AppConfig.en;

  //change app preferred language based on coming language key
  Future<bool> setLanguage(String language) =>
      _preferences.setString(AppConfig.language, language);
}
