import 'package:flutter/material.dart';


class GameCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildGameCard();
  }

  Widget _buildGameCard() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
     child : Column(
            children: [
              _buildGameImage(),


            ],
        ),
    );
  }

  Widget _buildGameImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Stack(
          children : [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Image.network('https://wallpapercave.com/wp/wp8769243.jpg'),
            ),
      Positioned.fill(

          child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                tileColor: Colors.white,
                title: Text(
                  "Fortnite Champions Mar 2020 Team Game",
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  "Fortnite"
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