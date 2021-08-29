import 'package:bluestacks/providers/auth/index.dart';
import 'package:bluestacks/ui/dashboard/index.dart';
import 'package:bluestacks/ui/splash/index.js.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/index.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).loadAuthStatus();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return _getLandingWidget();
  }

  Widget _getLandingWidget() {
   return Consumer<AuthProvider>(
     builder: (context, data, child) {
       AuthResponse authResponse = data.authResponse;
       switch(authResponse.authStatus) {
         case AuthResponseStatus.CheckingFromLocal:
           return SplashScreen();
         case AuthResponseStatus.LoggedOut:
           return LoginScreen();
         case AuthResponseStatus.LoggedIn:
           return DashboardScreen();
        default:
          return LoginScreen();
       }
     },
   );
  }
}