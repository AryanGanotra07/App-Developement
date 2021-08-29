import '../../models/auth/auth.dart';
import 'auth_response_status.dart';

class AuthResponse {
  Exception exception;
  AuthDetails userAuth;
  AuthResponseStatus authStatus;

  AuthResponse({
    this.exception,
    this.userAuth,
    this.authStatus,
  });
}
