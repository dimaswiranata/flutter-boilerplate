import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterboilerplate/cores/index.dart';

class Ratio {
  final double? height, width;
  Ratio({this.height, this.width});
}

class MediaHelper {
  MediaHelper._();

  static Ratio calculateRatio(double width, {String? ratio}) {
    switch (ratio) {
      case '16:9':
        return Ratio(width: width, height: width * 0.5625);
      case '3:2':
        return Ratio(width: width, height: width * (2 / 3));
      case '2:1':
        return Ratio(width: width, height: width * 0.5);
      case '2:3':
        return Ratio(width: width, height: width * 1.5);
      case '3:4':
        return Ratio(width: width, height: width * (4 / 3));
      case '4:3':
        return Ratio(width: width, height: width * 0.75);
      case '3:1':
        return Ratio(width: width, height: width * (1 / 3));
      case '5:4':
        return Ratio(width: width, height: width * (4 / 5));
      default:
        return Ratio(width: width, height: width);
    }
  }

  static double getDinamicBottomSize(BuildContext context) {
    double paddingBottom = MediaQuery.of(context).padding.bottom;
    return paddingBottom != 0 && Platform.isIOS ? paddingBottom : AppSpaces.lg;
  }

  static double getDinamicTopSize(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double getDinamicHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getDinamicWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static void statusBarDarkContent() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Brightness.dark, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness:
            Brightness.light, //<-- For iOS SEE HERE (dark icons)
      ),
    );
  }

  static void statusBarLightContent() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Brightness.light, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness:
            Brightness.dark, //<-- For iOS SEE HERE (dark icons)
      ),
    );
  }
}
