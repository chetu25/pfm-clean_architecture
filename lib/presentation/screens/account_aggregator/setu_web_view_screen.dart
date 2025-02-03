import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';
import 'package:pfm_ekyc/core/common/custom_text_style.dart';
import 'package:pfm_ekyc/presentation/blocs/account_aggregator/fetch_consent_status/fetch_consent_status_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/account_aggregator/fetch_seesion_status/get_session_status_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/account_aggregator/get_consent_url/get_consent_url_bloc.dart';
import 'package:pfm_ekyc/routes/route.dart';

class SetuWebViewScreen extends StatelessWidget {
  const SetuWebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isFirst = true;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.west,
                color: AppColors.btnPrimary,
              )),
          backgroundColor: AppColors.background,
          title: Text(
            "Account Aggregator",
            style: baseTextStyle16400,
          ),
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<FetchConsentStatusBloc, FetchConsentStatusState>(
              listener: (context, state) {
                if (state is FetchConsentStatusSuccess) {
                  if (state.consentStatusModel.success!) {
                    if (state.consentStatusModel.data!.setuStatus!
                            .toLowerCase() ==
                        'active') {
                      context
                          .read<GetSessionStatusBloc>()
                          .add(CheckSessionStatus());
                    } else if (state.consentStatusModel.data!.setuStatus!
                            .toLowerCase() ==
                        'pending') {
                      // Call this API every 2 seconds
                      context
                          .read<FetchConsentStatusBloc>()
                          .add(GetStatusEvent());
                    }
                  } else {
                    Fluttertoast.showToast(
                      msg: state.consentStatusModel.message ??
                          'Some thing went wrong please try again',
                    );
                    context.push(Routes.accountAggregator);
                  }
                }
              },
            ),
            BlocListener<GetSessionStatusBloc, GetSessionStatusState>(
              listener: (context, state) {
                if (state is GetSessionStatusSuccess) {
                  if (state.consentStatusModel.success!) {
                    if (state.consentStatusModel.data!.setuStatus!
                            .toLowerCase() ==
                        'completed') {
                      context.push(Routes.congratulationsScreen);
                    } else if (state.consentStatusModel.data!.setuStatus!
                            .toLowerCase() ==
                        'pending') {
                      context
                          .read<GetSessionStatusBloc>()
                          .add(CheckSessionStatus());
                    } else if (state.consentStatusModel.data!.setuStatus!
                            .toLowerCase() ==
                        'failed') {
                      context.push(Routes.accountAggregator);
                    }
                  } else {
                    Fluttertoast.showToast(
                      msg: state.consentStatusModel.message ??
                          'Some thing went wrong please try again',
                    );
                    context.push(Routes.accountAggregator);
                  }
                }
              },
            ),
          ],
          child: BlocBuilder<GetConsentUrlBloc, GetConsentUrlState>(
            builder: (context, state) {
              if (state is GetConsentUrlSuccess) {
                if (state.setuConsentUrlModel.data?.redirectUrl != null) {
                  return InAppWebView(
                    initialUrlRequest: URLRequest(
                        url: WebUri.uri(Uri.parse(
                            state.setuConsentUrlModel.data?.redirectUrl ??
                                ''))),
                    onUpdateVisitedHistory: (controller, url, isReload) async {
                      Map<String, String> data = url?.queryParameters ?? {};
                      String res = url.toString().toLowerCase();

                      if (res.contains("accountnotconnected") ||
                          res.contains("reject") ||
                          res.contains("cancel") ||
                          (res.contains("errormsg") &&
                              data["success"] != "true")) {
                        if (isFirst) {
                          isFirst = false;
                          await Future.delayed(Duration(seconds: 1));
                          if (!context.mounted) return;
                          context.pop('cancel');
                        }
                      } else if (data["success"] == "true") {
                        if (isFirst) {
                          isFirst = false;

                          context
                              .read<FetchConsentStatusBloc>()
                              .add(GetStatusEvent());
                        }
                      }
                    },
                    initialSettings: InAppWebViewSettings(
                      builtInZoomControls: false,
                      displayZoomControls: false,
                      supportZoom: false,
                      javaScriptCanOpenWindowsAutomatically: true,
                      useHybridComposition: true,
                      clearCache: true,
                      clearSessionCache: true,
                    ),
                    onLoadStop: (controller, url) async {
                      await controller.evaluateJavascript(source: """
                                            var meta = document.createElement('meta');
                                            meta.name = 'viewport';
                                            meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';
                                            document.getElementsByTagName('head')[0].appendChild(meta);
                                            """);
                    },
                  );
                }
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
