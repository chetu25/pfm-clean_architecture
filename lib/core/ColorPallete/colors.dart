// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color primaryClr = Color(0xffF5F5F5);
  static const Color primaryWhite = Color(0xffFFFFFF);
  static const Color gradient1 = Color(0xff22B5ED);
  static const Color background = Color(0xffFFFFFF);
  static const Color indicatorClr = Color(0xffD33B52);
  static const Color borderClr = Color(0xff707070);
  static const Color btnPrimary = Color(0xff081F27);
  static const Color redWarning = Color(0xffFF3636);
  static const Color greyClr = Color(0xff7A7A7A);
  static const Color blackClr = Color(0xff000000);
  static const Color borderClr2 = Color(0xff00000029);
  static const Color checkboxClr = Color(0xffB0EF8F);
  static const Color checkBoxTick = Color(0xff009045f);
  static const Color imageBdrClr = Color(0xff385688f);
  static const Color xMarkClr = Color(0xffEF4854);
  static const Color shadowClr = Color(0xff595966);
  static const Color successClr = Color(0xff61B56C);
  static const Color tickerClr = Color(0xff5AB265);
  static const Color dropdownClr = Color(0xff6F6F6F);
  static const Color dividerClr = Color(0xff262630);
  static const Color tcClr = Color(0xff0020FF);
}

ThemeData lightTheme() => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(primary: AppColors.background),
    // colorSchemeSeed: redColor,
    dividerColor: AppColors.dividerClr,
    dividerTheme: const DividerThemeData(thickness: 0.3),
    appBarTheme: const AppBarTheme(
      color: AppColors.background,
      elevation: 0,
    ),
    textSelectionTheme: TextSelectionThemeData(
        selectionColor: Colors.blue.shade200,
        selectionHandleColor: Colors.blue),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        linearMinHeight: 1, color: AppColors.btnPrimary),
    scrollbarTheme: const ScrollbarThemeData(
      // trackVisibility: WidgetStatePropertyAll(false),
      // thumbVisibility: WidgetStatePropertyAll(false),
      // thickness: WidgetStatePropertyAll(5),
      interactive: true,
      // thumbColor: MaterialStatePropertyAll(color37393A),
      radius: Radius.circular(5),
    ));
