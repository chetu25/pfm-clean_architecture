import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:pfm_ekyc/core/Extensions/size_extension.dart';
import 'package:pfm_ekyc/core/common/custom_text_style.dart';
import 'package:pfm_ekyc/core/custom/custom_appbar.dart';
import 'package:pfm_ekyc/core/custom/custom_button.dart';
import 'package:pfm_ekyc/gen/assets.gen.dart';
import 'package:pfm_ekyc/presentation/screens/onboarding/on_boarding_slider.dart';
import 'package:pfm_ekyc/routes/route.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool exit = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: exit,
        // ignore: deprecated_member_use
        onPopInvoked: (didPop) async {
          if (!exit) {
            Fluttertoast.showToast(msg: 'ress back to exit.');
          }
          exit = true;
          setState(() {});
          await Future.delayed(const Duration(seconds: 2));
          exit = false;
        },
        child: Scaffold(
          appBar: transparantAppbar(
            ctx: context,
            showBackButton: false,
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width(5)),
              child: Column(
                children: [
                  verticalGap(context.height(9)),
                  Assets.pngs.riselogo.image(
                    fit: BoxFit.contain,
                    width: context.width(50),
                  ),
                  verticalGap(context.height(2.73)),
                  Text(
                    'Welcome to RISE Personal \n Finance Management',
                    textAlign: TextAlign.center,
                    style: baseTextStyle14500,
                  ),
                  verticalGap(context.height(2)),
                  Text(
                    'The application where you can organize your income, expenses and savings to achieve financial stability and control over the financial well being.',
                    textAlign: TextAlign.center,
                    style: baseTextStyle12000,
                  ),
                  verticalGap(context.height(5)),
                  OnBoardingSlider(
                    isGradient: true,
                    context: context,
                    onboardingbannerfielddata: [
                      OnBoardingFieldData(
                        img: Assets.pngs.onboardingPhone
                            .image(width: 100, height: 100),
                        txt1:
                            'Now managing your money \n has never been easier',
                      ),
                      OnBoardingFieldData(
                          img: Assets.pngs.onboardingMoney
                              .image(width: 80, height: 80),
                          txt1:
                              'RISE helps you not only to invest but also to track your spending, other investments and helps you achieve financial goals with the newly introduced "personal finance management" tool'),
                      OnBoardingFieldData(
                          img: Assets.pngs.onboardingProject
                              .image(width: 100, height: 100),
                          txt1:
                              'Now lets get started to the easier and smarter money management'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomSheet: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.width(5), vertical: context.height(2)),
              child: CustomButton(
                ontap: () => context.push(Routes.phoneLogin),
                child: Text(
                  'Lets Go',
                  style: baseTextStyle14400.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
