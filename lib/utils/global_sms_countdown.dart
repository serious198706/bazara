import 'dart:async';

import 'package:equatable/equatable.dart';

class GlobalSmsCountDown {
  static const TOTAL_TIME = 10;

  static int count = TOTAL_TIME;
  static Map<String, CountDownCallback> callbacks = Map();
  static Timer _countdownTimer;

  static void registerCountDownCallback(
      String key, CountDownCallback callback) {
    callbacks[key] = callback;
  }

  static void unregisterCountDownCallback(String key) {
    callbacks.remove(key);
  }

  static startCountDown() {
    count = TOTAL_TIME;

    if (_countdownTimer == null) {
      _countdownTimer = Timer.periodic(new Duration(seconds: 1), (timer) {
        for (var cb in callbacks.keys) {
          callbacks[cb].countDown(count);
        }

        if (count > 0) {
          count--;
        } else {
          count = TOTAL_TIME;
          _countdownTimer.cancel();
          _countdownTimer = null;
        }
      });
    }
  }

  static void destroy() {
    callbacks = null;
    _countdownTimer.cancel();
    _countdownTimer = null;
  }
}

abstract class CountDownCallback {
  void countDown(int secondsLeft);
}
