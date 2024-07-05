import 'package:flutter/material.dart';
import 'package:flutterboilerplate/cores/index.dart';

class OgloToast extends StatelessWidget {
  final void Function()? onClose;
  final void Function()? onTap;
  final ToastType type;
  final ToastVariant variant;
  final double? rounded;
  final String? title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subTitleStyle;
  final bool showClose;
  final Widget? left;
  final Widget? right;
  final Widget? center;
  final bool hasIcon;

  const OgloToast({
    super.key,
    this.onClose,
    this.onTap,
    this.subtitle,
    this.title,
    this.titleStyle,
    this.subTitleStyle,
    this.type = ToastType.INFO,
    this.variant = ToastVariant.filled,
    this.rounded,
    this.showClose = true,
    this.left,
    this.right,
    this.center,
    this.hasIcon = false,
  });

  Color _getBackground() {
    switch (type) {
      case ToastType.ERROR:
        if (variant == ToastVariant.filled) {
          return ToastConfig.errorBaseColor;
        } else {
          return ToastConfig.errorOutlineColor;
        }
      case ToastType.WARNING:
        if (variant == ToastVariant.filled) {
          return ToastConfig.warningBaseColor;
        } else {
          return ToastConfig.warningOutlineColor;
        }

      case ToastType.SUCCESS:
        if (variant == ToastVariant.filled) {
          return ToastConfig.successBaseColor;
        } else {
          return ToastConfig.successOutlineColor;
        }
      case ToastType.INFO:
        if (variant == ToastVariant.filled) {
          return ToastConfig.infoBaseColor;
        } else {
          return ToastConfig.infoOutlineColor;
        }
      case ToastType.APP:
        if (variant == ToastVariant.filled) {
          return ToastConfig.appBaseColor;
        } else {
          return ToastConfig.appOutlineColor;
        }
    }
  }

  Color _getBaseColor() {
    switch (type) {
      case ToastType.ERROR:
        return ToastConfig.errorBaseColor;
      case ToastType.WARNING:
        return ToastConfig.warningBaseColor;
      case ToastType.SUCCESS:
        return ToastConfig.successBaseColor;
      case ToastType.INFO:
        return ToastConfig.infoBaseColor;
      case ToastType.APP:
        return ToastConfig.appBaseColor;
    }
  }

  Color _getFilledBaseColor() {
    switch (type) {
      case ToastType.ERROR:
        return ToastConfig.errorFilledBaseColor;
      case ToastType.WARNING:
        return ToastConfig.warningFilledBaseColor;
      case ToastType.SUCCESS:
        return ToastConfig.successFilledBaseColor;
      case ToastType.INFO:
        return ToastConfig.infoFilledBaseColor;
      case ToastType.APP:
        return ToastConfig.appFilledBaseColor;
    }
  }

  IconData _getIcons() {
    switch (type) {
      case ToastType.ERROR:
        return Icons.cancel;
      case ToastType.WARNING:
        return Icons.warning_rounded;
      case ToastType.SUCCESS:
        return Icons.check_circle_outline;
      case ToastType.INFO:
        return Icons.info_rounded;
      case ToastType.APP:
        return Icons.info_rounded;
    }
  }

  Widget _buildCenter(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (center != null) return center!;
    return OgloContainer(
      width: width * 0.6,
      marginLeft: AppSpaces.reg,
      children: [
        title != null
            ? Text(
                title ?? '',
                style: titleStyle ??
                    bodyBodySm.copyWith(
                      color: variant == ToastVariant.filled
                          ? _getFilledBaseColor()
                          : _getBaseColor(),
                      height: subtitle != null ? 1.3 : 1.5,
                    ),
              )
            : const SizedBox(),
        subtitle != null
            ? Text(subtitle ?? '',
                style: subTitleStyle ??
                    Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: variant == ToastVariant.filled
                            ? _getFilledBaseColor()
                            : ToastConfig.subtitleColor.withOpacity(0.6)))
            : const SizedBox(),
      ],
    );
  }

  Widget _buildIcon() {
    if (left != null) return left!;
    return SizedBox(
      child: Icon(
        _getIcons(),
        color: variant == ToastVariant.filled
            ? _getFilledBaseColor()
            : _getBaseColor(),
      ),
    );
  }

  Widget _buildLeft(BuildContext context) {
    return OgloContainer(
      flexDir: FlexDirection.ROW,
      crossAxis: CrossAxisAlignment.start,
      mainAxis: MainAxisAlignment.start,
      children: [if (hasIcon) _buildIcon(), _buildCenter(context)],
    );
  }

  Widget _buildRight() {
    if (right != null) return right!;
    if (showClose == false) return Container();
    return GestureDetector(
      onTap: onClose,
      child: Icon(
        Icons.clear,
        color: variant == ToastVariant.filled
            ? _getFilledBaseColor()
            : _getBaseColor(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap ?? () {},
      child: OgloContainer(
        width: width,
        paddingHorizontal: AppSpaces.reg,
        paddingTop: AppSpaces.md,
        paddingBottom: AppSpaces.md,
        flexDir: FlexDirection.ROW,
        borderRadius: rounded ?? AppRounds.none,
        crossAxis: subtitle != null
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        mainAxis: MainAxisAlignment.spaceBetween,
        borderColor: variant == ToastVariant.outline
            ? _getBaseColor()
            : Colors.transparent,
        bgColor: variant == ToastVariant.boxless
            ? ToastConfig.boxlessColor
            : _getBackground(),
        children: [_buildLeft(context), _buildRight()],
      ),
    );
  }
}
