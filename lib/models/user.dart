

class User {

  int userId;
  String name;
  String email;
  String phone;
  String accessToken;
  String refreshToken;

  User({this.userId, this.name, this.email, this.phone, this.accessToken, this.refreshToken});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return new User(
      userId: responseData["userId"],
      phone: responseData["username"],
      accessToken: responseData["accessToken"],
      refreshToken: responseData["refreshToken"],
    );
  }
}