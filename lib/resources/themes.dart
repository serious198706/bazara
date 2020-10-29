import 'package:flutter/material.dart';

class MainTheme {
  const MainTheme._(this.name, this.data);

  final String name;
  final ThemeData data;

  getThemeData() => data;
}

final MainTheme kLightTheme = MainTheme._('Light', _buildLightTheme()); // 浅色主题
final accentColor = Color(0xFFFF6969);
final windowBgColor = Color(0xFFF8F8F8);
final dividerColor = Color(0xFFDEDEDE);
final headerColor = Color(0xFFEDEDED);
final primaryTextColor = Color(0xFF515C6F);
final secondaryTextColor = Color(0xFF8D8D8D);
final tabUnselectedColor = Color(0xFFAEAEAE);
final tabSelectedColor = accentColor;
final placeHolderMainColor = Color(0xFFF3F3F3);
final placeHolderSecondaryColor = Color(0xFFF6F6F6);

ThemeData _buildLightTheme() {
  const Color primaryColor = Color(0xFFFF6969);
  const Color secondaryColor = Color(0xFFFFFFFF);
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    appBarTheme: AppBarTheme(
      textTheme: base.textTheme.copyWith(
          headline6: base.textTheme.headline6.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      )),
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: accentColor),
      color: Colors.white,
      elevation: 0,
    ),
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    accentColor: secondaryColor,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: windowBgColor,
    backgroundColor: Colors.white,
    errorColor: const Color(0xFFB00020),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: base.iconTheme.copyWith(color: secondaryTextColor, size: 16.0),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    bodyText1: base.bodyText1.copyWith(
      color: primaryTextColor,
      fontSize: 18.0,
    ),
    caption: base.caption.copyWith(
      color: primaryTextColor,
      fontSize: 18.0,
    ),
  );
}
