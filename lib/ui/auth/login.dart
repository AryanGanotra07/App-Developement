import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth/index.dart';
import '../../widgets/error/index.dart';
import '../../widgets/loading/index.dart';
import 'widgets/index.dart';

class LoginScreen extends StatefulWidget {
  static final String route = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                SubmitButton(_onSubmit),
                _buildConsumerForAuthenticationState(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConsumerForAuthenticationState() {
    return Consumer<AuthProvider>(builder: (context, data, child) {
      AuthResponse authResponse = data.authResponse;
      switch (authResponse.authStatus) {
        case AuthResponseStatus.Authenticating:
          return LoadingComponent(height: null);
        case AuthResponseStatus.Error:
          return Error(
            errorException: authResponse.exception,
            showRetryButton: false,
            onRetry: () => null,
            height: null,
          );
        default:
          return const SizedBox(
            width: 0,
            height: 0,
          );
      }
    });
  }

  Widget _buildLoginForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            UsernameField(this._usernameController),
            PasswordField(this._passwordController),
          ],
        ));
  }

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      _loginUser();
    }
  }

  void _loginUser() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    Map<String, dynamic> userCredentials = {
      "username": username,
      "password": password,
    };

    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);
    auth.loginUser(userCredentials);
  }
}
