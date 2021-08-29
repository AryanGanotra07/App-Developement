
import 'package:flutter/material.dart';


class LoadingComponent extends StatelessWidget {
  final double height;
  LoadingComponent({this.height = 200});
  @override
  Widget build(BuildContext context) {
    return _buildLoadingWidget();
  }

  Widget _buildLoadingWidget() {
    return Container(
        height: height,
        alignment: Alignment.center,
        child: CircularProgressIndicator());
  }

}