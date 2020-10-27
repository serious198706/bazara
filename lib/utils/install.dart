import 'package:flutter/services.dart';

const MethodChannel _kChannel = MethodChannel('com.ph.crop.doctor/install');

class Install {
  void install(String filePath) {
    _kChannel.invokeMethod('install', {'filePath': filePath});
  }
}
