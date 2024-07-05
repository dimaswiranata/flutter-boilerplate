import 'package:flutter/material.dart';
import 'package:flutterboilerplate/cores/index.dart';

class OgloRadio extends StatelessWidget {
  const OgloRadio(
      {super.key,
      this.height,
      this.width,
      required this.value,
      required this.groupValue,
      required this.onChanged});
  final dynamic value;
  final dynamic groupValue;
  final void Function(dynamic) onChanged;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: Radio(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        fillColor: WidgetStateColor.resolveWith(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primaryColor;
            }
            return AppColors.primaryGrey;
          },
        ),
      ),
    );
  }
}
