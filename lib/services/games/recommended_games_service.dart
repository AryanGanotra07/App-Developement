import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/games/index.dart';
import '../utils/response_handler.dart';
import '../utils/service_constants.dart';

class RecommendedGamesService {
  static Future<Map<String, dynamic>> fetchRecommendedGames(
      String cursor) async {
    String baseUrl = Constants.GAMES_BASE_URL;

    if (cursor != null) {
      baseUrl += "&cursor=$cursor";
    }
    Uri baseUrlUri = Uri.parse(baseUrl);
    final response = await http.get(baseUrlUri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<GameInfo> gamesInfo = List<GameInfo>.from(
          json["data"]["tournaments"].map((x) => GameInfo.fromJson(x)));
      return {
        "games": gamesInfo,
        "cursor": json["data"]["cursor"],
      };
    } else {
      ResponseHandler.handleStatusCode(response.statusCode);
    }
    return null;
  }
}
