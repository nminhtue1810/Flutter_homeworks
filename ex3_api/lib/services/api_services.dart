import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ex3_api/models/userProfile.dart';

Future<List<UserProfile>> getUserProfiles() async {
  final response = await http.get('https://randomuser.me/api/?results=50');
  if (response.statusCode == 200) {
    final jsonRes = jsonDecode(response.body);
    final users = List<UserProfile>.from(jsonRes['results'].map((json) => UserProfile.fromJson(json)));
    return users;
  } else {
    print("Cannot get users");
    return null;
  }
}

Future<UserProfile> fetchUser() async {
  final response = await http.get('https://randomuser.me/api/');

  if (response.statusCode == 200) {
    return UserProfile.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load user profile');
  }
}