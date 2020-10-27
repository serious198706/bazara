import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'screen_util.dart';

class Toast {
  static showToast({String msg}) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color(0xFF232323),
        textColor: Colors.white,
        fontSize: 18.sp);
  }
}
