import 'package:bluestacks/data/user_preferences.dart';
import 'package:bluestacks/models/auth/auth.dart';
import 'package:bluestacks/models/user/user.dart';
import 'package:bluestacks/providers/user/user_response.dart';
import 'package:bluestacks/providers/user/user_response_status.dart';
import 'package:bluestacks/services/user/user_service.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {

  UserResponse _response = UserResponse(
    status: UserResponseStatus.NotFetching
  );

  UserResponse get userResponse => _response;

  void _setUser(User user) {
    _response.user = user;
    _response.status = UserResponseStatus.Fetched;
    notifyListeners();
  }

  void _setError(String error) {
    _response.status = UserResponseStatus.Error;
    _response.message = error;
    notifyListeners();
  }

  void clear() {
    _response = UserResponse(
        status: UserResponseStatus.NotFetching
    );
  }

  void _setFetching() {
    _response.status = UserResponseStatus.Fetching;
    notifyListeners();
  }

  Future<void> loadUser() async {
    if (_response.user != null) {
      notifyListeners();
      return;
    }
    AuthDetails userAuthFromLocalStorage = await UserPreferences.getUser();
    if (userAuthFromLocalStorage != null) {
      _setFetching();
      try {
        User userFromNetwork = await UserService.getUserDetails(
            userAuthFromLocalStorage.userId);
        _setUser(userFromNetwork);
      } catch (e) {
        _setError(e.toString());
      }
    }
  }
}