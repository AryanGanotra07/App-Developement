import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  static final String route = "/splash";
  @override
  Widget build(BuildContext context) {
    return _buildSplashScreenWidget();
  }

  Widget _buildSplashScreenWidget() {
    return Container(
      child: Center(
        child: Image.asset(
            "assets/images/gametv.png"),
      ),
    );
  }

}