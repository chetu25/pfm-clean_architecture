import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pfm_ekyc/data/models/authentication/stage_model.dart';
import 'package:pfm_ekyc/routes/route.dart';

class CheckStage {
  static void checkStage(StageModel stageModel, BuildContext context) {
    if (stageModel.data!.email == false) {
      context.push(Routes.emailLogin);
    } else if (stageModel.data!.panNumber == false ||
        stageModel.data!.dob == false) {
      context.push(Routes.panVerification);
    } else if (stageModel.data?.aaConsentStatus == null ||
        !stageModel.data!.aaConsentStatus!
                .toLowerCase()
                .contains('COMPLETED') &&
            !stageModel.data!.aaConsentStatus!
                .toLowerCase()
                .contains('ACTIVE')) {
      context.push(Routes.accountAggregator);
    } else if (stageModel.data!.aaConsentStatus!
            .toLowerCase()
            .contains('COMPLETED') &&
        stageModel.data!.aaConsentStatus!.toLowerCase().contains('ACTIVE')) {
      context.push(Routes.congratulationsScreen);
    } else {
      context.push(Routes.dashboardScreen);
    }
  }
}
