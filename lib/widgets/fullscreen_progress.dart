import 'package:bazara/resources/themes.dart';
import 'package:bazara/utils/screen_util.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class FullscreenProgress extends StatelessWidget {
  final String desc;
  final Color color;

  FullscreenProgress(
      {this.desc = '正在获取数据', this.color = const Color(0x33000000)});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      color: color,
      width: width,
      height: height,
      child: Center(
        child: Container(
          width: width / 3,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6.0))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16.h),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(accentColor),
              ),
              if (desc != null)
                Container(
                    margin: EdgeInsets.all(16.w),
                    child: CustomText(desc,
                        color: primaryTextColor, fontSize: 14.sp))
            ],
          ),
        ),
      ),
    );
  }
}
