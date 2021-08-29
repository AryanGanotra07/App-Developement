

class TournamentInfo {
  int played;
  int won;


  TournamentInfo({
    this.played,
    this.won
});

  factory TournamentInfo.fromJson(Map<String, dynamic> responseData) {
    return new TournamentInfo(
      played: responseData["tournamentInfo"]["played"],
      won: responseData["tournamentInfo"]["won"],
    );
  }
}