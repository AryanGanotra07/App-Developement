import 'package:flutter/material.dart';


class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildUserProfileWidget();
  }

  Widget _buildUserProfileWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          _buildUserImageWidget(),
          _buildUserDetailsWidget(),
        ],
      ),
    );
  }

  Widget _buildUserImageWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
          width: 100.0,
          height: 100.0,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      "https://cdn.dribbble.com/users/1993497/screenshots/9116145/media/1f2fbabc81cd40a8b19bebbca6d7ce37.png?compress=1&resize=300x300")
              )
          )),
    );
  }

  Widget _buildUserDetailsWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Simon Bakor",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),),
          ),
          _buildUserRatingWidget(),
        ],
      ),
    );
  }

  Widget _buildUserRatingWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueAccent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(24))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal :8.0),
                  child: Text("2250",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal :8.0),
                  child: Text("Elo rating",
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }

}