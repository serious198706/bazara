import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenSize on num {
  num get h => ScreenUtil().setHeight(this * 2.4);
  num get w => ScreenUtil().setWidth(this * 2.4);
  num get sp => ScreenUtil().setSp(this * 2.4);
  num get sw => ScreenUtil.screenWidth;
  num get sh => ScreenUtil.screenHeight;
}