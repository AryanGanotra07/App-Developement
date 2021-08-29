import 'package:bluestacks/models/user/user.dart';
import 'package:flutter/material.dart';


class TournamentsDetails extends StatelessWidget {
  final User user;
  TournamentsDetails(this.user);

  @override
  Widget build(BuildContext context) {
    return _buildTournamentsDetailsWidget();
  }

  Widget _buildTournamentsDetailsWidget() {
   return _buildRowsWidget();
  }

  Widget _buildRowsWidget() {
    String played = user.tournamentInfo.played.toString();
    String won = user.tournamentInfo.won.toString();
    List<Map<String, dynamic>> data = [
      {
        "color" : Colors.orange,
        "key" : "Tournaments Played",
        "value" : played,

      },
      {
        "color" : Colors.deepPurpleAccent,
        "key" : "Tournaments Won",
        "value" : "${won.padLeft(played.length, "0")}",
      },
     {
        "color" : Colors.deepOrange,
        "key" : "Winning Percentage",
        "value" : "${((user.tournamentInfo.won / user.tournamentInfo.played) * 100).toInt()}%",
      },
    ];
    // return _buildDetailsWidget(data.elementAt(0));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildDetailsWidget(data.elementAt(0), leftBorder: true),
                _buildDetailsWidget(data.elementAt(1)),
                _buildDetailsWidget(data.elementAt(2), rightBorder: true),
              ],
            ),
      ),
    );
  }

  Widget _buildDetailsWidget(Map<String, dynamic> e, {leftBorder : false, rightBorder: false}) {
    return Expanded(
      child: Container(

        decoration: _getDecoration(e["color"], leftBorder,  rightBorder),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                children: [
                  Text(
                      e["value"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                  ),
                  Text(
                    e["key"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,

                    ),
                  )
                ],
              ),
          ),
      ),
    );
  }

  BoxDecoration _getDecoration(Color color, bool left, bool right) {

      return BoxDecoration(
          color: color,
          border: Border.all(
           color: Colors.transparent,
          ),
          borderRadius: left ? BorderRadius.horizontal(left: Radius.circular(20.0)) :
          right ? BorderRadius.horizontal(right:Radius.circular(20.0)) : null);
  }

}