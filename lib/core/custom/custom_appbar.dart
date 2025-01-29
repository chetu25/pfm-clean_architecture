import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';
import 'package:pfm_ekyc/core/common/custom_text_style.dart';
import 'package:pfm_ekyc/core/custom/custom_stage_flow_timeline.dart';

PreferredSizeWidget transparantAppbar({
  required BuildContext ctx,
  String? label,
  bool showBackButton = true,
  bool isShowStageFlow = false,
  int currentStep = 0,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: label != null && label.isNotEmpty
        ? Text(
            label,
            style: baseTextStyle14400.copyWith(color: AppColors.btnPrimary),
          )
        : const SizedBox.shrink(),
    centerTitle: true,
    leading: showBackButton
        ? BackButton(
            onPressed: () {
              ctx.pop(ctx);
            },
            color: Colors.black,
          )
        : const SizedBox.shrink(),
    flexibleSpace: isShowStageFlow & showBackButton
        ? Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: CustomStageFlowTimeline(currentStep: currentStep),
          )
        : isShowStageFlow
            ? Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: CustomStageFlowTimeline(currentStep: currentStep),
              )
            : const SizedBox.shrink(),
  );
}
