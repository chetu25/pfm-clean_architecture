import 'package:flutter/material.dart';
import 'package:pfm_ekyc/core/Extensions/size_extension.dart';
import 'package:pfm_ekyc/core/custom/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: imageBox(
              width: context.width(40),
              image: Image.network(
                'https://rise.aliceblueonline.com/assets/images/risenewlogo.png',
              ),
              context: context,
              boxfit: BoxFit.cover),
        ),
      ),
    );
  }
}
