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

enum OpacityType {
  FADE_IN,
  FADE_OUT,
}

enum TabbarType {
  DEFAULT,
  CAPSULE,
  CAPSULE_GROUP,
}
