import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth/index.dart';
import '../../providers/games/index.dart';
import '../../providers/user/index.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDrawer(context);
  }

  Widget _buildDrawer(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                _logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).clear();
    Provider.of<RecommendedGamesProvider>(context, listen: false).clear();
    Provider.of<AuthProvider>(context, listen: false).logoutUser();
  }
}
