import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:joke_app/joke.dart';

class JokesDatabase {
  JokesDatabase._privateConstructor();
  static final JokesDatabase instance = JokesDatabase._privateConstructor();
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  _initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'jokes_database.db'),
      onCreate: (db, version) {
        return db.execute("CREATE TABLE jokes(...)");
      },
      version: 1,
    );
    return database;
  }

  Future<void> insertJoke(Joke joke) async {
    final Database db = await instance.database;
    await db.insert('jokes', joke.toMap());
  }

  Future<List<Joke>> jokes() async {
    final Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('jokes');
    return List.generate(maps.length, (i) {
      return Joke(
        id: maps[i]['id'],
        category: maps[i]['category'],
        joke: maps[i]['joke'],
        setup: maps[i]['setup'],
        delivery: maps[i]['delivery'],
        flags: maps[i]['flags'],
      );
    });
  }

  Future<void> deleteJoke(int id) async {
    final db = await instance.database;
    await db.delete(
      'jokes',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
