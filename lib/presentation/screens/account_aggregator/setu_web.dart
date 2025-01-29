import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:pfm_ekyc/presentation/blocs/account_aggregator/get_consent_url/get_consent_url_bloc.dart';

class SetuWeb extends StatelessWidget {
  const SetuWeb({super.key});

  @override
  Widget build(BuildContext context) {
    bool isFirst = true;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Setu Web'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: BlocBuilder<GetConsentUrlBloc, GetConsentUrlState>(
          builder: (context, state) {
        if (state is GetConsentUrlSuccess) {
          if (state.setuConsentUrlModel.data?.redirectUrl != null) {
            return InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri.uri(
                  Uri.parse(state.setuConsentUrlModel.data?.redirectUrl ?? ''),
                ),
              ),
              onUpdateVisitedHistory: (controller, url, isReload) async {
                Map data = url?.queryParameters ?? {};
                String res = url.toString().toLowerCase();
                if (res.contains('accountnotconnected') ||
                    res.contains("regect") ||
                    res.contains("cancel") ||
                    res.contains("errormsg") && data["success"] != "true") {
                  if (isFirst) {
                    isFirst = false;
                    await Future.delayed(const Duration(seconds: 1));
                    if (!context.mounted) return;
                    Navigator.pop(context, "cancel");
                  }
                } else if (data["success"] == "true") {
                  if (isFirst) {
                    isFirst = false;
                    //GO TO PORTFOILIO SCREEN
                  }
                }
              },
              initialSettings: InAppWebViewSettings(
                  useShouldOverrideUrlLoading: true,
                  builtInZoomControls: false,
                  displayZoomControls: false,
                  supportZoom: false,
                  javaScriptCanOpenWindowsAutomatically: true,
                  useHybridComposition: true,
                  clearCache: true,
                  clearSessionCache: true),
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
      }),
    ));
  }
}
