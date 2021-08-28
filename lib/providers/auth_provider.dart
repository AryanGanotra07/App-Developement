



import 'package:bluestacks/constants/error_messages.dart';
import 'package:bluestacks/data/user_preferences.dart';
import 'package:bluestacks/models/user.dart';
import 'package:bluestacks/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Status {
  Authenticating,
  LoggedIn,
  LoggedOut
}

class AuthProvider extends ChangeNotifier {

  Status _authStatus = Status.LoggedOut;

  Status get authStatus => _authStatus;

  Future<Map<String, dynamic>> loginUser(Map<String, dynamic> userData) async {
    _authStatus = Status.Authenticating;
    notifyListeners();
    User user = await AuthService.loginUser(userData);
    Map<String, dynamic> data = new Map();
    if (user != null) {
      await UserPreferences.saveUser(user);
      _authStatus = Status.LoggedIn;
      notifyListeners();
      data["successful"] = true;
      data["error"] = "";
    } else {
      data["successful"] = false;
      data["error"] = ErrorMessages.INVALID_USER_ERROR;
    }
    return data;
  }

}