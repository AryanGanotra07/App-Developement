import 'package:flutter/material.dart';


class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: _buildLogoImage(),
    );
  }
  
  Widget _buildLogoImage() {
    return Image.asset(
      "assets/images/gametv.png",
      height: 100,
      width: 100,
    );
  }
  
}