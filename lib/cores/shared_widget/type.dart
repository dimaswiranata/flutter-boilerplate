import 'package:flutter/material.dart';
import 'package:flutterboilerplate/cores/index.dart';

enum ButtonSize { large, medium, small }

enum ButtonVariant { outline, filled, text }

enum ButtonColor { primary, secondary }

extension ButtonVariantExt on ButtonVariant {
  Color get value {
    switch (this) {
      case ButtonVariant.filled:
        return Colors.white;
      case ButtonVariant.outline:
        return AppColors.primaryColor;
      case ButtonVariant.text:
        return AppColors.primaryColor;
    }
  }
}

extension ButtonColorExt on ButtonColor {
  Color get value {
    switch (this) {
      case ButtonColor.primary:
        return AppColors.primaryColor;
      case ButtonColor.secondary:
        return AppColors.secondaryGold;
    }
  }
}

enum TrimMode { Length, Line }

enum ShimmerType {
  bodySmall,
  bodyMedium,
  bodyLarge,
  labelSmall,
  labelMedium,
  labelLarge,
  titleSmall,
  titleMedium,
  titleLarge,
  headlineSmall,
  headlineMedium,
  headlineLarge,
  displaySmall,
  displayMedium,
  displayLarge,
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  body,
  bodySm,
  caption,
  captionSm,
  captionXs,
  title,
  subtitle
}

enum FlexDirection { ROW, COLUMN }

enum ToastVariant { outline, filled, boxless }

enum ToastType { ERROR, WARNING, SUCCESS, INFO, APP }

enum ToastPosition { TOP, BOTTOM, SNACKBAR }

extension ToastPositionExt on ToastPosition {
  ToastGravity get value {
    switch (this) {
      case ToastPosition.TOP:
        return ToastGravity.TOP;
      case ToastPosition.BOTTOM:
        return ToastGravity.BOTTOM;
      case ToastPosition.SNACKBAR:
        return ToastGravity.SNACKBAR;
    }
  }
}

enum OpacityType {
  FADE_IN,
  FADE_OUT,
}

enum TabbarType {
  DEFAULT,
  CAPSULE,
  CAPSULE_GROUP,
}

enum CardType {
  Master,
  Visa,
  Verve,
  Discover,
  AmericanExpress,
  DinersClub,
  Jcb,
  Others,
  Invalid
}

enum ToastGravity {
  TOP,
  BOTTOM,
  CENTER,
  TOP_LEFT,
  TOP_RIGHT,
  BOTTOM_LEFT,
  BOTTOM_RIGHT,
  CENTER_LEFT,
  CENTER_RIGHT,
  SNACKBAR,
  NONE
}
