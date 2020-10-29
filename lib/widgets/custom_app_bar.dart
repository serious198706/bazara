import 'package:flutter/material.dart';

Widget customAppBar({
  String title,
  bool centerTitle = false,
  List<Widget> actions,
  bool showBack = true,
}) {
  return AppBar(
    title: Text(title),
    centerTitle: centerTitle,
    actions: actions,
    automaticallyImplyLeading: showBack,
    elevation: 1,
  );
}
