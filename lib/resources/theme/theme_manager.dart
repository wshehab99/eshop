import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/app_colors.dart';
import '../others/size_manager.dart';
import '../style/font_manager.dart';
import '../style/input_border_manager.dart';
import '../style/style_manager.dart';

//app theme
abstract class ThemeManager {
  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    filled: true,
    isDense: true,
    errorMaxLines: 5,
    fillColor: AppColors.textField,
    prefixIconColor: AppColors.primary,
    hintStyle: StyleManager.bold(size: SizeManager.s12, color: AppColors.grey),
    labelStyle: StyleManager.bold(size: SizeManager.s12, color: AppColors.grey),
    errorStyle:
        StyleManager.bold(size: SizeManager.s12, color: AppColors.failed),
    contentPadding: const EdgeInsets.symmetric(
        horizontal: SizeManager.s12, vertical: SizeManager.s10),
    border: InputBorderManager.border(color: AppColors.transparent),
    enabledBorder: InputBorderManager.border(color: AppColors.transparent),
    focusedBorder: InputBorderManager.border(),
    errorBorder: InputBorderManager.border(color: AppColors.failed),
    disabledBorder: InputBorderManager.border(color: AppColors.transparent),
  );
  static ThemeData appTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.offWhite,
    //app bar theme
    appBarTheme: AppBarTheme(
      color: AppColors.transparent,
      titleTextStyle: StyleManager.bold(
        size: SizeManager.s20,
        color: AppColors.black,
      ),
      elevation: 0,
      shadowColor: AppColors.blackShadow,
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.lightBlack),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      surfaceTintColor: Colors.transparent,
    ),
    fontFamily: FontFamilyManager.fontFamily,
    //text theme
    textTheme: TextTheme(
      titleLarge:
          StyleManager.bold(size: SizeManager.s15, color: AppColors.lightBlack),
      titleMedium:
          StyleManager.bold(size: SizeManager.s13, color: AppColors.lightBlack),
      titleSmall:
          StyleManager.bold(size: SizeManager.s10, color: AppColors.lightBlack),
      bodyLarge: StyleManager.bold(
        size: SizeManager.s15,
        color: AppColors.lightBlack,
      ),
      bodyMedium: StyleManager.bold(
        size: SizeManager.s13,
        color: AppColors.grey,
      ),
      bodySmall: StyleManager.bold(
        size: SizeManager.s10,
        color: AppColors.lightBlack,
      ),
      headlineLarge:
          StyleManager.bold(color: AppColors.primary, size: SizeManager.s15),
      headlineSmall:
          StyleManager.bold(color: AppColors.primary, size: SizeManager.s13),
      labelMedium:
          StyleManager.bold(size: SizeManager.s10, color: AppColors.primary),
      labelSmall:
          StyleManager.bold(size: SizeManager.s10, color: AppColors.white),
      displayLarge:
          StyleManager.bold(size: SizeManager.s15, color: AppColors.grey),
      labelLarge:
          StyleManager.bold(size: SizeManager.s8, color: AppColors.grey),
      headlineMedium:
          StyleManager.bold(size: SizeManager.s10, color: AppColors.grey),
    ),
    //input Decoration Theme
    inputDecorationTheme: _inputDecorationTheme,
    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.primary),
        overlayColor: WidgetStateProperty.all<Color>(AppColors.primary),
        foregroundColor: WidgetStateProperty.all<Color>(AppColors.white),
        textStyle: WidgetStateProperty.all(
          StyleManager.bold(
            color: AppColors.white,
            size: SizeManager.s15,
          ),
        ),
        elevation: WidgetStateProperty.all(SizeManager.s0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeManager.s10),
          ),
        ),
      ),
    ),

    //text button theme
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.offWhite),
        overlayColor: WidgetStateProperty.all<Color>(AppColors.offWhite),
        textStyle: WidgetStateProperty.all(
            StyleManager.bold(color: AppColors.primary, size: SizeManager.s15)),
        elevation: WidgetStateProperty.all(SizeManager.s0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeManager.s16),
            side: const BorderSide(
                color: AppColors.primary, width: SizeManager.s2),
          ),
        ),
      ),
    ),
    //  Floating Action Button Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      splashColor: AppColors.primary,
      foregroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          SizeManager.s50,
        ),
      ),
    ),
    //Dialog theme
    // dialogTheme: DialogTheme(
    //   actionsPadding: const EdgeInsets.all(SizeManager.s20),
    //   backgroundColor: AppColors.white,
    //   iconColor: AppColors.secondary,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(SizeManager.s16),
    //   ),
    //   contentTextStyle:
    //       StyleManager.bold(color: AppColors.primary, size: SizeManager.s20),
    // ),
    // check box theme
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.primary,
      secondary: AppColors.offWhite,
      onSecondary: AppColors.offWhite,
      error: AppColors.failed,
      onError: AppColors.failed,
      surface: AppColors.offWhite,
      onSurface: AppColors.grey,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all<Color>(AppColors.white),
      side: const BorderSide(
        width: 1.0,
        color: AppColors.primary,
      ),
      splashRadius: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeManager.s6),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      labelTextStyle: WidgetStateProperty.all<TextStyle>(
        StyleManager.bold(
          color: AppColors.grey,
          size: SizeManager.s10,
        ),
      ),
      color: AppColors.offWhite,
      surfaceTintColor: AppColors.offWhite,
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeManager.s8),
      ),
      iconSize: 0,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeManager.s10),
      ),
      color: AppColors.white,
    ),
    drawerTheme: const DrawerThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: AppColors.white,
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: _inputDecorationTheme,
    ),
  );
}
