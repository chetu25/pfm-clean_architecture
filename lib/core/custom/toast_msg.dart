import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastMsg(message) => Fluttertoast.showToast(
    toastLength: Toast.LENGTH_SHORT,
    msg: message,
    fontSize: 12,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.black.withAlpha(153));
