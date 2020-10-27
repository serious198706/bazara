import 'package:bazara/resources/themes.dart';
import 'package:bazara/widgets/clickable.dart';
import 'package:bazara/widgets/custom_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bazara/utils/screen_util.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController;
  TextEditingController _smsController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController()..addListener(_listener);
    _smsController = TextEditingController()..addListener(_listener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.all(32.w),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            SizedBox(height: 12.h),
            _buildDesc(),
            SizedBox(height: 36.h),
            _buildPhoneInput(),
            Divider(height: 1.h, thickness: 0.5.h, color: dividerColor),
            _buildSmsCodeInput(),
            Divider(height: 1.h, thickness: 0.5.h, color: dividerColor),
            SizedBox(height: 12.h),
            _buildLoginButton(),
            SizedBox(height: 12.h),
            _buildTip(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'BAZARA',
      style: TextStyle(
        fontSize: 48.sp,
        color: primaryTextColor,
        fontFamily: 'NixieOne',
      ),
    );
  }

  Widget _buildDesc() {
    return Text(
      'Welcome to Bazara, \nwhere you see shoes.',
      style: TextStyle(
        fontSize: 24.sp,
        color: primaryTextColor,
        fontFamily: 'NixieOne',
      ),
    );
  }

  Widget _buildPhoneInput() {
    return Row(
      children: [
        CustomText('+60'),
        Icon(Icons.arrow_drop_down, color: primaryTextColor, size: 16.sp),
        Expanded(
          child: TextField(
            controller: _phoneController,
            style: TextStyle(color: primaryTextColor, fontSize: 16.sp),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.phone,
            maxLength: 15,
            decoration:
                InputDecoration(border: InputBorder.none, counterText: ''),
          ),
        ),
        GestureDetector(
            onTap: () => _phoneController.text = '',
            child: Icon(Icons.cancel, color: secondaryTextColor, size: 18.w)),
      ],
    );
  }

  Widget _buildSmsCodeInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _smsController,
            style: TextStyle(color: primaryTextColor, fontSize: 16.sp),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Input verify code'),
          ),
        ),
        CustomText('SEND CODE')
      ],
    );
  }

  Widget _buildLoginButton() {
    return Clickable(
      bgColor: accentColor,
      radius: 30.w,
      child: Container(
          width: 1.sw,
          height: 45.h,
          alignment: Alignment.center,
          child: CustomText('LOGIN', color: Colors.white)),
      onTap: () {},
    );
  }

  Widget _buildTip() {
    return Text.rich(
      TextSpan(text: 'By creating an account, you agree to our ', children: [
        TextSpan(
          text: 'Terms of Service',
          style: TextStyle(color: accentColor),
          recognizer: TapGestureRecognizer()..onTap = () {},
        ),
        TextSpan(text: ' and '),
        TextSpan(
          text: 'Privacy Policy',
          style: TextStyle(color: accentColor),
          recognizer: TapGestureRecognizer()..onTap = () {},
        ),
      ]),
      textAlign: TextAlign.center,
      style: TextStyle(height: 1.5),
    );
  }

  void _listener() {}
}
