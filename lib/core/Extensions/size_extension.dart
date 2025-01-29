import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

double height(BuildContext context) => MediaQuery.of(context).size.height;
double width(BuildContext context) => MediaQuery.of(context).size.width;

verticalGap(double height) => SizedBox(height: height);
horizontalGap(double width) => SizedBox(width: width);

extension ResponsiveExtension on BuildContext {
  double width(double widthPercentage) {
    return MediaQuery.sizeOf(this).width * (widthPercentage / 100);
  }

  double height(double heightPercentage) {
    return MediaQuery.sizeOf(this).height * (heightPercentage / 100);
  }
}

extension SizeExtension on num {
  double h(BuildContext context) =>
      MediaQuery.of(context).size.height * (this / 100);

  double w(BuildContext context) =>
      MediaQuery.of(context).size.width * (this / 100);
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

DateFormat dateFormat = DateFormat('dd MMM yyyy');
bool isToday(DateTime date) {
  final DateTime now = DateTime.now();
  return date.year == now.year &&
      date.month == now.month &&
      date.day == now.day;
}
