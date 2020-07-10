import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:joke_app/joke.dart';
import 'package:joke_app/jokeDatabase.dart';

class MyAPIJoke extends StatefulWidget {
  @override
  _MyAPIJokeState createState() => _MyAPIJokeState();
}

class _MyAPIJokeState extends State<MyAPIJoke> {
  Future<Joke> _getJokes() async {
    // Construction de l'URL a appeler
    var url = 'https://sv443.net/jokeapi/v2/joke/Any';
    // Appel
    var response = await http.get(url);
    Map jokeMap = jsonDecode(response.body);
    var jokereponse = Joke.fromJson(jokeMap);
    return jokereponse;
  }

  _addNewJoke(String anId, String aCategory, String aJokeText) async {
    var aJoke = Joke(id: anId, category: aCategory, joke: aJokeText);
    await JokesDatabase.instance.insertJoke(aJoke);
  }

  _addNewJokeD(
      String anId, String aCategory, String aSetup, String aDelivery) async {
    var aJokeD =
        Joke(id: anId, category: aCategory, setup: aSetup, delivery: aDelivery);
    await JokesDatabase.instance.insertJoke(aJokeD);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Récupe Api'),
      ),
      body: FutureBuilder(
          future: _getJokes(),
          builder: (BuildContext context, AsyncSnapshot<Joke> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                // En attendant le résultat, affichons un loader.
                return new Center(child: new CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) {
                  // En cas d'erreur.
                  return new Text(
                    '${snapshot.error}',
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  if (snapshot.data.joke == null) {
                    return Center(
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.message),
                              title: Text(snapshot.data.setup.toString()),
                              subtitle: Text(snapshot.data.delivery.toString()),
                            ),
                            ButtonBar(
                              children: <Widget>[
                                FlatButton(
                                    onPressed: () => setState(() {}),
                                    child: Text('Other Joke')),
                                FlatButton(
                                    onPressed: () {
                                      _addNewJokeD(
                                          snapshot.data.id.toString(),
                                          snapshot.data.category.toString(),
                                          snapshot.data.setup.toString(),
                                          snapshot.data.delivery.toString());
                                      setState(() {});
                                    },
                                    child: Text('Save on'))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.message),
                              title: Text(snapshot.data.joke.toString()),
                            ),
                            ButtonBar(
                              children: <Widget>[
                                FlatButton(
                                    onPressed: () => setState(() {}),
                                    child: Text('Other Joke')),
                                FlatButton(
                                    onPressed: () {
                                      _addNewJoke(
                                          snapshot.data.id.toString(),
                                          snapshot.data.category.toString(),
                                          snapshot.data.joke.toString());
                                      setState(() {});
                                    },
                                    child: Text('Save on')),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                }
                break;
              default:
                return new Text('');
            }
          }),
    );
  }
}
