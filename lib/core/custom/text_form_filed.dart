import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';
import 'package:pfm_ekyc/core/Extensions/size_extension.dart';
import 'package:pfm_ekyc/core/common/custom_text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.readonly = false,
    required this.labeltxt,
    this.labelstyle,
    this.isbordered = true,
    this.controller,
    this.validator,
    this.keyboardtype,
    required this.onChange,
    this.isMOb = false,
    this.isMail = false,
    this.isOtp = false,
    this.isDob = false,
    this.isPan = false,
    this.isName = false,
  });

  final Function(String)? onChange;
  final bool readonly;
  final String labeltxt;
  final TextStyle? labelstyle;
  final bool isbordered;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final TextInputType? keyboardtype;
  final bool isMOb;
  final bool isMail;
  final bool isOtp;
  final bool isDob;
  final bool isPan;
  final bool isName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readonly,
      controller: controller,
      cursorColor: AppColors.btnPrimary,
      onChanged: onChange,
      maxLength: _getMaxLength(),
      keyboardType: keyboardtype ?? _getKeyboardType(),
      decoration: _getInputDecoration(context),
      textCapitalization: TextCapitalization.none,
      inputFormatters: _getInputFormatters(),
      validator: validator,
    );
  }

  int? _getMaxLength() {
    if (isMOb) return 10;
    if (isOtp) return 6;
    if (isPan) return 10;
    return null;
  }

  TextInputType _getKeyboardType() {
    if (isMOb) return TextInputType.phone;
    if (isMail) return TextInputType.emailAddress;
    if (isOtp) return TextInputType.number;
    if (isDob) return TextInputType.datetime;
    if (isName) return TextInputType.text;
    return TextInputType.text;
  }

  InputDecoration _getInputDecoration(BuildContext context) {
    return InputDecoration(
      counter: const SizedBox.shrink(),
      isDense: true,
      hintText: isDob ? "DD-MM-YYYY" : null,
      hintStyle: const TextStyle(color: AppColors.greyClr),
      enabledBorder: isbordered
          ? OutlineInputBorder(
              borderSide: BorderSide(
                  width: context.width(0.3), color: AppColors.borderClr),
            )
          : const UnderlineInputBorder(),
      errorBorder: isbordered
          ? OutlineInputBorder(
              borderSide: BorderSide(
                  width: context.width(0.3), color: AppColors.indicatorClr))
          : const UnderlineInputBorder(),
      focusedErrorBorder: isbordered
          ? OutlineInputBorder(
              borderSide: BorderSide(
                  width: context.width(0.3), color: AppColors.indicatorClr))
          : const UnderlineInputBorder(),
      focusedBorder: isbordered
          ? OutlineInputBorder(
              borderSide: BorderSide(
                width: context.width(0.3),
              ),
            )
          : const UnderlineInputBorder(),
      labelText: labeltxt,
      labelStyle: labelstyle ??
          baseTextStyle14400.copyWith(
              fontWeight: FontWeight.w700, color: AppColors.blackClr),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    );
  }

  List<TextInputFormatter> _getInputFormatters() {
    if (isMOb) {
      return [
        FilteringTextInputFormatter.digitsOnly,
        FilteringTextInputFormatter.deny(RegExp(r'^[0-5]')),
      ];
    } else if (isOtp) {
      return [FilteringTextInputFormatter.digitsOnly];
    } else if (isPan) {
      return [
        UpperCaseTextFormatter(),
        FilteringTextInputFormatter.allow(RegExp("[A-Z0-9]"))
      ];
    } else if (isDob) {
      return [DobTextFormatter()];
    } else if (isName) {
      return [FilteringTextInputFormatter.allow(RegExp("[A-Za-z ]"))];
    } else {
      return [];
    }
  }
}

class DobTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final rawText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    String formattedText = _format(rawText);

    final cursorPosition = newValue.selection.baseOffset;
    final newCursorPosition =
        _getCursorPosition(rawText, formattedText, cursorPosition);

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: newCursorPosition),
    );
  }

  String _format(String value) {
    var formatted = '';
    for (int i = 0; i < value.length && i < _maxChars; i++) {
      formatted += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        formatted += '-';
      }
    }
    return formatted;
  }

  int _getCursorPosition(
      String rawText, String formattedText, int cursorPosition) {
    int adjustedPosition = cursorPosition;

    for (int i = 0; i < cursorPosition; i++) {
      if (i < formattedText.length && formattedText[i] == '-') {
        adjustedPosition++;
      }
    }

    return adjustedPosition.clamp(0, formattedText.length);
  }
}
