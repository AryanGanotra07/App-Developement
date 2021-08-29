import 'package:flutter/material.dart';

import '../../data/user/user_preferences.dart';
import '../../models/auth/index.dart';
import '../../services/auth/index.dart';
import 'auth_response.dart';
import 'auth_response_status.dart';

class AuthProvider extends ChangeNotifier {
  AuthResponse _authResponse =
      new AuthResponse(authStatus: AuthResponseStatus.CheckingFromLocal);

  AuthResponse get authResponse => _authResponse;

  void _setLoggedOut() {
    _authResponse.authStatus = AuthResponseStatus.LoggedOut;
    notifyListeners();
  }

  void _setLoggedIn() {
    _authResponse.authStatus = AuthResponseStatus.LoggedIn;
    notifyListeners();
  }

  void _setAuthenticating() {
    _authResponse.authStatus = AuthResponseStatus.Authenticating;
    notifyListeners();
  }

  void _setAuthDetails(AuthDetails userAuth) async {
    await UserPreferences.saveUserAuth(userAuth);
    _setLoggedIn();
  }

  Future<void> loadAuthStatus() async {
    AuthDetails user = await UserPreferences.getUser();
    if (user == null)
      _setLoggedOut();
    else
      _setLoggedIn();
  }

  void _setError(Exception exception) {
    _authResponse.authStatus = AuthResponseStatus.Error;
    _authResponse.exception = exception;
    notifyListeners();
  }

  Future<void> loginUser(Map<String, dynamic> userData) async {
    try {
      _setAuthenticating();
      AuthDetails userAuth = await AuthService.loginUser(userData);
      if (userAuth != null) {
        _setAuthDetails(userAuth);
      }
    } catch (e) {
      _setError(e);
    }
  }

  Future<void> logoutUser() async {
    await UserPreferences.removeUser();
    _authResponse.authStatus = AuthResponseStatus.LoggedOut;
    _authResponse.userAuth = null;
    notifyListeners();
  }
}
