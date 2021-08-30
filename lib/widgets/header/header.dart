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
      title: const Text("Flyingwolf"),
      leading: _buildDawerIcon(context),
    );
  }

  Widget _buildDawerIcon(BuildContext context) {
    return InkWell(
      onTap: () => _onDrawerIconPressed(context),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset("assets/images/drawericon.png"),
      ),
    );
  }

  void _onDrawerIconPressed(BuildContext context) {
    this.openDrawer();
  }
}
