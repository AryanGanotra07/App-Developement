


import 'package:flutter/material.dart';

class CustomAppBarTheme {
  static AppBarTheme get appBarTheme {
    return AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.black
      ),
      iconTheme: IconThemeData(
          color: Colors.black
      ),
    );
  }
}