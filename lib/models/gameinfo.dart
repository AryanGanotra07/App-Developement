

class GameInfo {
  String name;
  String coverUrl;
  String gameName;

  GameInfo({
    this.coverUrl,
    this.name,
    this.gameName
});


  factory GameInfo.fromJson(Map<String, dynamic> responseData) {
    return GameInfo(
      name: responseData["name"],
      coverUrl: responseData["cover_url"],
      gameName: responseData["game_name"],
    );
  }
}