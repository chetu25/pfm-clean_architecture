import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';
import 'package:pfm_ekyc/core/Extensions/size_extension.dart';
import 'package:pfm_ekyc/core/common/custom_text_style.dart';
import 'package:pfm_ekyc/core/custom/custom_button.dart';
import 'package:pfm_ekyc/gen/assets.gen.dart';
import 'package:pfm_ekyc/routes/route.dart';

class CongratulationsScreen extends StatefulWidget {
  const CongratulationsScreen({super.key});

  @override
  State<CongratulationsScreen> createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();

    _confettiController = ConfettiController(
      duration: const Duration(seconds: 4),
    );
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.stop();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width(5)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Congratulations !!!',
                  textAlign: TextAlign.center,
                  style: baseTextStyle22700.copyWith(
                      color: AppColors.indicatorClr),
                ),
                verticalGap(context.height(2)),
                Text(
                  'Your financial information is successfully fetched. '
                  'You are officially entered into the 1st step of unlocking your financial information.',
                  textAlign: TextAlign.center,
                  style: baseTextStyle14500,
                ),
                verticalGap(context.height(5)),
                Assets.gifs.a011UnlockedFolder.image(
                  // fit: BoxFit.cover,
                  height: context.height(9),
                  width: context.width(20),
                ),
                verticalGap(context.height(3)),
                Text(
                  'Now help us with a few more details while we transform your data into attractive insights.',
                  textAlign: TextAlign.center,
                  style: baseTextStyle14500,
                ),
              ],
            ),
            ConfettiWidget(
              blastDirectionality: BlastDirectionality.explosive,
              confettiController: _confettiController,
              particleDrag: 0.05,
              emissionFrequency: 0.05,
              numberOfParticles: 50,
              gravity: 0.1,
              colors: const [
                Color.fromARGB(255, 245, 22, 6),
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.orange,
                Colors.purple,
              ],
              minimumSize: const Size(4, 4),
              maximumSize: const Size(8, 8),
            ),
          ],
        ),
      ),
      bottomSheet: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            ontap: () {
              context.push(Routes.onboarding);
            },
            child: Text(
              'Continue',
              style: baseTextStyle14500,
            ),
          ),
        ),
      ),
    ));
  }
}
