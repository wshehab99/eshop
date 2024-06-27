import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../support/helpers.dart';
import '../../../utils/app_preferences.dart';

abstract class ServicesInitializer {
  static Future<void> initializeServices() async {
    //Notifications Service
    _setSystemStatusAppBarTransparent();
    //Shared Preferences Service
    await _setSharedPreferences();
  }

  static void _setSystemStatusAppBarTransparent() {
    //transparent app bar
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }

  static Future<void> _setSharedPreferences() async {
    //Shared Preferences
    SharedPreferences pref = await SharedPreferences.getInstance();
    register<AppPreferences>(() => AppPreferences(pref));
  }
}
