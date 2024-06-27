import 'package:flutter/widgets.dart';

//font family for change the font family in the whole app
abstract class FontFamilyManager {
  static const String fontFamily = "Almarai";
}

//interface for FontWeight
abstract class FontWeightManager {
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.bold;
  static const FontWeight extraBold = FontWeight.w900;
}
