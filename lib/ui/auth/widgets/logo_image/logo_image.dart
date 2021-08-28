import 'package:flutter/material.dart';


class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildLogoImage();
  }
  
  Widget _buildLogoImage() {
    return Image.asset(
      "assets/images/gametv.png",
      height: 200,
      width: 200,
    );
  }
  
}