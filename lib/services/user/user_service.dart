
import 'dart:convert';

import 'package:bluestacks/services/utils/service_constants.dart';
import 'package:bluestacks/data/user_preferences.dart';
import 'package:bluestacks/models/auth/auth.dart';
import 'package:bluestacks/models/user/user.dart';
import 'package:bluestacks/services/utils/response_handler.dart';
import 'package:http/http.dart' as http;


class UserService {

  static Future<User> getUserDetails() async {
    AuthDetails userAuthFromLocalStorage = await UserPreferences.getUser();
    if (userAuthFromLocalStorage == null) {
      ResponseHandler.handleStatusCode(403);
      //unauthorized access
      return null;
    }
    int id = userAuthFromLocalStorage.userId;
    final response = await http.get(Uri.parse("${Constants.BASE_URL}/user/$id"));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return User.fromDetailsJson(json);
    } else {
      ResponseHandler.handleStatusCode(response.statusCode);
    }
    return null;
  }
}