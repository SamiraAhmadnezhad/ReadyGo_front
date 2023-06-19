import 'package:flutter/material.dart';

class myTheme{
  static bool iconBool = false;
  static IconData iconLight = Icons.wb_sunny;
  static IconData iconDark = Icons.nights_stay;
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData.light().copyWith(
        primaryColor: Color(0xFF5B4B49),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF24A751)));
  }
  static ThemeData darkThemeData(BuildContext context) {
    return ThemeData.dark().copyWith(
        primaryColor: Color(0xFFFF1D00),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF24A751)));
  }
}