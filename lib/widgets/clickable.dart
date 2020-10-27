import 'package:bazara/resources/themes.dart';
import 'package:flutter/material.dart';

class Clickable extends StatelessWidget {
  final Function onTap;
  final Widget child;
  final Color bgColor;
  final Color splashColor;
  final double radius;

  Clickable({
    this.onTap,
    this.child,
    this.bgColor = Colors.white,
    this.splashColor = const Color(0x33FFFFFF),
    this.radius = 0,
  }) : assert(onTap != null, child != null);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      child: InkWell(
        splashColor: splashColor,
        onTap: onTap,
        child: child,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
    );
  }
}
