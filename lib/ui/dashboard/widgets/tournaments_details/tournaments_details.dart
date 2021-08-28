import 'package:flutter/material.dart';


class TournamentsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildTournamentsDetailsWidget();
  }

  Widget _buildTournamentsDetailsWidget() {
   return _buildRowsWidget();
  }

  Widget _buildRowsWidget() {
    List<Map<String, dynamic>> data = [
      {
        "color" : Colors.orange,
        "key" : "Tournaments Played",
        "value" : "34",

      },
      {
        "color" : Colors.deepPurpleAccent,
        "key" : "Tournaments Won",
        "value" : "09",
      },
     {
        "color" : Colors.deepOrange,
        "key" : "Winning Percentage",
        "value" : "26%",
      },
    ];
    // return _buildDetailsWidget(data.elementAt(0));
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          _buildDetailsWidget(data.elementAt(0), leftBorder: true),
          _buildDetailsWidget(data.elementAt(1)),
          _buildDetailsWidget(data.elementAt(2), rightBorder: true),
        ],
      ),
    );
  }

  Widget _buildDetailsWidget(Map<String, dynamic> e, {leftBorder : false, rightBorder: false}) {
    return Flexible(
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