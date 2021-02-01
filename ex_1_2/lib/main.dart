import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    final widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: Center(
          child: new Stack(children: [
            buildRow(),
            Positioned(
              bottom: heightDevice * 0.25 + 10,
              left: 20,
              child: Container(
                color: Colors.blueGrey,
                width: widthDevice * 0.4,
                height: heightDevice * 0.25 - 40,
              ),
            ),
          ])
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.play_arrow_sharp),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildRow() =>
      // #docregion Row
      Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: buildColumn(),
            flex: 1,
          ),
          Expanded(
              child: Container(
                color: Colors.pinkAccent,
              ),
              flex: 2),
          Container(
            color: Colors.white,
            width: 10,
          ),
          Expanded(
              child: Container(
                color: Colors.pinkAccent,
              ),
              flex: 1),
        ],
      );

  Widget buildColumn() =>
      // #docregion Column
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.grey,
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.orange,
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.pinkAccent,
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.lightBlue,
                        ),
                        flex: 3,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.greenAccent,
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.lightBlue,
                        ),
                        flex: 3,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.yellow,
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                  flex: 1,
                ),
              ],
            ),
            flex: 1,
          ),
          Expanded(
              child: Container(
                color: Colors.black,
              ),
              flex: 1),
          Expanded(
              child: Container(
                color: Colors.yellowAccent,
              ),
              flex: 1),
          Expanded(
              child: Container(
                color: Colors.white,
              ),
              flex: 1),
        ],
      );
// #enddocregion Column
}
