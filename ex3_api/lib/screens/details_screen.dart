import 'package:ex3_api/models/userProfile.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailsScreen extends StatelessWidget {
  final UserProfile user;

  const DetailsScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(user.name.first + ' ' + user.name.last),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                SizedBox(
                  width: 115,
                  height: 115,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(user.picture.large),
                      ),
                    ],
                  ),
                ),
                Text(user.name.title +
                    ' ' +
                    user.name.first +
                    ' ' +
                    user.name.last),
                Text(user.location.street.number.toString() +
                    ' ' +
                    user.location.street.name),
                Text(''),
              ],
            ),
          ),
        ));
  }
}
