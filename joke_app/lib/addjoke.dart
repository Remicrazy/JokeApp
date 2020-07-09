import 'package:flutter/material.dart';

class AddJoke extends StatefulWidget {
  @override
  _AddJokeState createState() => _AddJokeState();
}

class _AddJokeState extends State<AddJoke> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Joke'),
      ),
      body: Center(
        child: Text('Test Navigation'),
      ),
    );
  }
}
