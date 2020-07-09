import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    final jokesListAPIUrl = 'https://sv443.net/jokeapi/v2/joke/Any';
    final response = await http.get(jokesListAPIUrl);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<Joke> jokesDBList = await JokesDatabase.instance.jokes();
      jsonResponse =
          jsonResponse.map((joke) => new Joke.fromJson(joke)).toList();
      jsonResponse.addAll(jokesDBList);
      return jsonResponse;
    } else {
      throw Exception('Failed to load Joke from API');
    }
  }

  ListView _convertToJokesListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _title(
              data[index].id, data[index].category, Icons.message, context);
        });
  }

  Card _title(
          String title, int subtitle, IconData icon, BuildContext context) =>
      Card(
        child: ListTile(
          title: Text(title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              )),
          subtitle: Text(subtitle.toString()),
          trailing: Icon(Icons.more_vert),
          leading: Icon(
            icon,
            color: Colors.blue[500],
          ),
        ),
      );
}
