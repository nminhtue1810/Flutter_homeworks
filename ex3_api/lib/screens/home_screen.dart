import 'package:ex3_api/models/userProfile.dart';
import 'package:ex3_api/screens/body.dart';
import 'package:ex3_api/services/api_services.dart';
import 'package:flutter/material.dart';
import 'profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Profiles & Addresses'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<UserProfile>> futureProfiles;

  _MyHomePageState();

  @override
  Widget build(BuildContext context) {
    futureProfiles = getUserProfiles();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // ignore: missing_return
      body: FutureBuilder(
          future: futureProfiles,
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // ignore: missing_return,
              return ScreenBody(userProfiles: snapshot.data);
            } else if (snapshot.hasError) {
              return Text('Snapshot has error');
            }
            return CircularProgressIndicator();
          }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
