
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_theme/text_theme.dart';


class YawoTheme {
  YawoTheme._();

  static ThemeData lighTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.light,
    primaryColor: mainColor,
    primarySwatch: Colors.deepOrange,
    textTheme: YawoTextTheme.lightTextTheme,
    scaffoldBackgroundColor: bgNeutralColor,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    primaryColor: mainColor,
    primarySwatch: Colors.deepOrange,
    textTheme: YawoTextTheme.darkTextTheme,
    scaffoldBackgroundColor: darkGreyColor,
  );
}