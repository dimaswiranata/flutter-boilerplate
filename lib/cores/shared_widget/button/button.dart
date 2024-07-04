import 'package:flutter/material.dart';

import 'package:flutterboilerplate/cores/index.dart';

class OgloButton extends StatefulWidget {
  final String text;
  final ButtonVariant? type;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? paddingHorizontal;
  final void Function() onPressed;
  final Color? bgColor;
  final Color? disableBgColor;
  final Color? disableTextColor;
  final Color? textColor;
  final Color? outlinedColor;
  final TextStyle? textStyle;
  final bool? loading;
  final bool? disabled;
  final Color? loadingColor;
  final ButtonSize? size;
  final Widget? left;
  final Widget? right;
  final Widget? child;
  final ButtonColor? color;
  final BorderRadius? borderRadius;
  final MainAxisAlignment? mainAxis;
  const OgloButton({
    super.key,
    required this.text,
    this.type = ButtonVariant.filled,
    this.buttonWidth,
    this.buttonHeight,
    this.paddingHorizontal,
    required this.onPressed,
    this.bgColor,
    this.disableBgColor,
    this.disableTextColor,
    this.textColor,
    this.outlinedColor,
    this.textStyle,
    this.loading,
    this.disabled = false,
    this.loadingColor,
    this.size = ButtonSize.large,
    this.left,
    this.right,
    this.child,
    this.color = ButtonColor.primary,
    this.borderRadius,
    this.mainAxis,
  });

  @override
  State<OgloButton> createState() => _OgloButtonState();
}

class _OgloButtonState extends State<OgloButton> {
  Widget _buildText() {
    if (widget.loading == true) {
      return OgloLoading(
        color: widget.loadingColor ?? widget.type!.value,
      );
    }
    if (widget.child != null) return widget.child!;
    if (widget.type != ButtonVariant.filled) {
      return Row(
        mainAxisAlignment: widget.mainAxis ?? MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.left ??
              Container(
                width: widget.right != null
                    ? 0
                    : (widget.paddingHorizontal ?? AppSpaces.xs),
              ),
          Flexible(
            child: Text(
              textAlign: TextAlign.center,
              widget.text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: widget.textStyle ??
                  _getTextStyle(context).copyWith(
                      color: widget.disabled == true
                          ? widget.disableTextColor ??
                              ButtonConfig.disableTextColor
                          : (widget.textColor ?? widget.color!.value)),
            ),
          ),
          widget.right ??
              Container(
                width: widget.left != null
                    ? 0
                    : (widget.paddingHorizontal ?? AppSpaces.xs),
              ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: widget.mainAxis ?? MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.left ??
              Container(
                width: widget.right != null
                    ? 0
                    : (widget.paddingHorizontal ?? AppSpaces.xs),
              ),
          Flexible(
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: widget.textStyle ??
                  _getTextStyle(context).copyWith(
                      color: widget.disabled == true
                          ? ButtonConfig.disableFilledTextColor
                          : (widget.textColor ?? ButtonConfig.solidTextButton)),
            ),
          ),
          widget.right ??
              Container(
                width: widget.left != null
                    ? 0
                    : (widget.paddingHorizontal ?? AppSpaces.xs),
              ),
        ],
      );
    }
  }

  Widget _buildTextButton() {
    return TextButton(
        onPressed: widget.disabled == true
            ? null
            : widget.loading == true
                ? () {}
                : widget.onPressed,
        child: _buildText());
  }

  Widget _buildSolidButton() {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(AppRounds.reg),
      child: ElevatedButton(
        onPressed: widget.disabled == true
            ? null
            : widget.loading == true
                ? () {}
                : widget.onPressed,
        style:
            ButtonStyle(backgroundColor: WidgetStateColor.resolveWith((states) {
          Color color = widget.disabled == true
              ? widget.disableBgColor != null
                  ? widget.disableBgColor!
                  : ButtonConfig.disableColor
              : widget.bgColor != null
                  ? widget.bgColor!
                  : widget.color!.value;
          return color;
        })),
        child: _buildText(),
      ),
    );
  }

  Widget _buildOutlineButton() {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(AppRounds.reg),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
              color: widget.disabled == true
                  ? ButtonConfig.disableColor
                  : widget.outlinedColor ?? widget.color!.value),
          shape: RoundedRectangleBorder(
            borderRadius:
                widget.borderRadius ?? BorderRadius.circular(AppRounds.reg),
          ),
        ),
        onPressed: widget.disabled == true
            ? null
            : widget.loading == true
                ? () {}
                : widget.onPressed,
        child: _buildText(),
      ),
    );
  }

  Widget _getType() {
    switch (widget.type) {
      case ButtonVariant.outline:
        return _buildOutlineButton();
      case ButtonVariant.text:
        return _buildTextButton();
      default:
        return _buildSolidButton();
    }
  }

  double _getHeight() {
    switch (widget.size) {
      case ButtonSize.small:
        return ButtonConfig.smallHeight;
      case ButtonSize.medium:
        return ButtonConfig.mediumHeight;
      default:
        return ButtonConfig.largeHeight;
    }
  }

  TextStyle _getTextStyle(BuildContext context) {
    switch (widget.size) {
      case ButtonSize.small:
        return bodyCaption.copyWith(fontWeight: FontWeight.w500);
      case ButtonSize.medium:
        return bodyBodySm.copyWith(fontWeight: FontWeight.w500);
      default:
        return bodyBody.copyWith(fontWeight: FontWeight.w500);
    }
  }

  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width - 32;
    return Container(
      height: widget.buttonHeight ?? _getHeight(),
      width: widget.buttonWidth ?? btnWidth,
      child: _getType(),
    );
  }
}
