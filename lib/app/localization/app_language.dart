import 'package:flutter/material.dart';

import '../../resources/others/string_manager.dart';
import '../../config/app.dart';

//app language name and language key
abstract class AppLanguages {
  //all app languages
  static const List<Languages> appLanguages = [
    Languages(
      language: StringManager.arabicLanguage,
      locale: Locale(AppConfig.ar),
    ),
    Languages(
      language: StringManager.englishLanguage,
      locale: Locale(AppConfig.en),
      // flagUrl: FlagsManaget.en,
    ),
  ];
}

class Languages {
  final Locale locale;
  final String language;
  // final String flagUrl;

  const Languages({
    required this.language,
    required this.locale,
  });
}
