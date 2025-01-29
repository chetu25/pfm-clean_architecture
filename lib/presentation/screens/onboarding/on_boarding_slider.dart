import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';
import 'package:pfm_ekyc/core/Extensions/size_extension.dart';
import 'package:pfm_ekyc/core/common/custom_text_style.dart';
import 'package:pfm_ekyc/core/custom/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingSlider extends StatefulWidget {
  final BuildContext context;
  final Color? color;
  final bool? isGradient;
  final List<OnBoardingFieldData>? onboardingbannerfielddata;

  const OnBoardingSlider({
    super.key,
    required this.context,
    this.onboardingbannerfielddata,
    this.color,
    this.isGradient = false,
  });

  @override
  State<OnBoardingSlider> createState() => _OnBoardingSliderState();
}

class _OnBoardingSliderState extends State<OnBoardingSlider> {
  int currentIndex = 0;
  final CarouselSliderController carouselSliderController =
      CarouselSliderController();

  double calculateTextHeight(
      BuildContext context, String text, TextStyle style, double maxWidth) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: null,
    )..layout(maxWidth: maxWidth);
    return textPainter.size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSliderWidget(
          count: widget.onboardingbannerfielddata!.length,
          viewportFraction: 1.2,
          item: widget.onboardingbannerfielddata!.map(
            (banner) {
              return Container(
                width: context.width(90),
                padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(context.width(5)),
                  gradient: widget.isGradient!
                      ? const LinearGradient(
                          colors: [
                            AppColors.background,
                            AppColors.background,
                            AppColors.background,
                            Color.fromARGB(61, 169, 236, 230),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // if (banner.img != null)
                    //   SizedBox(
                    //     height: imageHeight,
                    //     width: imageWidth,
                    //     child: banner.img,
                    //   ),
                    banner.img!,
                    verticalGap(context.height(1)),
                    Flexible(
                      child: Text(
                        banner.txt1 ?? '',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        style: baseTextStyle12400.copyWith(
                            color: AppColors.btnPrimary),
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
          carouselSliderController: carouselSliderController,
        ),
        verticalGap(context.height(2.4)),
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: widget.onboardingbannerfielddata!.length,
          effect: CustomizableEffect(
            spacing: 16.0,
            activeDotDecoration: DotDecoration(
              width: context.width(3),
              height: context.height(1.5),
              color: AppColors.indicatorClr,
              borderRadius: BorderRadius.circular(12),
              dotBorder:
                  const DotBorder(color: AppColors.indicatorClr, width: 1.5),
            ),
            dotDecoration: DotDecoration(
              width: context.width(3),
              height: context.height(1.5),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              dotBorder: const DotBorder(color: AppColors.greyClr, width: 1.5),
            ),
          ),
        )
      ],
    );
  }
}

class OnBoardingFieldData {
  final Image? img;
  final String? txt1;

  OnBoardingFieldData({this.img, this.txt1});
}
