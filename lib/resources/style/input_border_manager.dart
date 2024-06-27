import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../others/size_manager.dart';

//saved border used for all text field on app
class InputBorderManager {
  static InputBorder border({Color color = AppColors.primary}) =>
      OutlineInputBorder(
        borderSide: BorderSide(color: color, width: SizeManager.s1_5),
        borderRadius: BorderRadius.circular(SizeManager.s10),
      );
}
