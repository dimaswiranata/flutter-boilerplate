import 'package:flutter/material.dart';
import 'package:flutterboilerplate/cores/index.dart';

double headerHeight = 60;

class OgloHeader extends StatelessWidget implements PreferredSizeWidget {
  const OgloHeader({
    super.key,
    this.title,
    this.alignTitle = Alignment.center,
    this.left,
    this.center,
    this.right,
    this.hideLeft = false,
    this.height,
    this.headerDecoration,
  });

  final AlignmentGeometry? alignTitle;
  final String? title;
  final Widget? left;
  final Widget? center;
  final Widget? right;
  final bool hideLeft;
  final double? height;
  final BoxDecoration? headerDecoration;

  @override
  Size get preferredSize => Size.fromHeight(height ?? headerHeight);

  Widget _buildLeft(BuildContext context) {
    if (hideLeft == true) {
      return const Opacity(
        opacity: 0,
        child: OgloContainer(
          paddingHorizontal: AppSpaces.reg,
          paddingVertical: AppSpaces.reg,
          child: Icon(
            Icons.chevron_left,
            color: AppColors.primaryColor,
          ),
        ),
      );
    }
    if (left == null) {
      return OgloContainer(
        paddingRight: AppSpaces.reg,
        paddingLeft: AppSpaces.md,
        height: headerHeight,
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.primaryColor,
        ),
      );
    }
    return left!;
  }

  Widget _buildCenter(BuildContext context) {
    if (center == null) {
      return OgloContainer(
        alignment: alignTitle,
        maxWidth: MediaQuery.of(context).size.width - (60 * 2),
        child: Text(
          title ?? '',
          style: bodyH4.copyWith(
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.left,
        ),
      );
    }
    return center!;
  }

  Widget _buildRight() {
    if (right == null) {
      return const OgloContainer(
        paddingHorizontal: AppSpaces.sm,
        paddingVertical: AppSpaces.reg,
        child: Opacity(
          opacity: 0,
          child: Icon(
            Icons.chevron_right,
            color: AppColors.primaryColor,
          ),
        ),
      );
    }

    return right!;
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return PreferredSize(
      preferredSize: preferredSize,
      child: OgloContainer(
        paddingTop: topPadding,
        height: (height ?? headerHeight) + topPadding,
        decoration: headerDecoration,
        child: OgloContainer(
          height: (height ?? headerHeight),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: _buildLeft(context),
              ),
              Align(
                alignment: Alignment.center,
                child: _buildCenter(context),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: _buildRight(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
