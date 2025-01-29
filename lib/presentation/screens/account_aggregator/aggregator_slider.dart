import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';
import 'package:pfm_ekyc/core/Extensions/size_extension.dart';
import 'package:pfm_ekyc/core/common/custom_text_style.dart';
import 'package:pfm_ekyc/core/custom/carousel_slider.dart';
import 'package:pfm_ekyc/gen/assets.gen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AggregatorSlider extends StatefulWidget {
  final BuildContext context;
  final Color? color;
  final bool? isGradient;
  final List<AggregatorFieldData>? aggregatorFieldData;

  const AggregatorSlider({
    super.key,
    required this.context,
    this.aggregatorFieldData,
    this.color,
    this.isGradient = false,
  });

  @override
  State<AggregatorSlider> createState() => _AggregatorSliderState();
}

class _AggregatorSliderState extends State<AggregatorSlider> {
  int currentIndex = 0;
  final CarouselSliderController carouselSliderController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSliderWidget(
          height: context.height(10),
          count: widget.aggregatorFieldData!.length,
          viewportFraction: 1.2,
          item: widget.aggregatorFieldData!.map(
            (field) {
              return Container(
                width: context.width(88),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.pngs.greenCheck.image(
                        height: context.height(2), width: context.width(4)),
                    horizontalGap(context.width(2)),
                    Flexible(
                      child: Text(
                        field.txt ?? '',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        style: baseTextStyle12000.copyWith(
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
        verticalGap(context.height(1)),
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: widget.aggregatorFieldData!.length,
          effect: CustomizableEffect(
            activeDotDecoration: DotDecoration(
              color: AppColors.blackClr,
              borderRadius: BorderRadius.circular(12),
              dotBorder: const DotBorder(color: AppColors.blackClr, width: 1.5),
            ),
            dotDecoration: DotDecoration(
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

class AggregatorFieldData {
  final String? txt;

  AggregatorFieldData({this.txt});
}
