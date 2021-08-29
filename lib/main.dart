import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth/index.dart';
import 'providers/games/index.dart';
import 'providers/user/index.dart';
import 'routes.dart';
import 'themes/index.dart';
import 'ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecommendedGamesProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        routes: Routes.routes,
        title: 'BlueStacks',
        theme: CustomTheme.lightTheme,
        home: Home(),
      ),
    );
  }
}
