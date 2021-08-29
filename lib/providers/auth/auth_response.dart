

import 'package:bluestacks/models/auth/auth.dart';
import 'package:bluestacks/providers/auth/auth_response_status.dart';

class AuthResponse {
  String message;
  AuthDetails userAuth;
  AuthResponseStatus authStatus;

  AuthResponse({
    this.message,
    this.userAuth,
    this.authStatus,
});
}