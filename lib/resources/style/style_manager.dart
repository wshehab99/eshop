import 'package:flutter/material.dart';

import 'font_manager.dart';

//text style interface
abstract class StyleManager {
  static TextStyle regular({
    double? size,
    Color? color,
    FontStyle? style,
    double? height,
  }) =>
      _getStyle(
        fontWeight: FontWeightManager.regular,
        size: size,
        style: style,
        color: color,
        height: height,
      );

  static TextStyle semiBold({
    double? size,
    Color? color,
    FontStyle? style,
    double? height,
  }) =>
      _getStyle(
        fontWeight: FontWeightManager.semiBold,
        size: size,
        style: style,
        color: color,
        height: height,
      );

  static TextStyle medium({
    double? size,
    Color? color,
    FontStyle? style,
    double? height,
  }) =>
      _getStyle(
        fontWeight: FontWeightManager.medium,
        size: size,
        style: style,
        color: color,
        height: height,
      );

  static TextStyle light({
    double? size,
    Color? color,
    FontStyle? style,
    double? height,
  }) =>
      _getStyle(
        fontWeight: FontWeightManager.light,
        size: size,
        style: style,
        color: color,
        height: height,
      );

  static TextStyle extraBold({
    double? size,
    Color? color,
    FontStyle? style,
    double? height,
  }) =>
      _getStyle(
        fontWeight: FontWeightManager.extraBold,
        size: size,
        style: style,
        color: color,
        height: height,
      );

  static TextStyle extraLight({
    double? size,
    Color? color,
    FontStyle? style,
    double? height,
  }) =>
      _getStyle(
        fontWeight: FontWeightManager.extraLight,
        size: size,
        style: style,
        color: color,
        height: height,
      );

  static TextStyle _getStyle({
    FontWeight? fontWeight,
    double? size,
    Color? color,
    FontStyle? style,
    double? height,
  }) =>
      TextStyle(
        fontFamily: FontFamilyManager.fontFamily,
        fontWeight: fontWeight,
        fontSize: size,
        color: color,
        fontStyle: style,
        height: height,
      );

  static TextStyle bold({
    double? size,
    Color? color,
    FontStyle? style,
    double? height,
  }) =>
      _getStyle(
        fontWeight: FontWeightManager.bold,
        size: size,
        style: style,
        color: color,
        height: height,
      );
}
