import 'package:flutter/material.dart';

class Updater extends StatefulWidget {
  final Widget child;

  const Updater({this.child});

  @override
  _UpdaterState createState() => _UpdaterState();
}

class _UpdaterState extends State<Updater> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
