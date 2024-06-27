import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../di/dependency_injection.dart';
import '../utils/app_preferences.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  //full application bloc for changing language or theme or font family/size
  AppCubit(this._preferences) : super(InitialAppState());
  final AppPreferences _preferences;
  Locale? locale;

//change app language and change state
  void changeLocale(String languageKey) async {
    locale = Locale(languageKey);
    await DependencyInjection.initializeApp();
    await _preferences.setLanguage(languageKey);
    emit(ChangeLanguageState());
  }

//get app preferred language from preferences
  void getLocale() {
    locale = Locale(_preferences.getLanguage);
    emit(GetLanguageState());
  }
}
