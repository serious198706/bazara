import 'package:bazara/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:bazara/utils/screen_util.dart';

Widget customAppBar({
  String title,
  bool centerTitle = false,
  List<Widget> actions,
}) {
  return AppBar(
    title: CustomText(title, fontSize: 18.sp, color: Colors.white),
    centerTitle: centerTitle,
    actions: actions,
  );
}
