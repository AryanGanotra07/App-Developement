import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../data/user/index.dart';
import '../../models/auth/index.dart';
import '../../models/user/index.dart';
import '../../services/utils/response_handler.dart';
import '../utils/service_constants.dart';


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