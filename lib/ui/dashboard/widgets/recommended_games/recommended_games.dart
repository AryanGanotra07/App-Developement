import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/games/index.dart';
import '../../../../providers/games/index.dart';
import '../../../../widgets/error/index.dart';
import '../../../../widgets/loading/loading.dart';
import 'game_card.dart';

class RecommendedGames extends StatefulWidget {
  final ScrollController _scrollController;

  RecommendedGames(this._scrollController);

  @override
  _RecommendedGamesState createState() => _RecommendedGamesState();
}

class _RecommendedGamesState extends State<RecommendedGames> {
  ThemeData _themeData;
  @override
  void initState() {
    widget._scrollController.addListener(pagination);
    _fetchRecommendedGames();
    super.initState();
  }

  void _fetchRecommendedGames() {
    Provider.of<RecommendedGamesProvider>(context, listen: false)
        .loadGamesInfo();
  }

  void _refreshRecommendedGames() {
    Provider.of<RecommendedGamesProvider>(context, listen: false)
        .refreshGamesInfo();
    setState(() {});
  }

  void pagination() {
    double currentScrollExtent = widget._scrollController.position.pixels;
    double currentMaxScrollExtend =
        widget._scrollController.position.maxScrollExtent;
    if (currentScrollExtent == currentMaxScrollExtend) {
      Provider.of<RecommendedGamesProvider>(context, listen: false).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
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
        ],
      ),
    );
  }

  Widget _buildGamesInfoConsumerWidget() {
    return Consumer<RecommendedGamesProvider>(
      builder: (context, data, child) {
        GameResponse gamesInfo = data.response;
        switch (gamesInfo.status) {
          case GameResponseStatus.Fetched:
            return _buildGamesListWidget(gamesInfo.games);
          case GameResponseStatus.Error:
            return Error(
              errorException: gamesInfo.exception,
              onRetry: () => _refreshRecommendedGames(),
            );
          default:
            return LoadingComponent();
        }
      },
    );
  }

  Widget _buildGamesListWidget(List<GameInfo> gamesInfo) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        ListView.builder(
          itemCount: gamesInfo.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          cacheExtent: 10,
          itemBuilder: (context, index) {
            GameInfo gameInfo = gamesInfo.elementAt(index);
            return GameCard(gameInfo);
          },
        ),
        Positioned.fill(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: LinearProgressIndicator()),
        ),
      ]),
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
        style: _themeData.textTheme.headline5,
      ),
    );
  }
}
