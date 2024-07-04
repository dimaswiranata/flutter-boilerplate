import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutterboilerplate/cores/index.dart';

double pinLength = 6;
double pinItemHeightTheme = 64;
double pinItemWidthTheme = 56;

class OgloPin extends StatefulWidget {
  final TextEditingController pinController;

  // Validator before hit API
  final String? Function(String?)? onValidator;

  // Function triggered when pin completed
  final void Function()? onFullfil;

  // Error text after get result from hit API
  final String? errorText;

  // If errorText not null, onResetError must be not null
  final void Function()? onResetError;

  // Focus node
  final FocusNode focusNode;

  final void Function(String)? onChanged;

  const OgloPin({
    super.key,
    required this.pinController,
    this.onValidator,
    this.onFullfil,
    this.onResetError,
    this.errorText,
    this.onChanged,
    required this.focusNode,
  });

  @override
  State<OgloPin> createState() => _OgloPinState();
}

class _OgloPinState extends State<OgloPin> {
  late FocusNode _pinputFocusNode;
  String _errorText = '';

  @override
  void initState() {
    super.initState();
    if (widget.errorText != null && widget.onResetError == null) {
      throw ArgumentError(
          'onResetError must be provided when errorText is not null, example : setState(() => errorText = '
          ');');
    }
    _pinputFocusNode = widget.focusNode;
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
      style: bodyBodySm.copyWith(
          color: AppColors.error, fontWeight: FontWeight.w300),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildInactivePin(int index) {
    bool isError = _errorText.isNotEmpty ||
        (widget.errorText != null && widget.errorText!.isNotEmpty);
    return OgloContainer(
      width: pinItemWidthTheme,
      height: pinItemHeightTheme,
      alignment: Alignment.center,
      mainAxis: MainAxisAlignment.center,
      children: [
        OgloContainer(
          height: AppSpaces.lg,
          width: AppSpaces.lg,
          bgColor: Colors.transparent,
          borderRadius: AppRounds.full,
          borderWidth: 1,
          borderColor: isError
              ? AppColors.error
              : (widget.pinController.text.length == index + 1
                  ? Colors.transparent
                  : const Color(0xFF828282)),
        ),
      ],
    );
  }

  Widget _buildActivePin() {
    return OgloContainer(
      width: pinItemWidthTheme,
      height: pinItemHeightTheme,
      alignment: Alignment.center,
      mainAxis: MainAxisAlignment.center,
      children: const [
        OgloContainer(
          height: AppRounds.lg,
          width: AppRounds.lg,
          borderRadius: AppRounds.full,
          borderWidth: 1,
          borderColor: AppColors.primaryColor,
          mainAxis: MainAxisAlignment.center,
          crossAxis: CrossAxisAlignment.center,
          children: [
            OgloContainer(
              height: AppSpaces.reg,
              width: AppSpaces.reg,
              borderRadius: AppRounds.full,
              bgColor: AppColors.primaryColor,
            )
          ],
        ),
      ],
    );
  }

  Widget _buildInputPin() {
    return OgloContainer(
      width: double.infinity,
      crossAxis: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            OgloContainer(
              mainAxis: MainAxisAlignment.center,
              flexDir: FlexDirection.ROW,
              children: [
                for (var i = 0; i < pinLength; i++) _buildInactivePin(i),
              ],
            ),
            PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              autoDisposeControllers: false,
              autoDismissKeyboard: true,
              appContext: context,
              length: pinLength.toInt(),
              controller: widget.pinController,
              focusNode: _pinputFocusNode,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                fieldWidth: pinItemWidthTheme,
                fieldHeight: pinItemHeightTheme,
                activeColor: Colors.transparent,
                inactiveColor: Colors.transparent,
                selectedColor: Colors.transparent,
                borderWidth: 0,
                activeBorderWidth: 0,
                errorBorderWidth: 0,
                inactiveBorderWidth: 0,
                disabledBorderWidth: 0,
                selectedBorderWidth: 0,
                fieldOuterPadding: EdgeInsets.zero,
              ),
              textStyle: bodyH1.copyWith(
                fontSize: 32,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w700,
              ),
              pastedTextStyle: bodyH1.copyWith(
                fontSize: 32,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w200,
              ),
              obscuringWidget: _buildActivePin(),
              showCursor: false,
              cursorColor: AppColors.greyText,
              cursorHeight: 16,
              blinkWhenObscuring: true,
              blinkDuration: const Duration(milliseconds: 400),
              animationCurve: Curves.easeInOut,
              animationType: AnimationType.scale,
              animationDuration: const Duration(milliseconds: 400),
              // separatorBuilder: (context, index) => SizedBox(width: space.xs),
              keyboardType: TextInputType.number,
              hapticFeedbackTypes: HapticFeedbackTypes.selection,
              onCompleted: (value) {
                if (widget.onValidator != null) {
                  String? validatorResult = widget.onValidator!(value);
                  if (validatorResult != null) {
                    setState(() {
                      _errorText = validatorResult;
                    });
                    widget.pinController.text = '';
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
              onChanged: (value) {
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
                setState(() {});
              },
            ),
          ],
        ),
        _buildErrorText()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildInputPin();
  }
}
