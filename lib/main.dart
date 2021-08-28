import 'package:bluestacks/routes.dart';
import 'package:bluestacks/themes/index.dart';

import 'providers/auth_provider.dart';
import 'ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
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
