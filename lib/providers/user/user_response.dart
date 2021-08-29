

import 'package:bluestacks/models/user/user.dart';
import 'package:bluestacks/providers/user/user_response_status.dart';

class UserResponse {
  UserResponseStatus status;
  User user;
  String message;

  UserResponse({
    this.status,
    this.message,
    this.user,
  });
}