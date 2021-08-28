


import 'package:flutter/material.dart';

class SnackbarUtil {

  static void showSnackBar(BuildContext context, String text) {
      final snackBar = SnackBar(content: Text(text),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}