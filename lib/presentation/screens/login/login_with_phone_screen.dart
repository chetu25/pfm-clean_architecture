import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';
import 'package:pfm_ekyc/core/Extensions/size_extension.dart';
import 'package:pfm_ekyc/core/common/custom_text_style.dart';
import 'package:pfm_ekyc/core/common/validators.dart';
import 'package:pfm_ekyc/core/custom/custom_appbar.dart';
import 'package:pfm_ekyc/core/custom/custom_button.dart';
import 'package:pfm_ekyc/core/custom/text_form_filed.dart';
import 'package:pfm_ekyc/core/custom/timer.dart';
import 'package:pfm_ekyc/domain/entities/phone_login_param.dart';
import 'package:pfm_ekyc/domain/entities/phone_otp_params.dart';
import 'package:pfm_ekyc/gen/assets.gen.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/get_phone_otp/getphoneotp_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/get_stage/get_stage_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/verify_phone_otp/verify_phone_otp_bloc.dart';
import 'package:pfm_ekyc/presentation/screens/app_error_widget.dart';
import 'package:pfm_ekyc/presentation/screens/login/check_stage.dart';

class LoginWithPhoneScreen extends StatefulWidget {
  const LoginWithPhoneScreen({super.key});

  @override
  State<LoginWithPhoneScreen> createState() => _LoginWithPhoneScreenState();
}

class _LoginWithPhoneScreenState extends State<LoginWithPhoneScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _mobilenocntrllr = TextEditingController();
  late OTPTextEditController _otpcntrllr;

  @override
  void initState() {
    super.initState();
    _otpcntrllr = OTPTextEditController(
      codeLength: 6,
      onCodeReceive: (code) {
        if (code != _otpcntrllr.text) {
          _otpcntrllr.text = code;
        }
      },
    );
  }

  @override
  void dispose() {
    _mobilenocntrllr.dispose();
    _otpcntrllr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Provide your mobile number and email to unlock\nseamless experience with Alice Blue',
                      style: baseTextStyle10500.copyWith(
                          color: AppColors.btnPrimary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalGap(context.height(3.4)),
                  Text(
                    'Enter Mobile Number',
                    style: baseTextStyle14500,
                  ),
                  verticalGap(context.height(2.6)),
                  BlocBuilder<GetphoneotpBloc, GetphoneotpState>(
                    builder: (context, state) {
                      if (state is GetphoneotpFailure) {
                        return AppErrorWidget(
                            errorType: state.errorType,
                            error: state.errorMessage,
                            onRetry: () {
                              context.read<GetphoneotpBloc>().add(
                                    Phoneotp(
                                      param: PhoneLoginParam(
                                          mobileNumber: _mobilenocntrllr.text),
                                    ),
                                  );
                            });
                      }
                      return Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              isMOb: true,
                              labeltxt: "Mobile Number",
                              controller: _mobilenocntrllr,
                              validator: Validators.validateMobileNumber,
                              onChange: (value) {
                                if (state is GetphoneotpSuccess) {
                                  context
                                      .read<GetphoneotpBloc>()
                                      .add(StateChange());
                                }
                                _otpcntrllr.clear();
                              },
                            ),
                            state is GetphoneotpSuccess
                                ? !state.phoneLoginModel.success!
                                    ? Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          state.phoneLoginModel.message ??
                                              'something went wrong',
                                          style: baseTextStyle12000.copyWith(
                                            color: const Color.fromARGB(
                                                255, 140, 15, 7),
                                          ),
                                        ),
                                      )
                                    : BlocBuilder<VerifyPhoneOtpBloc,
                                        VerifyPhoneOtpState>(
                                        builder: (context, state) {
                                          if (state is VerifyPhoneOtpFailure) {
                                            return AppErrorWidget(
                                                errorType: state.errorType,
                                                error: state.errorMessage,
                                                onRetry: () {
                                                  context
                                                      .read<
                                                          VerifyPhoneOtpBloc>()
                                                      .add(
                                                        CheckphoneOtp(
                                                          phoneOtpParam:
                                                              PhoneOtpParams(
                                                                  mobileNumber:
                                                                      _mobilenocntrllr
                                                                          .text,
                                                                  mobileOtp:
                                                                      _otpcntrllr
                                                                          .text),
                                                        ),
                                                      );
                                                });
                                          }
                                          return Column(
                                            children: [
                                              verticalGap(context.height(3.4)),
                                              CustomTextField(
                                                isOtp: true,
                                                labeltxt: "Enter OTP",
                                                controller: _otpcntrllr,
                                                validator:
                                                    Validators.validateOtp,
                                                onChange: (p0) {
                                                  if (state
                                                      is VerifyPhoneOtpSuccess) {
                                                    if (!state.phoneOtpModel
                                                        .success!) {
                                                      context
                                                          .read<
                                                              VerifyPhoneOtpBloc>()
                                                          .add(Test());
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
                                                  state is VerifyPhoneOtpSuccess
                                                      ? !state.phoneOtpModel
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
                                                      _otpcntrllr.clear();
                                                      return context.read<
                                                          GetphoneotpBloc>()
                                                        ..add(
                                                          Phoneotp(
                                                            param: PhoneLoginParam(
                                                                mobileNumber:
                                                                    _mobilenocntrllr
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
                        ),
                      );
                    },
                  ),
                  verticalGap(context.height(5.7)),
                ],
              ),
            ),
            bottomSheet: SafeArea(
              child: BlocListener<VerifyPhoneOtpBloc, VerifyPhoneOtpState>(
                listener: (context, state) {
                  if (state is VerifyPhoneOtpSuccess) {
                    if (state.phoneOtpModel.success!) {
                      context.read<GetStageBloc>().add(GetStage());
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Builder(builder: (context) {
                    final getOtpState = context.watch<GetphoneotpBloc>().state;
                    final verifyOtpState =
                        context.watch<VerifyPhoneOtpBloc>().state;
                    return CustomButton(
                      ontap: () {
                        FocusScope.of(context).unfocus();
                        if (formKey.currentState!.validate()) {
                          if (getOtpState is GetphoneotpSuccess) {
                            context.read<VerifyPhoneOtpBloc>().add(
                                  CheckphoneOtp(
                                    phoneOtpParam: PhoneOtpParams(
                                        mobileNumber: _mobilenocntrllr.text,
                                        mobileOtp: _otpcntrllr.text),
                                  ),
                                );
                          } else {
                            context.read<GetphoneotpBloc>().add(
                                  Phoneotp(
                                    param: PhoneLoginParam(
                                        mobileNumber: _mobilenocntrllr.text),
                                  ),
                                );
                          }
                        }
                      },
                      child: getOtpState is GetphoneotpLoading ||
                              verifyOtpState is VerifyPhoneOtpLoading
                          ? Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : Text(
                              'Continue',
                              style: baseTextStyle14400.copyWith(
                                  color: AppColors.primaryWhite),
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
