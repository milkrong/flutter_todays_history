import 'package:flutter/material.dart';

import 'models/history.dart';
import 'repository/history_repository.dart';
import 'history_tile.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
        future: getHistory(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<History> histories = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return new Text("Loading");
            default:
              return new ListView.builder(
                  itemCount: histories.length,
                  padding: EdgeInsets.all(2.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: HistoryTile(histories[index]),
                    );
                  }
              );
          }
        }
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("历史上的今天"),
      ),
      body: futureBuilder
    );
  }
}