

import 'package:flutter/material.dart';


class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: Colors.blueAccent,
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
        )
    );
  }
}