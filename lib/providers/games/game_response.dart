import '../../models/games/index.dart';
import 'game_response_status.dart';

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
