import 'package:flutter/material.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/gen/assets.gen.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final String? error;

  final VoidCallback? onRetry;

  const AppErrorWidget({
    super.key,
    required this.errorType,
    required this.error,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        errorType == AppErrorType.network
            ? Assets.svgs.noNetwork.svg()
            : Assets.svgs.somethingWentWrong.svg(),
        const SizedBox(height: 20),
        Text(
          errorType == AppErrorType.network
              ? 'Whoops !!'
              : 'Something is not right !!',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.btnPrimary,
              ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            error != null && error!.isNotEmpty
                ? error!
                : (errorType == AppErrorType.network
                    ? 'Please check your internet connection and try again.'
                    : 'Oh no !! Something went wrong.\n Please try again after sometimes'),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 5),
        if (onRetry != null)
          IconButton(onPressed: onRetry, icon: const Icon(Icons.refresh)),
      ],
    );
  }
}
