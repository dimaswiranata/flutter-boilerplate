import 'package:flutter/cupertino.dart';
import 'package:flutterboilerplate/cores/index.dart';

class OgloCheckbox extends StatelessWidget {
  const OgloCheckbox(
      {super.key,
      this.height,
      this.width,
      required this.value,
      required this.onChanged});
  final bool value;
  final void Function(dynamic) onChanged;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 24,
      width: width ?? 36,
      child: FittedBox(
        fit: BoxFit.fill,
        child: CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          trackColor: AppColors.disable,
          activeColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
