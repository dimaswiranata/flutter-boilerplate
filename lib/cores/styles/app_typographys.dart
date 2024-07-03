import 'package:flutter/material.dart';
import 'package:flutterboilerplate/cores/index.dart';

class AppTypographys {
  AppTypographys._();

  static const double h1 = 28.0;
  static const double h2 = 24.0;
  static const double h3 = 20.0;
  static const double h4 = 18.0;
  static const double h5 = 16.0;
  static const double h6 = 14.0;
  static const double body = 16.0;
  static const double bodySm = 14.0;
  static const double caption = 12.0;
  static const double captionSm = 10.0;
  static const double captionXs = 8.0;
  static const double title = 16.0;
  static const double subtitle = 12.0;
}

String body = 'Satoshi';

TextStyle bodyH1 = TextStyle(
  fontFamily: body,
  fontSize: AppTypographys.h1, // 28.0
  color: AppColors.primaryColor,
);

TextStyle bodyH2 = TextStyle(
  fontFamily: body,
  fontSize: AppTypographys.h2, // 24.0
  color: AppColors.primaryColor,
);

TextStyle bodyH3 = TextStyle(
  fontFamily: body,
  fontSize: AppTypographys.h3, // 20.0
  color: AppColors.primaryColor,
);

TextStyle bodyH4 = TextStyle(
  fontFamily: body,
  fontSize: AppTypographys.h4, // 18.0
  color: AppColors.primaryColor,
);

TextStyle bodyH5 = TextStyle(
  fontFamily: body,
  fontSize: AppTypographys.h5, // 16.0
  color: AppColors.primaryColor,
);

TextStyle bodyH6 = TextStyle(
  fontFamily: body,
  fontSize: AppTypographys.h6, // 14.0
  color: AppColors.primaryColor,
);

TextStyle bodyBody = TextStyle(
  fontFamily: body,
  fontSize: AppTypographys.body, // 16.0
  color: AppColors.primaryColor,
);

TextStyle bodyBodySm = TextStyle(
    fontFamily: body,
    fontSize: AppTypographys.bodySm, // 14.0
    color: AppColors.primaryColor);

TextStyle bodyCaption = TextStyle(
  fontFamily: body,
  fontSize: AppTypographys.caption, // 12.0
  color: AppColors.primaryColor,
);

TextStyle bodyCaptionSm = TextStyle(
  fontFamily: body,
  fontSize: AppTypographys.captionSm, // 10.0
  color: AppColors.primaryColor,
);

TextStyle bodyCaptionXs = TextStyle(
  fontFamily: body,
  fontSize: AppTypographys.captionXs, // 8.0
  color: AppColors.primaryColor,
);

TextStyle bodyTitle = TextStyle(
  fontFamily: body,
  fontSize: AppTypographys.title, // 16.0
  color: AppColors.primaryColor,
);

TextStyle bodySubtitle = TextStyle(
  fontFamily: body,
  fontSize: AppTypographys.subtitle, // 12.0
  color: AppColors.primaryColor,
);
