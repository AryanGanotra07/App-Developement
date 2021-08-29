

import 'package:flutter/material.dart';


class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        primaryTextTheme: TextTheme(
            headline6: TextStyle(
                color: Colors.black
            )
        ),
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black
          ),
          iconTheme: IconThemeData(
              color: Colors.black
          ),
        ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
              )),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              shadowColor: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                 ))),
    );
  }
}