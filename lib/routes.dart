import 'package:bluestacks/ui/dashboard/index.dart';
import 'package:bluestacks/ui/splash/index.js.dart';
import 'package:flutter/material.dart';

import 'ui/auth/index.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    LoginScreen.route: (BuildContext context) => new LoginScreen(),
    DashboardScreen.route: (BuildContext context) => new DashboardScreen(),
    SplashScreen.route: (BuildContext context) => new SplashScreen(),
  };
}
