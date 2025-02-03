import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';
import 'package:pfm_ekyc/core/Extensions/size_extension.dart';
import 'package:pfm_ekyc/core/common/custom_text_style.dart';
import 'package:pfm_ekyc/core/custom/custom_button.dart';
import 'package:pfm_ekyc/gen/assets.gen.dart';
import 'package:pfm_ekyc/presentation/blocs/account_aggregator/fetch_bank_accounts/fetch_bank_account_bloc.dart';
import 'package:pfm_ekyc/presentation/screens/app_error_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                verticalGap(context.height(6)),
                Text(
                  'Congratulations !!! ',
                  style: baseTextStyle22600.copyWith(
                      color: AppColors.indicatorClr),
                  textAlign: TextAlign.center,
                ),
                verticalGap(context.height(1.5)),
                Text(
                  'You have successfully unlocked \nthe banking insights.',
                  textAlign: TextAlign.center,
                  style:
                      baseTextStyle12000.copyWith(color: AppColors.btnPrimary),
                ),
                verticalGap(context.height(2)),
                Text(
                  'Accounts',
                  style:
                      baseTextStyle14600.copyWith(color: AppColors.btnPrimary),
                ),
                verticalGap(context.height(1)),
                Text(
                  'Last refreshed today at 3:30 am',
                  style:
                      baseTextStyle14500.copyWith(color: AppColors.btnPrimary),
                ),
                verticalGap(context.height(2)),
                Container(
                    color: AppColors.primaryClr,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Balances',
                            style: baseTextStyle14600.copyWith(
                                color: AppColors.btnPrimary),
                            maxLines: 1,
                          ),
                          verticalGap(context.height(2)),
                          BlocBuilder<FetchBankAccountBloc,
                              FetchBankAccountState>(
                            builder: (context, state) {
                              if (state is FetchBankAccountLoading) {
                                return Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              }
                              if (state is FetchBankAccountFailure) {
                                return AppErrorWidget(
                                  errorType: state.errorType,
                                  error: state.errorMessage,
                                  onRetry: () => context
                                      .read<FetchBankAccountBloc>()
                                      .add(FetchBankEvent()),
                                );
                              }
                              if (state is FetchBankAccountSuccess) {
                                if (state.bankAccModel.success!) {
                                  return ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: (state.bankAccModel.data
                                                  ?.bankAccounts?.length ??
                                              0) +
                                          1,
                                      itemBuilder: (context, index) {
                                        // double totalBalance = 0;
                                        // double totatl = totalBalance +
                                        //     double.parse(state
                                        //             .bankAccModel
                                        //             .data
                                        //             ?.bankAccounts?[index + 1]
                                        //             .currentBalance ??
                                        //         '0');
                                        if (index == 0) {
                                          return bankCard(
                                              index,
                                              "Total Balance",
                                              '****',
                                              "${state.bankAccModel.data?.bankAccounts?.length ?? 0} Bank account",
                                              "");
                                        }

                                        if ((state.bankAccModel.data
                                                    ?.bankAccounts?.length ??
                                                0) ==
                                            0) {
                                          return const SizedBox.shrink();
                                        } else {
                                          return bankCard(
                                              index,
                                              state
                                                      .bankAccModel
                                                      .data
                                                      ?.bankAccounts?[index]
                                                      .bankName ??
                                                  '',
                                              state
                                                      .bankAccModel
                                                      .data
                                                      ?.bankAccounts?[index]
                                                      .maskedAccNumber ??
                                                  '',
                                              state
                                                      .bankAccModel
                                                      .data
                                                      ?.bankAccounts?[index]
                                                      .currentBalance ??
                                                  '0',
                                              "https://alicebluewebsite.s3.ap-south-1.amazonaws.com/wp-content/uploads/2022/10/16045013/logo.webp");
                                        }
                                      });
                                } else {
                                  return Center(
                                    child: Text(
                                      state.bankAccModel.message!,
                                      style: baseTextStyle14500.copyWith(
                                          color: AppColors.btnPrimary),
                                    ),
                                  );
                                }
                              }
                              return const SizedBox.shrink();
                            },
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                ontap: () {},
                child: Text(
                  'Now continue to unlock more!!',
                  style: baseTextStyle14500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card bankCard(
      int index, String title, String subtitle, String value, String? bankImg) {
    return Card(
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        leading: bankImg == null
            ? Assets.pngs.onboardingProject
                .image(width: 30, height: 30) //TODO add defatult bank logo
            : CachedNetworkImage(
                imageUrl: bankImg,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: baseTextStyle14500.copyWith(color: AppColors.btnPrimary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              value,
              style: baseTextStyle14500.copyWith(color: AppColors.btnPrimary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subtitle,
              style: baseTextStyle14500.copyWith(color: AppColors.btnPrimary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
