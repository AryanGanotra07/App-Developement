

class AuthDetails {
  int userId;
  String accessToken;
  String refreshToken;


  AuthDetails({
    this.userId,
    this.refreshToken,
    this.accessToken,
});

  factory AuthDetails.fromAuthJson(Map<String, dynamic> responseData) {
    return new AuthDetails(
      userId: responseData["userId"],
      accessToken: responseData["accessToken"],
      refreshToken: responseData["refreshToken"],
    );
  }
}