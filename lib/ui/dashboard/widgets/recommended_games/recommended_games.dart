import 'package:bluestacks/models/games/gameinfo.dart';
import 'package:bluestacks/providers/games/game_response.dart';
import 'package:bluestacks/providers/games/game_response_status.dart';
import 'package:bluestacks/providers/games/recommended_games_provider.dart';
import 'package:bluestacks/services/games/recommended_games_service.dart';
import 'package:bluestacks/ui/dashboard/widgets/recommended_games/game_card.dart';
import 'package:bluestacks/widgets/error/index.dart';
import 'package:bluestacks/widgets/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RecommendedGames extends StatefulWidget {
  final ScrollController _scrollController;
  RecommendedGames(this._scrollController);


  @override
  _RecommendedGamesState createState() => _RecommendedGamesState();
}

class _RecommendedGamesState extends State<RecommendedGames> {



  @override
  void initState() {
    widget._scrollController.addListener(pagination);
    _fetchRecommendedGames();
    super.initState();


  }

  void _fetchRecommendedGames() {
    Provider.of<RecommendedGamesProvider>(context, listen: false).loadGamesInfo();
  }


  double _prevMaxScrollExtend = 0;
  void pagination() {
    double currentScrollExtent = widget._scrollController.position.pixels;
    double currentMaxScrollExtend = widget._scrollController.position.maxScrollExtent;
    // if ( currentScrollExtent >= _prevMaxScrollExtend + (currentMaxScrollExtend - _prevMaxScrollExtend) / 2.5 ) {
    //     _prevMaxScrollExtend = currentMaxScrollExtend;
    //     Provider.of<RecommendedGamesProvider>(context, listen: false).loadMore();
    //
    // }
    if (currentMaxScrollExtend == currentMaxScrollExtend) {
      Provider.of<RecommendedGamesProvider>(context, listen: false).loadMore();
    }
  }

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
          _buildGamesInfoConsumerWidget(),
          LinearProgressIndicator(),
        ],
      ),
    );
  }

  Widget _buildGamesInfoConsumerWidget() {

    return Consumer<RecommendedGamesProvider>(
      builder: (context, data, child) {
        GameResponse gamesInfo = data.response;
        switch(gamesInfo.status) {
          case GameResponseStatus.Fetching:
            return LoadingComponent();
          case GameResponseStatus.Fetched:
            return _buildGamesListWidget(gamesInfo.games);
          case GameResponseStatus.Error:
            return Error(
              errorMessage: gamesInfo.message,
              onRetry: () => _fetchRecommendedGames(),
            );
          default:
            return LoadingComponent();

        }
      },
    );
  }

  Widget _buildScrollNotifierWidget(List<GameInfo> gamesInfo) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo is ScrollEndNotification &&
            scrollInfo.metrics.extentAfter == 0) {
          return true;
        }
        return false;
      },
      child: _buildGamesListWidget(gamesInfo),
    );
  }

  Widget _buildGamesListWidget(List<GameInfo> gamesInfo) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [ ListView.builder(
          itemCount: gamesInfo.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          cacheExtent: 10,
          itemBuilder: (context, index) {
            GameInfo gameInfo = gamesInfo.elementAt(index);
            return GameCard(gameInfo);
          },
        ),
      ]
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