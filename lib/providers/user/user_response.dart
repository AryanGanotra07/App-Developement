

import 'package:bluestacks/models/user/user.dart';
import 'package:bluestacks/providers/user/user_response_status.dart';

class UserResponse {
  UserResponseStatus status;
  User user;
  Exception exception;

  UserResponse({
    this.status,
    this.exception,
    this.user,
  });
}