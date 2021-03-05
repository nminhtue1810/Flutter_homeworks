import 'package:ex3_api/models/userProfile.dart';
import 'package:ex3_api/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ScreenBody extends StatelessWidget {
  final List<UserProfile> userProfiles;

  const ScreenBody({Key key, this.userProfiles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            height: 2,
            color: Colors.black,
          );
        },
        itemBuilder: (context, index) {
          UserProfile user = userProfiles[index];
          return ListTile(
            title: Text(user.name.first + ' ' + user.name.last),
            subtitle: Text(user.location.city + user.location.country),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsScreen(user: user))),
          );
        },
        itemCount: userProfiles.length,
      ),
    );
  }
}
