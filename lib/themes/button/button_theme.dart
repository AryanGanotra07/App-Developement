import 'package:flutter/material.dart';

class CustomButtonTheme {
  static TextButtonThemeData get textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
          primary: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          textStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          )),
    );
  }

  static ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            shadowColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )));
  }

}