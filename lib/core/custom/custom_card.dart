import 'package:flutter/material.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';
import 'package:pfm_ekyc/core/Extensions/size_extension.dart';
import 'package:pfm_ekyc/core/custom/images.dart';

class CustomCard extends StatelessWidget {
  final Image? image;
  final String? txt1;

  final TextStyle? txt1style;
  final double? height;
  final double? imageHeight;
  final double? imageWidth;
  final double? vertical;
  final double? horizontal;
  final bool isGradient;
  final bool isCheckbox;
  final TextAlign? textAlign;
  final Border? border;
  final BorderRadius? borderRadius;
  final double? gap;
  final bool space;
  final Color? color;

  const CustomCard({
    super.key,
    this.image,
    this.txt1,
    this.txt1style,
    this.height,
    this.imageHeight,
    this.imageWidth,
    this.isGradient = true,
    this.isCheckbox = false,
    this.vertical,
    this.horizontal,
    this.textAlign,
    this.border = const Border(),
    this.borderRadius,
    this.gap,
    this.space = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      padding: EdgeInsets.symmetric(
          horizontal: horizontal ?? 16, vertical: vertical ?? 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(context.width(5)),
        border: border,
        gradient: isGradient
            ? const LinearGradient(colors: [
                AppColors.background,
                AppColors.background,
                AppColors.background,
                Color.fromARGB(61, 169, 236, 230),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
            : null,
      ),
      child: Column(
        children: [
          if (image != null)
            imageBox(
                context: context,
                image: image,
                width: imageWidth ?? 80,
                height: imageHeight ?? 80,
                boxfit: BoxFit.contain),
          Text(
            softWrap: true,
            txt1 ?? '',
            textAlign: textAlign ?? TextAlign.start,
            style: txt1style ??
                const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
