import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';
import 'package:pfm_ekyc/core/Extensions/size_extension.dart';
import 'package:pfm_ekyc/core/common/custom_text_style.dart';
import 'package:pfm_ekyc/core/custom/custom_appbar.dart';
import 'package:pfm_ekyc/core/custom/custom_button.dart';
import 'package:pfm_ekyc/core/custom/custom_rich_text.dart';
import 'package:pfm_ekyc/gen/assets.gen.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/get_profile/get_profile_bloc.dart';
import 'package:pfm_ekyc/presentation/screens/app_error_widget.dart';
import 'package:pfm_ekyc/presentation/screens/account_aggregator/aggregator_slider.dart';
import 'package:pfm_ekyc/routes/route.dart';

class AccountAggregator extends StatefulWidget {
  const AccountAggregator({super.key});

  @override
  State<AccountAggregator> createState() => _AccountAggregatorState();
}

class _AccountAggregatorState extends State<AccountAggregator> {
  bool isFirst = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: transparantAppbar(
          ctx: context,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width(5)),
              child: Column(
                children: [
                  verticalGap(context.height(2)),
                  BlocBuilder<GetProfileBloc, GetProfileState>(
                    builder: (context, state) {
                      if (state is GetProfileError) {
                        return AppErrorWidget(
                          errorType: state.errorType,
                          error: state.errorMessage,
                          onRetry: () => context
                              .read<GetProfileBloc>()
                              .add(FetchProfileEvent()),
                        );
                      }
                      if (state is GetProfileLoaded) {
                        return Text(
                          'WOW ${state.profileModel.data?.name ?? ''}',
                          textAlign: TextAlign.center,
                          style: baseTextStyle24800.copyWith(
                            color: AppColors.indicatorClr,
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  verticalGap(context.height(1)),
                  Text(
                    'You are few clicks away from unlocking your\npersonal finance management journey',
                    textAlign: TextAlign.center,
                    style: baseTextStyle12000,
                  ),
                  verticalGap(context.height(12)),
                  Assets.pngs.aggregator.image(height: 100, width: 195),
                  AggregatorSlider(
                    context: context,
                    isGradient: true,
                    aggregatorFieldData: [
                      AggregatorFieldData(
                        txt:
                            'Now continue to the account aggregator journey to provide the banking and financial information',
                      ),
                      AggregatorFieldData(
                        txt:
                            'Check some exciting benefits of account aggregator',
                      ),
                      AggregatorFieldData(
                        txt: 'See all your financial data in one place',
                      ),
                      AggregatorFieldData(
                        txt: 'Easily link your financial and banking accounts',
                      ),
                      AggregatorFieldData(
                        txt: 'Data fetched securely through One Money account',
                      ),
                    ],
                  ),
                  verticalGap(context.height(3)),
                  CustomRichText(
                    textAlign: TextAlign.center,
                    textSpan: [
                      TextSpan(
                        text: 'Note',
                        style: baseTextStyle10000.copyWith(
                            color: AppColors.indicatorClr),
                      ),
                      TextSpan(
                        text:
                            ' : OneMoney is an RBI licensed Account Aggregator\nto help citizens securely share their data',
                        style: baseTextStyle10000.copyWith(
                            color: AppColors.btnPrimary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              ontap: () {
                FocusScope.of(context).unfocus();
                context.push(Routes.setuWeb);
              },
              child: Text(
                'Continue',
                style: baseTextStyle14500.copyWith(color: AppColors.background),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
