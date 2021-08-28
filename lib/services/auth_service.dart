


import 'package:bluestacks/models/user.dart';



class AuthService {
  static Map<String, dynamic> _allowedUsers = {
    "9898989898" : "password123",
    "9876543210" : "password123",
    "9999" : "abcd",
  };
  static Future<User> loginUser(Map<String, dynamic> userData) async {

    String username = userData["username"].toString().trim();
    String password = userData["password"].toString().trim();

    //false time delay returning data
    await Future.delayed(Duration(seconds: 1));

    if (_allowedUsers.containsKey(username)) {
      print("contains");
      if (_allowedUsers["username"].toString().trim().compareTo(password) == 1) {
        //valid user credentials

        //sample response data
        Map<String, dynamic> responseData = {
          "userId" : 1,
          "phone" : username,
          "accessToken" : "access_token",
          "refreshToken" : "refresh_token",
        };
        return User.fromJson(responseData);
      } else {
        //invalid user credentials

      }
    } else {
      //user not found
    }
    return null;
  }
}