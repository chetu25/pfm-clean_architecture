import 'package:flutter/material.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';
import 'package:pfm_ekyc/core/common/custom_text_style.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void topsnackBar(BuildContext context, String message,
    {int duration = 1400, VoidCallback? onTap}) {
  showTopSnackBar(
      Overlay.of(context),
      Material(
        color: Colors.transparent,
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Container(
                  width: 8,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(4)),
                      color: AppColors.btnPrimary,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.btnPrimary.withAlpha(46),
                            blurRadius: 10)
                      ])),
              Expanded(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(4)),
                      color: AppColors.background,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.btnPrimary.withAlpha(46),
                            blurRadius: 10)
                      ]),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      message,
                      maxLines: 5,
                      style: baseTextStyle10400p,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      animationDuration: const Duration(milliseconds: 1200),
      displayDuration: Duration(milliseconds: duration),
      onTap: onTap);
}
