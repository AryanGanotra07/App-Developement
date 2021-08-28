import 'package:bluestacks/ui/dashboard/widgets/recommended_games/index.dart';
import 'package:bluestacks/ui/dashboard/widgets/tournaments_details/index.dart';
import 'package:bluestacks/ui/dashboard/widgets/user_profile/index.dart';
import 'package:bluestacks/widgets/drawer/index.dart';
import 'package:bluestacks/widgets/header/header.dart';
import 'package:flutter/material.dart';



class DashboardScreen extends StatelessWidget {
  static final String route = "/dashboard";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: CustomScrollView(
        slivers: [
          Header(_openDrawer),
          SliverList(
            // Use a delegate to build items as they're scrolled on screen.
            delegate: SliverChildListDelegate(
                [
                  UserProfile(),
                  TournamentsDetails(),
                  RecommendedGames(),
                ]
            ),
          ),
        ],
      ),
    );

  }

  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }





}