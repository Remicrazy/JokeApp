import 'package:joke_app/joke.dart';
import 'package:joke_app/jokeDatabase.dart';
import 'package:joke_app/jokeAPI.dart';
import 'package:joke_app/jokeNetwork.dart';
import 'package:flutter/material.dart';

class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  GlobalKey<JokesListViewState> jokesListviewKey = GlobalKey();
  //_addNewJoke() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Jokes'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(child: JokesListView(key: jokesListviewKey)),
          ],
        ),
      ),
    );
  }
}
