import 'package:bluestacks/models/user/user.dart';
import 'package:bluestacks/providers/user/user_provider.dart';
import 'package:bluestacks/providers/user/user_response.dart';
import 'package:bluestacks/providers/user/user_response_status.dart';
import 'package:bluestacks/ui/dashboard/widgets/user_profile/tournaments_details.dart';
import 'package:bluestacks/widgets/error/error.dart';
import 'package:bluestacks/widgets/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return _buildUserProfileConsumerWidget();
  }

  @override
  void initState() {
    _fetchUserDetails();
    super.initState();

  }

  void _fetchUserDetails({forcefully :false}) {
    Provider.of<UserProvider>(context, listen: false).loadUser(forcefully: forcefully);
    setState(() {
    });
  }



  Widget _buildUserProfileConsumerWidget() {
    return Consumer<UserProvider>(
      builder: (context, data, child) {
        UserResponse userResponse = data.userResponse;

        switch (userResponse.status) {
          case UserResponseStatus.Fetched:
            return _buildUserProfileWidget(userResponse.user);
          case UserResponseStatus.Error:
            return Error(
              errorException: userResponse.exception,
              onRetry: () => _fetchUserDetails(forcefully: true),
            );
          default:
            return LoadingComponent();
        }
      }
    );

  }

  Widget _buildUserProfileWidget(User user) {
  return Padding(
  padding: const EdgeInsets.all(8.0),
  child: Column(
    children: [
      Row(
      children: [
      _buildUserImageWidget(user),
      _buildUserDetailsWidget(user),
      ],
      ),
      TournamentsDetails(user),
    ],
  ),
  );
}

  Widget _buildUserImageWidget(User user) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
          width: 100.0,
          height: 100.0,
          decoration:
          new BoxDecoration(
              shape: BoxShape.circle,
              image:
              new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      user.imageUrl)
              )
          )),
    );
  }

  Widget _buildUserDetailsWidget(User user) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(user.name,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),),
          ),
          _buildUserRatingWidget(user),
        ],
      ),
    );
  }

  Widget _buildUserRatingWidget(User user) {
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
                  child: Text(user.ratingValue,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal :8.0),
                  child: Text(user.ratingKey,
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }

}