import 'package:bazara/resources/themes.dart';
import 'package:flutter/material.dart';
import 'package:bazara/utils/screen_util.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  final String text;
  double fontSize;
  final Color color;
  FontWeight fontWeight;
  bool softWrap;
  TextAlign textAlign;

  CustomText(
    this.text, {
    this.fontSize,
    this.color = const Color(0xFF515C6F),
    this.fontWeight = FontWeight.normal,
    this.softWrap = true,
    this.textAlign = TextAlign.left,
  }) {
    if (this.fontSize == null) {
      this.fontSize = 16.sp;
    }
  }

  void bold() {
    this.fontWeight = FontWeight.bold;
  }

  @override
  Widget build(BuildContext context) {
    return Text(text,
        softWrap: softWrap,
        textAlign: textAlign,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ));
  }
}
