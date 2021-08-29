import 'package:flutter/material.dart';
import 'widgets/index.dart';
import '../../widgets/drawer/index.dart';
import '../../widgets/header/index.dart';




class DashboardScreen extends StatefulWidget {
  static final String route = "/dashboard";

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          Header(_openDrawer),
          SliverList(

            // Use a delegate to build items as they're scrolled on screen.
            delegate: SliverChildListDelegate(
                [
                  UserProfile(),
                  RecommendedGames(_scrollController),
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