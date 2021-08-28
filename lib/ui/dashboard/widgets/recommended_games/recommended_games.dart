import 'package:bluestacks/ui/dashboard/widgets/recommended_games/game_card.dart';
import 'package:flutter/material.dart';


class RecommendedGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildRecommendedGamesWidget();
  }

  Widget _buildRecommendedGamesWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          _buildGamesListWidget(),
        ],
      ),
    );
  }

  Widget _buildGamesListWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        itemCount: 25,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GameCard();
        },
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 8.0,
        right: 8.0,
      ),
      child: Text(
        "Recommended for you",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }

}