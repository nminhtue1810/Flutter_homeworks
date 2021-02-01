import 'package:flutter/material.dart';
import 'package:ex2/ToDo.dart';

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
      home: MyHomePage(title: 'Flutter - Todo list'),
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
  List<ToDo> _todoList = [];

  _toggleToDo(ToDo item, bool isChecked) {
    setState(() {
      item.isDone = isChecked;
    });
  }

  void _addToDoItem(String task) {
    final item = ToDo(title: task);
    if (task.length > 0) {
      setState(() {
        _todoList.add(item);
      });
    }
  }

  void _pushAddToDoScreen() {
    Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(title: new Text('Add a new reminder')),
          body: new TextField(
            autofocus: true,
            onSubmitted: (val) {
              _addToDoItem(val);
              Navigator.pop(context); // Close the add todo screen
            },
            decoration: new InputDecoration(
                hintText: 'Enter something to do...',
                contentPadding: const EdgeInsets.all(16.0)),
          ));
    }));
  }

  // Build the whole list of todo items
  Widget _buildToDoList() {
    return ListView.builder(
      itemBuilder: _buildToDoItem,
      itemCount: _todoList.length,
    );
  }

  // Build a single todo item
  Widget _buildToDoItem(BuildContext context, int index) {
    final item = _todoList[index];
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.all (5.0),
      child: CheckboxListTile(
        value: item.isDone,
        title: Text(item.title),
        onChanged: (bool isChecked) {
          _toggleToDo(item, isChecked);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildToDoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _pushAddToDoScreen,
        tooltip: 'Add an item',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
