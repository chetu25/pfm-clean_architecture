import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';
import 'package:pfm_ekyc/core/Extensions/size_extension.dart';
import 'package:pfm_ekyc/core/common/custom_text_style.dart';
import 'package:pfm_ekyc/core/common/validators.dart';
import 'package:pfm_ekyc/core/custom/custom_appbar.dart';
import 'package:pfm_ekyc/core/custom/custom_button.dart';
import 'package:pfm_ekyc/core/custom/text_form_filed.dart';
import 'package:pfm_ekyc/core/custom/timer.dart';
import 'package:pfm_ekyc/domain/entities/get_email_otp_params.dart';
import 'package:pfm_ekyc/domain/entities/verify_email_otp_params.dart';
import 'package:pfm_ekyc/gen/assets.gen.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/get_email_otp/get_email_otp_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/get_stage/get_stage_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/verify_email_otp/verify_email_otp_bloc.dart';
import 'package:pfm_ekyc/presentation/screens/app_error_widget.dart';
import 'package:pfm_ekyc/presentation/screens/login/check_stage.dart';

class LoginWithEmailScreen extends StatefulWidget {
  const LoginWithEmailScreen({
    super.key,
  });
  @override
  State<LoginWithEmailScreen> createState() => _LoginWithEmailScreenState();
}

class _LoginWithEmailScreenState extends State<LoginWithEmailScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController namecntrllr = TextEditingController();
  final TextEditingController emailidcntrllr = TextEditingController();
  final TextEditingController otpcntrllr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: BlocListener<GetStageBloc, GetStageState>(
          listener: (context, state) {
            if (state is GetStageSuccess) {
              if (state.stageModel.success!) {
                CheckStage.checkStage(state.stageModel, context);
              }
            }
          },
          child: Scaffold(
            appBar: transparantAppbar(ctx: context, showBackButton: true),
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: context.width(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: context.height(27),
                    width: width(context),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.background,
                          Color.fromARGB(255, 183, 221, 236),
                          Color.fromARGB(255, 151, 213, 237),
                        ],
                        stops: [0.0, 0.9, 1.0],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Assets.gifs.loginGif.image(fit: BoxFit.cover),
                  ),
                  verticalGap(context.height(2.1)),
                  Center(
                    child: Text(
                      "Let's Get Started...!",
                      style: baseTextStyle14600.copyWith(
                          color: AppColors.btnPrimary),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Provide your mobile number and email to unlock\nseamless experience with Alice Blue',
                      style: baseTextStyle10500.copyWith(
                          color: AppColors.btnPrimary),
                    ),
                  ),
                  verticalGap(context.height(3.4)),
                  Text(
                    'Enter Details',
                    style: baseTextStyle14600,
                    // textAlign: TextAlign.left,
                  ),
                  verticalGap(context.height(2.6)),
                  Form(
                    key: formKey,
                    child: BlocBuilder<GetEmailOtpBloc, GetEmailOtpState>(
                      builder: (context, state) {
                        if (state is GetEmailOtpFailure) {
                          return AppErrorWidget(
                            errorType: state.errorType,
                            error: state.errorMessage,
                            onRetry: () => context.read<GetEmailOtpBloc>().add(
                                  Emailotp(
                                    param: GetEmailOtpparams(
                                        email: emailidcntrllr.text),
                                  ),
                                ),
                          );
                        }

                        return Column(
                          children: [
                            CustomTextField(
                              labeltxt: "Email Id",
                              controller: emailidcntrllr,
                              validator: Validators.validateMobileNumber,
                              onChange: (value) {
                                if (state is GetEmailOtpSuccess) {
                                  context
                                      .read<GetEmailOtpBloc>()
                                      .add(StateChange());
                                }
                                otpcntrllr.clear();
                              },
                            ),
                            state is GetEmailOtpSuccess
                                ? !state.getEmailOtpModel.success!
                                    ? Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          state.getEmailOtpModel.message ?? '',
                                          style: baseTextStyle12000.copyWith(
                                            color: const Color.fromARGB(
                                                255, 140, 15, 7),
                                          ),
                                        ),
                                      )
                                    : BlocBuilder<VerifyEmailOtpBloc,
                                        VerifyEmailOtpState>(
                                        builder: (context, state) {
                                          return Column(
                                            children: [
                                              verticalGap(context.height(3.4)),
                                              CustomTextField(
                                                isOtp: true,
                                                labeltxt: "Enter OTP",
                                                controller: otpcntrllr,
                                                validator:
                                                    Validators.validateOtp,
                                                onChange: (p0) {
                                                  if (state
                                                      is VerifyEmailOtpSuccess) {
                                                    if (!state
                                                        .verifyEmailOtpModel
                                                        .success!) {
                                                      context
                                                          .read<
                                                              VerifyEmailOtpBloc>()
                                                          .add(ChangeState());
                                                    }
                                                  }
                                                },
                                              ),
                                              verticalGap(context.height(1)),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  state is VerifyEmailOtpSuccess
                                                      ? !state.verifyEmailOtpModel
                                                              .success!
                                                          ? Text(
                                                              'Invalid Otp',
                                                              style:
                                                                  baseTextStyle12000
                                                                      .copyWith(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    140,
                                                                    15,
                                                                    7),
                                                              ),
                                                            )
                                                          : const SizedBox
                                                              .shrink()
                                                      : const SizedBox.shrink(),
                                                  CustomTimer(
                                                    ontap: () async {
                                                      return context.read<
                                                          GetEmailOtpBloc>()
                                                        ..add(
                                                          Emailotp(
                                                            param: GetEmailOtpparams(
                                                                email:
                                                                    emailidcntrllr
                                                                        .text),
                                                          ),
                                                        );
                                                    },
                                                  ),
                                                ],
                                              ),
                                              verticalGap(context.height(3.4)),
                                            ],
                                          );
                                        },
                                      )
                                : const SizedBox.shrink(),
                          ],
                        );
                      },
                    ),
                  ),
                  verticalGap(context.height(1.5)),
                  Center(
                    child: Text(
                      'Or',
                      style: baseTextStyle14400.copyWith(
                          color: AppColors.btnPrimary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalGap(context.height(1)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.pngs.googleLogo.image(
                        height: context.height(1.9),
                        width: context.width(8),
                      ),
                      Text(
                        'Sign in with Google',
                        style: baseTextStyle14400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomSheet: SafeArea(
              child: BlocListener<VerifyEmailOtpBloc, VerifyEmailOtpState>(
                listener: (context, state) {
                  if (state is VerifyEmailOtpSuccess) {
                    if (state.verifyEmailOtpModel.success!) {
                      context.read<GetStageBloc>().add(GetStage());
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Builder(builder: (context) {
                    final getEmailState =
                        context.watch<GetEmailOtpBloc>().state;
                    final verifyEmailState =
                        context.watch<VerifyEmailOtpBloc>().state;
                    return CustomButton(
                      ontap: () {
                        FocusScope.of(context).unfocus();
                        if (getEmailState is GetEmailOtpSuccess) {
                          context.read<VerifyEmailOtpBloc>().add(
                                CheckEmailOtp(
                                    verifyEmailOtpParams: VerifyEmailOtpParams(
                                  emailOtp: otpcntrllr.text,
                                )),
                              );
                        } else {
                          context.read<GetEmailOtpBloc>().add(
                                Emailotp(
                                  param: GetEmailOtpparams(
                                      email: emailidcntrllr.text),
                                ),
                              );
                        }
                      },
                      child: getEmailState is GetEmailOtpLoading ||
                              verifyEmailState is VerifyEmailOtpLoading
                          ? Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : Text(
                              'Continue',
                              style: baseTextStyle14500.copyWith(
                                  color: AppColors.background),
                            ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
