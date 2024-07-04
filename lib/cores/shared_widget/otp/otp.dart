import 'package:flutter/material.dart';
import 'package:flutterboilerplate/cores/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

double otpLength = 4;
double otpItemHeightTheme = 64;
double otpItemWidthTheme = 48;

class OgloOtp extends StatefulWidget {
  final TextEditingController otpController;

  // Validator before hit API
  final String? Function(String?)? onValidator;

  // Function triggered when pin completed
  final void Function()? onFullfil;

  // Error text after get result from hit API
  final String? errorText;

  // If errorText not null, onResetError must be not null
  final void Function()? onResetError;

  const OgloOtp(
      {super.key,
      required this.otpController,
      this.onValidator,
      this.onFullfil,
      this.onResetError,
      this.errorText});

  @override
  State<OgloOtp> createState() => _OgloOtpState();
}

class _OgloOtpState extends State<OgloOtp> {
  final _pinputFocusNode = FocusNode();
  String _errorText = '';

  @override
  void initState() {
    super.initState();
    if (widget.errorText != null && widget.onResetError == null) {
      throw ArgumentError(
          'onResetError must be provided when errorText is not null, example : setState(() => errorText = '
          ');');
    }
    _pinputFocusNode.requestFocus();
  }

  Widget _buildErrorText() {
    String errorText = '';
    if (_errorText.isNotEmpty) {
      errorText = _errorText;
    }
    if (widget.errorText != null && widget.errorText!.isNotEmpty) {
      errorText = widget.errorText!;
    }
    return Text(
      errorText,
      style: bodyCaption.copyWith(
          color: AppColors.error, fontWeight: FontWeight.w300),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildInputOtp() {
    return OgloContainer(
      width: double.infinity,
      crossAxis: CrossAxisAlignment.center,
      children: [
        PinCodeTextField(
          mainAxisAlignment: MainAxisAlignment.center,
          autoDisposeControllers: false,
          autoDismissKeyboard: true,
          appContext: context,
          length: otpLength.toInt(),
          controller: widget.otpController,
          focusNode: _pinputFocusNode,
          pinTheme: PinTheme(
            fieldOuterPadding:
                const EdgeInsets.symmetric(horizontal: AppSpaces.sm),
            shape: PinCodeFieldShape.underline,
            fieldWidth: otpItemWidthTheme,
            fieldHeight: otpItemHeightTheme,
            activeColor: AppColors.border,
            inactiveColor: _errorText.isNotEmpty ||
                    (widget.errorText != null && widget.errorText!.isNotEmpty)
                ? AppColors.error
                : AppColors.border,
            selectedColor: AppColors.primaryColor,
          ),
          textStyle: bodyH1.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w400,
            height: 1.50,
          ),
          pastedTextStyle: bodyH1.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w400,
            height: 1.50,
          ),
          animationCurve: Curves.easeInOut,
          animationType: AnimationType.scale,
          animationDuration: const Duration(milliseconds: 400),
          showCursor: true,
          cursorColor: AppColors.primaryColor,
          cursorHeight: 34,
          cursorWidth: 1,
          hapticFeedbackTypes: HapticFeedbackTypes.selection,
          keyboardType: TextInputType.number,
          onCompleted: (value) {
            if (widget.onValidator != null) {
              String? validatorResult = widget.onValidator!(value);
              if (validatorResult != null) {
                setState(() {
                  _errorText = validatorResult;
                });
                widget.otpController.text = '';
                return;
              }
            }
            if (widget.onFullfil != null) {
              _pinputFocusNode.unfocus();
              widget.onFullfil!();
            }
          },
          onTap: () {
            if (widget.onResetError != null) {
              widget.onResetError!();
            }
            setState(() {
              if (_errorText.isNotEmpty) {
                setState(() {
                  _errorText = '';
                });
              }
            });
            _pinputFocusNode.requestFocus();
          },
          onChanged: (value) {},
        ),
        _buildErrorText()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildInputOtp();
  }
}
