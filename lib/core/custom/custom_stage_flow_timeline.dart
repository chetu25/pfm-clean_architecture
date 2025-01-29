import 'package:flutter/material.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';
import 'package:pfm_ekyc/core/Extensions/size_extension.dart';
import 'package:pfm_ekyc/core/common/custom_text_style.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomStageFlowTimeline extends StatefulWidget {
  final int currentStep;

  const CustomStageFlowTimeline({super.key, required this.currentStep});

  @override
  State<CustomStageFlowTimeline> createState() =>
      _CustomStageFlowTimelineState();
}

class _CustomStageFlowTimelineState extends State<CustomStageFlowTimeline> {
  @override
  Widget build(BuildContext context) {
    final steps = [
      "PAN details",
      "Bank",
      "Personal details",
      "Profile",
      "IPV",
    ];

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(steps.length, (index) {
          final isCompleted = widget.currentStep > index;
          final isLast = index == steps.length - 1;

          return Center(
            child: SizedBox(
              width: context.width(18),
              child: TimelineTile(
                axis: TimelineAxis.horizontal,
                alignment: TimelineAlign.center,
                lineXY: 0.0,
                isFirst: index == 0,
                isLast: isLast,
                indicatorStyle: IndicatorStyle(
                  width: 18,
                  height: 18,
                  indicator: CircleAvatar(
                    radius: 6,
                    backgroundColor:
                        isCompleted ? AppColors.tickerClr : AppColors.blackClr,
                    child: isCompleted
                        ? const Icon(Icons.check,
                            color: AppColors.background, size: 12)
                        : Text(
                            "${index + 1}",
                            style: baseTextStyle10400p.copyWith(
                              color: AppColors.background,
                            ),
                          ),
                  ),
                ),
                afterLineStyle: const LineStyle(thickness: 1),
                beforeLineStyle: const LineStyle(thickness: 1),
                endChild: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      steps[index],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: baseTextStyle10400p.copyWith(
                        color: AppColors.btnPrimary,
                      ),
                    ),
                    // if (!isLast)
                    //   Padding(
                    //     padding: const EdgeInsets.only(top: 6.0),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
