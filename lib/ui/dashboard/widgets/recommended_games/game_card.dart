import 'package:bluestacks/models/games/gameinfo.dart';
import 'package:flutter/material.dart';



class GameCard extends StatelessWidget {
  final GameInfo gameInfo;
  GameCard(this.gameInfo);

  @override
  Widget build(BuildContext context) {
    return _buildGameCard(context);
  }

  Widget _buildGameCard(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0))),
     height: 200,
     child : _buildGameComponentWidget(),
    );
  }

  Widget _buildGameComponentWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Stack(
          children : [
            Padding(
              padding: const EdgeInsets.only(bottom : 1.0),
              child: Image.network(
                  // placeholder: 'assets/images/template.jpg',
                  gameInfo.coverUrl, fit: BoxFit.fitWidth, width: double.infinity,),
            ),

      Positioned.fill(

          child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                tileColor: Colors.white,
                title: Text(
                  gameInfo.name,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  gameInfo.gameName
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.chevron_right_sharp,
                  ),
                  onPressed:  () {

                  },
                ),
              ),
          ),
      ),
      ]
      ),
    );
  }

}