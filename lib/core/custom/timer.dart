import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';

class CustomTimer extends StatefulWidget {
  final Function ontap;
  final int seconds;
  final Color? color;
  final bool isEnabled;
  final bool secOnly;
  const CustomTimer(
      {super.key,
      required this.ontap,
      this.seconds = 0,
      this.color,
      this.isEnabled = true,
      this.secOnly = true});

  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  bool isOTP = false;
  int _seconds = 60;
  Timer timer = Timer(const Duration(), () {});
  bool isLoad = false;
  @override
  void initState() {
    super.initState();
    timer.cancel();
    if (widget.seconds != 0) {
      setState(() {
        _seconds = widget.seconds;
      });
    }
    if (widget.isEnabled) {
      startTimer();
    }
  }

  startTimer() {
    if (timer.isActive) return;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        _seconds--;
        setState(() {});
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minute = _seconds ~/ 60;
    int seconds = _seconds % 60;

    return (_seconds != 0)
        ? text(
            text: widget.secOnly
                ? "Resend OTP enables in ${_seconds.toString().padLeft(2, "0")} Sec"
                : "Resend OTP enables in $minute : ${seconds.toString().padLeft(2, "0")} Sec",
            color: widget.color ?? AppColors.indicatorClr,
            fontsize: 12)
        : isLoad
            ? const CircularProgressIndicator(strokeWidth: 2)
            : button(
                onTap: () async {
                  if (!widget.isEnabled) return;
                  isLoad = true;
                  setState(() {});
                  await widget.ontap();
                  setState(() {
                    isLoad = false;
                    if (widget.seconds != 0) {
                      _seconds = widget.seconds;
                    } else {
                      _seconds = 60;
                    }
                  });
                  startTimer();
                },
                child: text(
                    text: "Resend OTP",
                    color: widget.color ?? AppColors.btnPrimary,
                    fontsize: 12));
  }
}

InkWell button({VoidCallback? onTap, required Widget child}) {
  return InkWell(
    highlightColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    onTap: onTap,
    child: child,
  );
}

Widget text(
        {required String text,
        double? fontsize,
        Color? color,
        int? lines,
        double? fheight,
        TextAlign? align,
        FontWeight fontWeight = FontWeight.normal,
        TextOverflow overflow = TextOverflow.clip,
        double? lSpace,
        bool underLine = false}) =>
    Text(
      text,
      textAlign: align,
      style: TextStyle(
          package: "font",
          height: fheight,
          overflow: overflow,
          color: color ?? AppColors.greyClr,
          fontSize: fontsize,
          fontWeight: fontWeight,
          letterSpacing: lSpace,
          decoration: underLine ? TextDecoration.underline : null),
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
    );
