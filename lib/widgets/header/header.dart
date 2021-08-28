import 'package:flutter/material.dart';


class Header extends StatelessWidget {
  final Function openDrawer;
  Header(this.openDrawer);

  @override
  Widget build(BuildContext context) {
    return _buildHeader(context);
  }

  Widget _buildHeader(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: Text("Flyingwolf"),
      leading: IconButton(
          icon: Icon(
            Icons.bar_chart
          ),
        onPressed: () {
            _onDrawerIconPressed(context);
        },
          ),
    );
  }

  void _onDrawerIconPressed(BuildContext context) {
    this.openDrawer();
  }

}