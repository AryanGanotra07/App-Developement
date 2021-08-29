

import 'package:bluestacks/themes/app_bar_theme.dart';
import 'package:bluestacks/themes/button_theme.dart';
import 'package:bluestacks/themes/text_theme.dart';
import 'package:flutter/material.dart';


class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        primaryTextTheme: CustomTextTheme.primaryTextTheme,
        appBarTheme: CustomAppBarTheme.appBarTheme,
        textButtonTheme: CustomButtonTheme.textButtonTheme,
        elevatedButtonTheme: CustomButtonTheme.elevatedButtonTheme,
    );
  }
}