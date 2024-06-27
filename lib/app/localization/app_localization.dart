import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../config/app.dart';
import 'app_language.dart';

//the class that localize app
class AppLocalizations {
  final Locale? locale;

  AppLocalizations({this.locale});

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

//current app delegate based on json files and language keys
  static LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  //supported Locales of the app
  //get it from app language
  static List<Locale> supportedLocales =
      AppLanguages.appLanguages.map((e) => e.locale).toList();

  static List<LocalizationsDelegate> localizationsDelegates = [
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate
  ];
  late Map<String, String> localizedString;

  //load json files in the path /assets/lang and get the strings from it
  Future loadJsonLanguage() async {
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale!.languageCode}.json');

    Map<String, dynamic> jsonMap = json.decode(jsonString);
    localizedString = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  //change the key to it's reefer string
  String translate(String key) => localizedString[key] ?? key;
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  //check if the language is supported
  @override
  bool isSupported(Locale locale) {
    return [AppConfig.ar, AppConfig.en].contains(locale.languageCode);
  }

  //load json files
  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale: locale);
    await localizations.loadJsonLanguage();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

// the main method of translation
// check if the key is on json file and return it's value
//if not it return the key
//it's as extension on string that should look  like a new method of string class
extension StringLocalizations on String {
  String translate(BuildContext context) =>
      AppLocalizations.of(context)!.translate(this);
}
