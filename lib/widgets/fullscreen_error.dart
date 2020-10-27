import 'package:flutter/material.dart';
import 'package:bazara/resources/themes.dart';
import 'package:bazara/utils/screen_util.dart';

import 'custom_text.dart';

class FullscreenError extends StatelessWidget {
  static const TYPE_UNKNOWN = 0;
  static const TYPE_EMPTY = 1;
  static const TYPE_NETWORK = 2;
  static const Map<int, String> ERROR_TYPE_MAP = {
    TYPE_UNKNOWN: 'bg_error_unknown',
    TYPE_EMPTY: 'bg_error_empty',
    TYPE_NETWORK: 'bg_error_network'
  };
  static const Map<int, String> ERROR_TYPE_TIP = {
    TYPE_UNKNOWN: '出现未知错误，请重试',
    TYPE_EMPTY: '没有任何数据，请重试',
    TYPE_NETWORK: '网络有问题，请检查网络',
  };

  final int type;
  final Function onRetry;
  String msg;
  String retryText;

  FullscreenError(
      {this.type = TYPE_UNKNOWN,
        @required this.onRetry,
        this.msg,
        this.retryText});

  @override
  Widget build(BuildContext context) {
    if (msg == null || msg.isEmpty) {
      msg = ERROR_TYPE_TIP[type];
    }

    if (retryText == null || msg.isEmpty) {
      retryText = '重试';
    }

    return Container(
      padding: EdgeInsets.all(50.w),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset('assets/images/${ERROR_TYPE_MAP[type]}.png'),
          SizedBox(height: 12),
          CustomText(msg, fontSize: 20.sp),
          SizedBox(height: 12),
          FlatButton(
            child: CustomText(retryText, color: accentColor),
            onPressed: onRetry,
            shape: RoundedRectangleBorder(side: BorderSide(color: accentColor)),
          ),
        ],
      ),
    );
  }
}
