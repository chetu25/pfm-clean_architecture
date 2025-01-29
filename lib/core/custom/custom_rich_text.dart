import 'package:flutter/material.dart';
import 'package:pfm_ekyc/core/common/custom_text_style.dart';

class CustomRichText extends StatelessWidget {
  final String? txt1;
  final String? txt2;
  final TextStyle? style1;
  final TextStyle? style2;
  final List<InlineSpan>? textSpan;
  final TextAlign textAlign;

  const CustomRichText({
    super.key,
    this.txt1,
    this.txt2,
    this.style1,
    this.style2,
    this.textSpan,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: textAlign,
        text: TextSpan(
            style: style1 != null
                ? style2
                : baseTextStyle14500.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            children: textSpan ?? []));
  }
}
