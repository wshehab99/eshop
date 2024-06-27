import 'package:flutter/material.dart';

import '../../config/app.dart';

//shared method used in different screens
abstract class SharedMethods {
  static Future<void> animateToStart(ScrollController controller) =>
      animateToPosition(controller, 0);

  static Future<void> animateToPosition(
          ScrollController controller, double position) =>
      controller.animateTo(
        position,
        duration: AppConfig.animationDelay1,
        curve: Curves.easeInOut,
      );
}
