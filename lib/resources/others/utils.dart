import 'package:flutter/material.dart';

//responsive interface
abstract class Utils {
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  //saved size base on device screen
  static double bottom(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;
  static double top(BuildContext context) => MediaQuery.of(context).padding.top;
}
