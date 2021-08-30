import '../../models/auth/auth.dart';
import '../utils/response_handler.dart';

class AuthService {
  static Map<String, Map<String, dynamic>> _allowedUsers = {
    "9898989898": {
      "id" : 1,
      "password" : "password123",
    },
    "9876543210": {
      "id" : 2,
      "password" : "password123",
    },
  };

  static Future<AuthDetails> loginUser(Map<String, dynamic> userData) async {
    String username = userData["username"].toString().trim();
    String password = userData["password"].toString().trim();

    //false time delay returning data
    await Future.delayed(Duration(microseconds: 600));

    if (_allowedUsers.containsKey(username)) {
      Map<String, dynamic> userMap = _allowedUsers[username];
      if (userMap["password"].toString().trim() == password) {
        //valid user credentials

        //sample response data
        Map<String, dynamic> responseData = {
          "userId": userMap["id"],
          "phone": username,
          "accessToken": "access_token",
          "refreshToken": "refresh_token",
        };
        return AuthDetails.fromAuthJson(responseData);
      } else {
        //invalid user credentials
        ResponseHandler.handleStatusCode(401);
      }
    } else {
      //user not found
      ResponseHandler.handleStatusCode(401);
    }
    return null;
  }
}
