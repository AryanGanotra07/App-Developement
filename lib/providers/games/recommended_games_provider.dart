import 'package:flutter/material.dart';

import '../../models/games/index.dart';
import '../../services/games/index.dart';
import 'game_response.dart';
import 'game_response_status.dart';

class RecommendedGamesProvider extends ChangeNotifier {
  GameResponse _response = new GameResponse(
    status: GameResponseStatus.NotFetching,
  );

  GameResponse get response => _response;

  void _setGames(List<GameInfo> games, String cursor) {
    _response.games = games;
    _response.status = GameResponseStatus.Fetched;
    _response.cursor = cursor;
    notifyListeners();
  }

  void _addGames(List<GameInfo> games, String cursor) {
    _response.games.addAll(games);
    _response.status = GameResponseStatus.Fetched;
    _response.cursor = cursor;
    notifyListeners();
  }

  void _setError(Exception exception) {
    _response.status = GameResponseStatus.Error;
    _response.exception = exception;
    notifyListeners();
  }

  void _setFetching({notify: false}) {
    _response.status = GameResponseStatus.Fetching;
    // if (notify)
    //   notifyListeners();
  }

  Future<void> loadGamesInfo() async {
    if (_response.games == null) {
      try {
        _setFetching();

        Map<String, dynamic> response =
            await RecommendedGamesService.fetchRecommendedGames(null);

        String cursor = response["cursor"];
        List<GameInfo> games = response["games"];

        _setGames(games, cursor);
      } catch (e) {
        _setError(e);
      }
      return;
    }
    notifyListeners();
  }

  void clear() {
    _response = new GameResponse(
      status: GameResponseStatus.NotFetching,
    );
  }

  Future<void> loadMore() async {
    try {
      _setFetching();
      Map<String, dynamic> response =
          await RecommendedGamesService.fetchRecommendedGames(
              _response.cursor != null ? _response.cursor : null);
      String cursor = response["cursor"];
      List<GameInfo> games = response["games"];
      if (_response.games == null) {
        _setGames(games, cursor);
      } else {
        _addGames(games, cursor);
      }
    } catch (e) {
      _setError(e);
    }
  }

  Future<void> refreshGamesInfo() async {
    try {
      _setFetching(notify: true);
      Map<String, dynamic> response =
          await RecommendedGamesService.fetchRecommendedGames(null);

      String cursor = response["cursor"];
      List<GameInfo> games = response["games"];

      _setGames(games, cursor);
      notifyListeners();
    } catch (e) {
      _setError(e);
    }
  }
}
