import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:joke_app/joke.dart';
import 'package:joke_app/jokeDatabase.dart';

class JokesListView extends StatefulWidget {
  const JokesListView({Key key}) : super(key: key);
  @override
  JokesListViewState createState() => JokesListViewState();
}

class JokesListViewState extends State<JokesListView> {
  List<Joke> data = new List<Joke>();

  void addJokeToList(Joke aJoke) {
    setState(() {
      data.add(aJoke);
    });
  }

  _deleteJoke(String anId) async {
    var whoJoke = anId;
    await JokesDatabase.instance.deleteJoke(whoJoke);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Joke>>(
      future: _fetchJokes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          data = snapshot.data;
          return _convertToJokesListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<Joke>> _fetchJokes() async {
    List<Joke> jokesDBList = await JokesDatabase.instance.jokes();
    return jokesDBList;
  }

  ListView _convertToJokesListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          if (data[index].joke == null) {
            return _title(data[index].setup, data[index].delivery,
                data[index].id, Icons.message, context);
          } else {
            return _title(data[index].joke, data[index].category,
                data[index].id, Icons.message, context);
          }
        });
  }

  Card _title(String title, String subtitle, String id, IconData icon,
          BuildContext context) =>
      Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(title),
              subtitle: Text(subtitle),
              leading: Icon(
                icon,
                color: Colors.blue[500],
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                    color: Colors.red,
                    textColor: Colors.black,
                    onPressed: () {
                      _deleteJoke(id);
                      setState(() {});
                    },
                    child: Text('Delete'))
              ],
            )
          ],
        ),
      );
}
