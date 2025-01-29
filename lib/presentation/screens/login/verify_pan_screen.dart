import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';
import 'package:pfm_ekyc/core/Extensions/size_extension.dart';
import 'package:pfm_ekyc/core/common/custom_text_style.dart';
import 'package:pfm_ekyc/core/common/validators.dart';
import 'package:pfm_ekyc/core/custom/custom_appbar.dart';
import 'package:pfm_ekyc/core/custom/custom_button.dart';
import 'package:pfm_ekyc/core/custom/text_form_filed.dart';
import 'package:pfm_ekyc/domain/entities/validate_pan_params.dart';
import 'package:pfm_ekyc/gen/assets.gen.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/get_stage/get_stage_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/update_pan/update_pan_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/validate_pan/validate_pan_bloc.dart';
import 'package:pfm_ekyc/presentation/screens/app_error_widget.dart';
import 'package:pfm_ekyc/presentation/screens/login/check_stage.dart';

class VerifyPanScreen extends StatefulWidget {
  const VerifyPanScreen({
    super.key,
  });
  @override
  State<VerifyPanScreen> createState() => _VerifyPanScreenState();
}

class _VerifyPanScreenState extends State<VerifyPanScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController pancntrllr = TextEditingController();
  final TextEditingController dobcntrllr = TextEditingController();

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
            appBar: transparantAppbar(
              ctx: context,
              showBackButton: true,
            ),
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: context.width(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.height(28),
                    width: width(context),
                    child: Assets.gifs.panOnboarding.image(),
                  ),
                  verticalGap(context.height(2.1)),
                  Center(
                    child: Text(
                      "Verify your details to proceed",
                      style: baseTextStyle14600.copyWith(
                          color: AppColors.btnPrimary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Enter your PAN to securely verify your identity',
                      style: baseTextStyle10500.copyWith(
                          color: AppColors.btnPrimary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalGap(context.height(3.4)),
                  Text('PAN Details', style: baseTextStyle14600),
                  verticalGap(context.height(2.6)),
                  BlocBuilder<UpdatePanBloc, UpdatePanState>(
                    builder: (context, updateState) {
                      if (updateState is UpdatePanFailure) {
                        return AppErrorWidget(
                          errorType: updateState.errorType,
                          error: updateState.errorMessage,
                          onRetry: () => context.read<UpdatePanBloc>().add(
                                UpdatePan(
                                  params: ValidatePanParams(
                                      panNumber: pancntrllr.text,
                                      dob: dobcntrllr.text),
                                ),
                              ),
                        );
                      }
                      return Form(
                        key: formKey,
                        child: BlocBuilder<ValidatePanBloc, ValidatePanState>(
                          builder: (context, state) {
                            if (state is ValidatePanFailure) {
                              return AppErrorWidget(
                                errorType: state.errorType,
                                error: state.errorMessage,
                                onRetry: () =>
                                    context.read<ValidatePanBloc>().add(
                                          ValidatePan(
                                            ValidatePanParams(
                                                panNumber: pancntrllr.text,
                                                dob: dobcntrllr.text),
                                          ),
                                        ),
                              );
                            }
                            return Column(
                              children: [
                                CustomTextField(
                                  isPan: true,
                                  labeltxt: "Enter PAN No",
                                  controller: pancntrllr,
                                  validator: Validators.validatePanNumber,
                                  onChange: (value) {
                                    if (state is ValidatePanSuccess) {
                                      if (!state.validatePanModel.success!) {
                                        context
                                            .read<ValidatePanBloc>()
                                            .add(StateChanged());
                                      }
                                    }
                                  },
                                ),
                                verticalGap(context.height(3.4)),
                                CustomTextField(
                                  isDob: true,
                                  labeltxt: "Date of Birth",
                                  controller: dobcntrllr,
                                  validator: Validators.validateDateOfBirth,
                                  onChange: (p0) {
                                    if (state is ValidatePanSuccess) {
                                      if (!state.validatePanModel.success!) {
                                        context
                                            .read<ValidatePanBloc>()
                                            .add(StateChanged());
                                      }
                                    }
                                  },
                                ),
                                state is ValidatePanSuccess
                                    ? !state.validatePanModel.success!
                                        ? Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              state.validatePanModel.message ??
                                                  'Enter Valid Pan',
                                              style:
                                                  baseTextStyle12000.copyWith(
                                                color: const Color.fromARGB(
                                                    255, 140, 15, 7),
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink()
                                    : const SizedBox.shrink(),
                                updateState is UpdatePanSuccess
                                    ? !updateState.updatePanModel.success!
                                        ? Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              updateState
                                                      .updatePanModel.message ??
                                                  'Enter Valid Pan',
                                              style:
                                                  baseTextStyle12000.copyWith(
                                                color: const Color.fromARGB(
                                                    255, 140, 15, 7),
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink()
                                    : const SizedBox.shrink(),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                  verticalGap(context.height(12)),
                ],
              ),
            ),
            bottomSheet: SafeArea(
              child: MultiBlocListener(
                listeners: [
                  BlocListener<ValidatePanBloc, ValidatePanState>(
                    listener: (context, state) {
                      if (state is ValidatePanSuccess) {
                        if (state.validatePanModel.success!) {
                          context.read<UpdatePanBloc>().add(
                                UpdatePan(
                                  params: ValidatePanParams(
                                      panNumber: pancntrllr.text,
                                      dob: dobcntrllr.text),
                                ),
                              );
                        }
                      }
                    },
                  ),
                  BlocListener<UpdatePanBloc, UpdatePanState>(
                    listener: (context, state) {
                      if (state is UpdatePanSuccess) {
                        if (state.updatePanModel.success!) {
                          context.read<GetStageBloc>().add(GetStage());
                        }
                      }
                    },
                  ),
                ],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Builder(builder: (context) {
                    final validateState =
                        context.watch<ValidatePanBloc>().state;
                    final updateState = context.watch<UpdatePanBloc>().state;
                    return CustomButton(
                      ontap: () {
                        FocusScope.of(context).unfocus();
                        if (formKey.currentState!.validate()) {
                          context.read<ValidatePanBloc>().add(
                                ValidatePan(
                                  ValidatePanParams(
                                      panNumber: pancntrllr.text,
                                      dob: dobcntrllr.text),
                                ),
                              );
                        }
                      },
                      child: updateState is UpdatePanLoading ||
                              validateState is ValidatePanLoading
                          ? const CircularProgressIndicator(
                              color: AppColors.background,
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
