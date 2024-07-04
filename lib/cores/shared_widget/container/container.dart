import 'package:flutter/material.dart';

import 'package:flutterboilerplate/cores/index.dart';

class OgloContainer extends StatelessWidget {
  const OgloContainer(
      {super.key,
      this.height,
      this.width,
      this.margin,
      this.marginLeft,
      this.marginRight,
      this.marginTop,
      this.marginBottom,
      this.marginHorizontal,
      this.marginVertical,
      this.padding,
      this.paddingLeft,
      this.paddingRight,
      this.paddingTop,
      this.paddingBottom,
      this.paddingHorizontal,
      this.paddingVertical,
      this.flexDir,
      this.isScrollable = false,
      this.scrollController,
      this.safeArea = false,
      this.expand = false,
      this.mainAxis,
      this.crossAxis,
      this.mainAxisSize,
      this.children,
      this.child,
      this.bgColor,
      this.borderRadius,
      this.borderBottomLeftRadius,
      this.borderBottomRightRadius,
      this.borderTopLeftRadius,
      this.borderTopRightRadius,
      this.shape,
      this.alignment,
      this.transform,
      this.maxHeight,
      this.maxWidth,
      this.minHeight,
      this.minWidth,
      this.borderColor,
      this.borderBottomColor,
      this.borderLeftColor,
      this.borderRightColor,
      this.borderTopColor,
      this.borderWidth,
      this.borderBottomWidth,
      this.borderLeftWidth,
      this.borderRightWidth,
      this.borderTopWidth,
      this.onTap,
      this.onLongPress,
      this.flex,
      this.decoration,
      this.boxShadow,
      this.opacity,
      this.activeOpacity,
      this.isHide});

  final double? width;
  final double? height;
  final double? margin,
      marginTop,
      marginBottom,
      marginLeft,
      marginRight,
      marginHorizontal,
      marginVertical;
  final double? padding,
      paddingTop,
      paddingBottom,
      paddingLeft,
      paddingRight,
      paddingHorizontal,
      paddingVertical;
  final FlexDirection? flexDir;
  final bool isScrollable;
  final ScrollController? scrollController;
  final bool safeArea;
  final MainAxisAlignment? mainAxis;
  final CrossAxisAlignment? crossAxis;
  final MainAxisSize? mainAxisSize;
  final List<Widget>? children;
  final Widget? child;
  final Color? bgColor;
  final double? borderRadius,
      borderTopLeftRadius,
      borderBottomLeftRadius,
      borderTopRightRadius,
      borderBottomRightRadius;
  final BoxShape? shape;
  final AlignmentGeometry? alignment;
  final Matrix4? transform;
  final double? minWidth, minHeight, maxWidth, maxHeight;
  final Color? borderColor,
      borderLeftColor,
      borderRightColor,
      borderTopColor,
      borderBottomColor;
  final double? borderWidth,
      borderLeftWidth,
      borderRightWidth,
      borderTopWidth,
      borderBottomWidth;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final int? flex;
  final Decoration? decoration;
  final List<BoxShadow>? boxShadow;
  final double? opacity;
  final bool? expand;
  final double? activeOpacity;
  final bool? isHide;

  Widget _getChild() {
    if (children == null) return const SizedBox();
    Widget child;
    if (flexDir == FlexDirection.ROW) {
      child = Row(
        mainAxisAlignment: mainAxis ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxis ?? CrossAxisAlignment.start,
        mainAxisSize: mainAxisSize ?? MainAxisSize.max,
        children: children ?? [],
      );
    } else {
      child = Column(
        mainAxisAlignment: mainAxis ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxis ?? CrossAxisAlignment.start,
        mainAxisSize: mainAxisSize ?? MainAxisSize.max,
        children: children ?? [],
      );
    }

    if (isScrollable == true) {
      child = SingleChildScrollView(
        controller: scrollController,
        scrollDirection:
            flexDir == FlexDirection.ROW ? Axis.horizontal : Axis.vertical,
        child: child,
      );
    }

    return child;
  }

  EdgeInsetsGeometry _getMargin() {
    double left = marginLeft ?? marginHorizontal ?? margin ?? AppSpaces.none;
    double right = marginRight ?? marginHorizontal ?? margin ?? AppSpaces.none;
    double top = marginTop ?? marginVertical ?? margin ?? AppSpaces.none;
    double bottom = marginBottom ?? marginVertical ?? margin ?? AppSpaces.none;

    return EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
  }

  EdgeInsetsGeometry _getPadding() {
    double left = paddingLeft ?? paddingHorizontal ?? padding ?? AppSpaces.none;
    double right =
        paddingRight ?? paddingHorizontal ?? padding ?? AppSpaces.none;
    double top = paddingTop ?? paddingVertical ?? padding ?? AppSpaces.none;
    double bottom =
        paddingBottom ?? paddingVertical ?? padding ?? AppSpaces.none;

    return EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
  }

  BorderRadiusGeometry _getBorderRadius() {
    double topRight = borderTopRightRadius ?? borderRadius ?? AppRounds.none;
    double bottomRight =
        borderBottomRightRadius ?? borderRadius ?? AppRounds.none;
    double topLeft = borderTopLeftRadius ?? borderRadius ?? AppRounds.none;
    double bottomLeft =
        borderBottomLeftRadius ?? borderRadius ?? AppRounds.none;

    return BorderRadius.only(
        topRight: Radius.circular(topRight),
        bottomRight: Radius.circular(bottomRight),
        topLeft: Radius.circular(topLeft),
        bottomLeft: Radius.circular(bottomLeft));
  }

  BoxConstraints _getConstraints() {
    return BoxConstraints(
        minWidth: minWidth ?? AppSpaces.none,
        minHeight: minHeight ?? AppSpaces.none,
        maxHeight: maxHeight ?? AppSpaces.infinity,
        maxWidth: maxWidth ?? AppSpaces.infinity);
  }

  BoxBorder _getBorder() {
    return Border(
      left: BorderSide(
        color: borderLeftColor ?? borderColor ?? Colors.transparent,
        width: borderLeftWidth ?? borderWidth ?? 0.0,
      ),
      right: BorderSide(
        color: borderRightColor ?? borderColor ?? Colors.transparent,
        width: borderRightWidth ?? borderWidth ?? 0.0,
      ),
      top: BorderSide(
        color: borderTopColor ?? borderColor ?? Colors.transparent,
        width: borderTopWidth ?? borderWidth ?? 0.0,
      ),
      bottom: BorderSide(
        color: borderBottomColor ?? borderColor ?? Colors.transparent,
        width: borderBottomWidth ?? borderWidth ?? 0.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget parent = Container(
      height: height,
      width: width,
      margin: _getMargin(),
      padding: _getPadding(),
      constraints: _getConstraints(),
      transform: transform,
      alignment: alignment,
      decoration: decoration ??
          BoxDecoration(
              color: bgColor ?? Colors.transparent,
              borderRadius: _getBorderRadius(),
              shape: shape ?? BoxShape.rectangle,
              border: _getBorder(),
              boxShadow: boxShadow ?? []),
      child: child ?? _getChild(),
    );

    if (onTap != null) {
      parent = GestureDetector(onTap: onTap!, child: parent);
    }

    if (onLongPress != null) {
      parent = GestureDetector(
        onLongPress: onLongPress!,
        child: parent,
      );
    }

    if (opacity != null) {
      parent = Opacity(opacity: opacity!, child: parent);
    }

    if (safeArea) {
      parent = SafeArea(child: parent);
    }

    if (flex != null) {
      parent = Flexible(flex: flex!, child: parent);
    }

    if (expand == true) {
      parent = Expanded(child: parent);
    }

    if (isHide == true) {
      parent = const SizedBox();
    }

    return parent;
  }
}
