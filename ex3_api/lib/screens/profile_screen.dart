import 'package:ex3_api/models/profile_body.dart';
import 'package:ex3_api/models/userProfile.dart';
import 'package:ex3_api/screens/details_screen.dart';
import 'package:ex3_api/services/api_services.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile & Address'),
      ),
      body: FutureBuilder(
        future: getUserProfiles(),
        // ignore: missing_return
        builder: (context, snapshot) {
          final userProfiles = snapshot.data;
          // ignore: missing_return
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  height: 2,
                  color: Colors.black,
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(userProfiles[index].name.first +
                    ' ' +
                    userProfiles[index].name.last),
                subtitle: Text(userProfiles[index].location.city +
                userProfiles[index].location.country),
                );
              },
              itemCount: userProfiles.length,
            );
          }
        },
      ),
    );
  }
}
