import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutterboilerplate/cores/index.dart';

class AntiLoading extends StatelessWidget {
  const AntiLoading(
      {super.key, this.height, this.width, this.color, this.margin});
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      alignment: Alignment.center,
      child: SizedBox(
          width: width ?? 8.0,
          height: height ?? 8.0,
          child: Platform.isAndroid
              ? CircularProgressIndicator(
                  color: color ?? AppColors.primaryColor,
                  strokeWidth: 2.0,
                )
              : CupertinoActivityIndicator(
                  color: color ?? AppColors.primaryColor)),
    );
  }
}
