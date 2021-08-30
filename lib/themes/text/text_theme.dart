import 'package:flutter/material.dart';

class CustomTextTheme {
  static TextTheme get primaryTextTheme {
    return TextTheme(
      headline6: _headline6Style,
      headline5: _headline5Style,
    );
  }

  static TextStyle get _headline6Style {
    return TextStyle(color: Colors.black);
  }

  static TextStyle get _headline5Style {
    return TextStyle(
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }
}
