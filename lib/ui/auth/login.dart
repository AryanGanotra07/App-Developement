import 'package:bluestacks/models/user/user.dart';
import 'package:bluestacks/providers/auth/auth_provider.dart';
import 'package:bluestacks/providers/auth/auth_response.dart';
import 'package:bluestacks/providers/auth/auth_response_status.dart';
import 'package:bluestacks/providers/user/user_provider.dart';
import 'package:bluestacks/ui/auth/widgets/index.dart';
import 'package:bluestacks/ui/dashboard/dashboard.dart';
import 'package:bluestacks/utils/snackbar_util.dart';
import 'package:bluestacks/widgets/error/error.dart';
import 'package:bluestacks/widgets/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  static final String route = "/login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _valid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildLoginWidgets(),
    );
  }

  Widget _buildLoginWidgets() {
    return new Container(
      child: new Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LogoImage(),
                _buildLoginForm(),
                SubmitButton(_onSubmit, _valid),
                // _buildConsumerForAuthenticationState(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConsumerForAuthenticationState() {
    return Consumer<AuthProvider>(
      builder: (context, data, child) {
        AuthResponse authResponse = data.authResponse;
        switch (authResponse.authStatus) {
          case AuthResponseStatus.Authenticating:
            return LoadingComponent(height : null);
          case AuthResponseStatus.Error:
            return Error(
              errorMessage: authResponse.message,
              showRetryButton: false,
              onRetry: () => null,
              height: null,
            );
          default:
            return SizedBox(
              width: 0,
              height: 0,
            );
        }
      }
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
        child: Column(
          children: [
            UsernameField(this._usernameController),
            PasswordField(this._passwordController),
          ],
        )
    );
  }

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      setState(() {
        _valid = true;
      });
      _loginUser();
    } else {
      setState(() {
        _valid = false;
      });
    }
  }

  void _loginUser() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    Map<String, dynamic> userCredentials = {
      "username" : username,
      "password" : password,
    };

    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);
    auth.loginUser(userCredentials);

    // _handleLoginFlow(authMessage);
  }

  void _handleLoginFlow(Map<String, dynamic> authMessage) {
    if (authMessage["successful"]) {
      // //login successful
      // User user = authMessage["user"];
      // // UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
      // // userProvider.setUser(user);
      // Navigator.of(context).pushReplacementNamed(DashboardScreen.route);

    } else {
      //login unsuccessful
      SnackBarUtil.showSnackBar(context, authMessage["error"]);
    }
  }

}