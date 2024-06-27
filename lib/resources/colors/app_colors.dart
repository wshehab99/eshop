import 'package:flutter/material.dart';

//All App Colors on hexadecimal code
abstract class AppColors {
//main colors
  static const Color primary = Color(0xfffabe12);
  static const Color primaryOpacity70 = Color(0x1AFFB84E);

// additional colors
  static const Color black = Color(0xff000000);
  static const Color blackShadow = Color(0x21000000);
  static const Color lightBlack = Color(0xff1A1A1A);
  static const Color white = Color(0xffffffff);
  static const Color offWhite = Color(0xffFAFAFF);
  static const Color grey = Color(0xffB6B6B6);
  static const Color textField = Color(0xffF0F0F0);
  static const Color transparent = Color(0x00000000);

//more colors
  static const Color successful = Color(0xff3FBA70);
  static const Color failed = Color(0xffFD7070);
}

class HexColor extends Color {
  HexColor(String hexValue)
      : super(int.parse("0xFF${hexValue.replaceAll("#", "")}"));
}
