import 'package:flutter/material.dart';
import 'package:flutterboilerplate/cores/styles/app_colors.dart';

class AppTheme {
  AppTheme._();

  /// Default Light Theme Configuration
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'WorkSans',
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionColor: AppColors.primaryColor,
      selectionHandleColor: AppColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  /// Default Dark Theme Configuration
  static ThemeData darkTheme = ThemeData();
}
