import 'package:flutter/widgets.dart';
import 'package:pfm_ekyc/core/Extensions/size_extension.dart';
import 'package:pfm_ekyc/core/custom/loading.dart';

Widget imageBox(
    {double? height,
    double? width,
    Image? image,
    required BuildContext context,
    BoxFit? boxfit,
    BoxDecoration? boxdecoration}) {
  return Container(
      decoration: boxdecoration,
      height: height ?? context.height(7),
      width: width ?? context.width(66),
      child: image != null
          ? Image(
              image: image.image,
              fit: boxfit ?? BoxFit.contain,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Loader();
              },
              errorBuilder: (context, error, stackTrace) {
                return const Text('Image error');
              },
            )
          : null);
}
