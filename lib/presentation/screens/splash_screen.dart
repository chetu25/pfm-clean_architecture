import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pfm_ekyc/core/Extensions/size_extension.dart';
import 'package:pfm_ekyc/core/custom/images.dart';
import 'package:pfm_ekyc/core/custom/toast_msg.dart';
import 'package:pfm_ekyc/routes/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool exit = false;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), _gotolandingscreen1);
  }

  void _gotolandingscreen1() {
    if (mounted) {
      setState(() => isLoading = false);
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          context.go(Routes.onboarding);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: exit,
      onPopInvoked: (didPop) async {
        if (!exit) {
          toastMsg("Press back to exit.");
        }
        exit = true;
        setState(() {});
        await Future.delayed(const Duration(seconds: 2));
        exit = false;
      },
      child: Scaffold(
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
      ),
    );
  }
}
