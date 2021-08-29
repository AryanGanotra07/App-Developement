

import 'package:bluestacks/models/games/gameinfo.dart';
import 'package:bluestacks/providers/games/game_response_status.dart';

class GameResponse {
  GameResponseStatus status;
  List<GameInfo> games;
  String cursor;
  Exception exception;

  GameResponse({
    this.status,
    this.games,
    this.exception,
    this.cursor,
  });
}