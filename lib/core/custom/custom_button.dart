import 'package:flutter/material.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';

enum ButtonStyleType { filled, notFilled }

class CustomButton extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? boaderColor;
  final double? radius;
  final double? height;
  final double? elevation;
  final double? width;
  final VoidCallback? ontap;

  const CustomButton({
    super.key,
    this.backgroundColor,
    this.boaderColor,
    this.radius,
    this.width,
    this.elevation,
    this.height,
    required this.ontap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.btnPrimary,
          elevation: elevation ?? 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 5),
            side: BorderSide(color: boaderColor ?? AppColors.primaryWhite),
          ),
          fixedSize: Size(width ?? 365, height ?? 42),
        ),
        child: child);
  }
}
