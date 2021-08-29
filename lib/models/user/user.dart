import 'tournament_info.dart';

class User {
  int userId;
  String name;
  String email;
  String phone;
  String ratingKey;
  String ratingValue;
  String imageUrl;
  TournamentInfo tournamentInfo;

  User(
      {this.userId,
      this.name,
      this.email,
      this.phone,
      this.ratingKey,
      this.ratingValue,
      this.imageUrl,
      this.tournamentInfo});

  factory User.fromDetailsJson(Map<String, dynamic> responseData) {
    return new User(
      userId: responseData["userId"],
      name: responseData["name"],
      imageUrl: responseData["imgUrl"],
      ratingKey: responseData["ratingKey"],
      ratingValue: responseData["ratingValue"],
      tournamentInfo: TournamentInfo.fromJson(responseData),
    );
  }
}
