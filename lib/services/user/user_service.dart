
import 'dart:convert';

import 'package:bluestacks/constants/service_constants.dart';
import 'package:bluestacks/models/user/user.dart';
import 'package:bluestacks/services/utils/response_handler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class UserService {

  static Future<User> getUserDetails(id) async {
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