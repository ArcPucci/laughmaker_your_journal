import 'package:laughmaker_your_journal/models/models.dart';
import 'package:sqflite/sqflite.dart';

const jokesTable = "JOKES_TABLE";

class JokesService {
  final Database _database;

  JokesService({required Database database}) : _database = database;

  Future<void> onCreate(Joke joke) async {
    final map = joke.toMap();
    map['id'] = null;

    await _database.insert(jokesTable, map);
  }

  Future<void> onUpdate(Joke joke) async {
    final map = joke.toMap();
    await _database.update(
      jokesTable,
      map,
      where: 'id = ?',
      whereArgs: [joke.id],
    );
  }

  Future<List<Joke>> getJokes() async {
    final map = await _database.query(jokesTable);
    if (map.isEmpty) return [];

    final list = map.map(Joke.fromMap).toList();
    return list;
  }
}
