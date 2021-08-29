import 'package:bluestacks/models/auth/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String USER_ID_KEY = "user_id";
  static const String ACCESS_TOKEN_KEY = "access_token";
  static const String REFRESH_TOKEN_KEY = "refresh_token";


  static Future<void> saveUserAuth(AuthDetails userAuth) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(USER_ID_KEY, userAuth.userId);
    await prefs.setString(ACCESS_TOKEN_KEY, userAuth.accessToken);
    await prefs.setString(REFRESH_TOKEN_KEY, userAuth.refreshToken);
  }

  static Future<AuthDetails> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int userId = prefs.getInt(USER_ID_KEY);
    String accessToken = prefs.getString(ACCESS_TOKEN_KEY);
    String refreshToken = prefs.getString(REFRESH_TOKEN_KEY);

    if (int == null ||
        accessToken == null ||
        refreshToken == null) {

      return null;

    }
    return AuthDetails(
        userId: userId,
        accessToken: accessToken,
        refreshToken: refreshToken,
        );
  }

  static Future<void> removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(USER_ID_KEY);
    prefs.remove(ACCESS_TOKEN_KEY);
    prefs.remove(REFRESH_TOKEN_KEY);
  }
}