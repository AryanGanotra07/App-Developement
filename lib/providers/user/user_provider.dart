import 'package:bluestacks/data/user_preferences.dart';
import 'package:bluestacks/models/auth/auth.dart';
import 'package:bluestacks/models/user/user.dart';
import 'package:bluestacks/providers/user/user_response.dart';
import 'package:bluestacks/providers/user/user_response_status.dart';
import 'package:bluestacks/services/user/user_service.dart';
import 'package:bluestacks/services/utils/exception_handler.dart';
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

  void _setError(Exception exception) {
    _response.status = UserResponseStatus.Error;
    _response.exception = exception;
    notifyListeners();
  }

  void clear() {
    _response = UserResponse(
        status: UserResponseStatus.NotFetching
    );
  }

  void _setFetching({notify : false}) {
    _response.status = UserResponseStatus.Fetching;
    // if (notify)
    //   notifyListeners();
  }

  Future<void> loadUser({forcefully : false}) async {
    if (_response.user != null) {
      // notifyListeners();
      return;
    }
    if ((_response.status != UserResponseStatus.Error) || forcefully) {
      _setFetching(notify: true);
      try {
        User userFromNetwork = await UserService.getUserDetails();
        _setUser(userFromNetwork);
      } catch (e) {
        _setError(e);
      }
    }
  }
}