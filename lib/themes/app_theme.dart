import 'package:flutter/material.dart';

import 'app_bar/index.dart';
import 'button/index.dart';
import 'text/index.dart';

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
