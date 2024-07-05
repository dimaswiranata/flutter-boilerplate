import 'package:flutter/material.dart';
import 'package:flutterboilerplate/cores/index.dart';

class AppTheme {
  AppTheme._();

  /// Default Light Theme Configuration
  static ThemeData lightTheme = ThemeData(
    /* GENERAL THEME PROPERTIES */
    // applyElevationOverlayColor,
    // cupertinoOverrideTheme,
    // extensions,
    inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.all(AppSpaces.md),
        hintStyle: bodyBody.copyWith(
            fontWeight: FontWeight.w300, color: AppColors.hint),
        errorStyle: bodyCaption.copyWith(
            fontWeight: FontWeight.w300, color: AppColors.error),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.border, width: 1.0),
          borderRadius: BorderRadius.circular(AppSpaces.sm),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.primaryColor, width: 1.0),
          borderRadius: BorderRadius.circular(AppSpaces.sm),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error, width: 1.0),
          borderRadius: BorderRadius.circular(AppSpaces.sm),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error, width: 1.0),
          borderRadius: BorderRadius.circular(AppSpaces.sm),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.border, width: 1.0),
          borderRadius: BorderRadius.circular(AppSpaces.sm),
        )),
    // materialTapTargetSize,
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    // platform,
    // scrollbarTheme,
    // splashFactory,
    useMaterial3: true,
    // visualDensity,
    // brightness: Brightness.light,
    // canvasColor,
    // cardColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.light,
      surface: AppColors.backgroundLight,
      primary: AppColors.primaryColor,
      secondary: AppColors.primaryColor,
    ),
    // colorSchemeSeed,
    // dialogBackgroundColor,
    // disabledColor,
    // dividerColor,
    // focusColor,
    // highlightColor,
    // hintColor,
    // hoverColor,
    // indicatorColor,
    // primaryColor,
    // primaryColorDark,
    // primaryColorLight,
    // primarySwatch
    scaffoldBackgroundColor: AppColors.backgroundLight,
    // secondaryHeaderColor,
    // shadowColor,
    // splashColor,
    unselectedWidgetColor: Colors.white,

    /* TYPOGRAPHY & ICONOGRAPHY */
    fontFamily: body,
    // fontFamilyFallback,
    // package,
    // iconTheme,
    // primaryIconTheme,
    // primaryTextTheme : TextTheme(),
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontSize: 57.0,
          fontFamily: body,
          color: AppColors.greyText,
          fontWeight: FontWeight.w400),
      displayMedium: TextStyle(
          fontSize: 45.0,
          fontFamily: body,
          color: AppColors.greyText,
          fontWeight: FontWeight.w400),
      displaySmall: TextStyle(
          fontSize: 36.0,
          fontFamily: body,
          color: AppColors.greyText,
          fontWeight: FontWeight.w400),
      headlineLarge: TextStyle(
          fontSize: 32.0,
          fontFamily: body,
          color: AppColors.greyText,
          fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(
          fontSize: 28.0,
          fontFamily: body,
          color: AppColors.greyText,
          fontWeight: FontWeight.w400),
      headlineSmall: TextStyle(
          fontSize: 24.0,
          fontFamily: body,
          color: AppColors.greyText,
          fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          fontSize: 22.0,
          fontFamily: body,
          color: AppColors.greyText,
          fontWeight: FontWeight.w400),
      titleMedium: TextStyle(
          fontSize: 16.0,
          fontFamily: body,
          color: AppColors.greyText,
          fontWeight: FontWeight.w400),
      titleSmall: TextStyle(
          fontSize: 14.0,
          fontFamily: body,
          color: AppColors.greyText,
          fontWeight: FontWeight.w400),
      labelLarge: TextStyle(
          fontSize: 14.0,
          fontFamily: body,
          color: AppColors.greyText,
          fontWeight: FontWeight.w400),
      labelMedium: TextStyle(
          fontSize: 12.0,
          fontFamily: body,
          color: AppColors.greyText,
          fontWeight: FontWeight.w400),
      labelSmall: TextStyle(
          fontSize: 11.0,
          fontFamily: body,
          color: AppColors.greyText,
          letterSpacing: 0.6,
          fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(
          fontSize: 16.0,
          fontFamily: body,
          color: AppColors.greyText,
          fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          fontSize: 14.0,
          fontFamily: body,
          color: AppColors.greyText,
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          fontSize: 12.0,
          fontFamily: body,
          color: AppColors.greyText,
          fontWeight: FontWeight.w400),
    ),
    // typography,

    /* COMPONENT THEMES */
    // appBarTheme,
    // badgeTheme,
    // bannerTheme,
    // bottomAppBarTheme,
    // bottomNavigationBarTheme,
    // bottomSheetTheme,
    // buttonBarTheme,
    // buttonTheme,
    // cardTheme,
    // checkboxTheme,
    // chipTheme,
    // dataTableTheme,
    // dialogTheme,
    // dividerTheme,
    // drawerTheme,
    // dropdownMenuTheme,
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.transparent),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
      ),
    ),
    // expansionTileTheme,
    // filledButtonTheme,
    // floatingActionButtonTheme,
    // iconButtonTheme,
    // listTileTheme,
    // menuBarTheme,
    // menuButtonTheme,
    // menuTheme,
    // navigationBarTheme,
    // navigationDrawerTheme,
    // navigationRailTheme,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        side: BorderSide(
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    ),
    // popupMenuTheme,
    // progressIndicatorTheme,
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all<Color>(AppColors.primaryColor),
    ),
    // segmentedButtonTheme,
    // sliderTheme,
    // snackBarTheme,
    // switchTheme,
    // tabBarTheme,
    // textButtonTheme,
    // textSelectionTheme,
    // timePickerTheme,
    // toggleButtonsTheme,
    // tooltipTheme,
  );

  /// Default Dark Theme Configuration
  static ThemeData darkTheme = ThemeData();
}
