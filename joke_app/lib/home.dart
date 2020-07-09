import 'package:joke_app/joke.dart';
import 'package:joke_app/jokeDatabase.dart';
import 'package:joke_app/jokeNetwork.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(10.0),
              ),
            ),
            Expanded(flex: 5, child: JokesListView(key: jokesListviewKey)),
          ],
        ),
      ),
    );
  }
}
