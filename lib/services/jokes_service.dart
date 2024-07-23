import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:sqflite/sqflite.dart';

const jokesTable = "JOKES_TABLE";

class JokesService {
  final Database _database;

  JokesService({required Database database}) : _database = database;

  Future<Joke> onCreate(Joke joke) async {
    final map = joke.toMap();
    map['id'] = null;

    final id = await _database.insert(jokesTable, map);
    return joke.copyWith(id: id);
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

  Future<void> onDelete(Joke joke) async {
    await _database.delete(
      jokesTable,
      where: 'id = ?',
      whereArgs: [joke.id],
    );
  }

  Future<List<Joke>> getJokes() async {
    final currentDate = DateTime.now().withZeroTime.microsecondsSinceEpoch;
    final map = await _database.query(
      jokesTable,
      where: 'created = ?',
      whereArgs: [currentDate],
    );
    if (map.isEmpty) return [];

    final list = map.map(Joke.fromMap).toList();
    return list;
  }

  Future<List<Joke>> getLastWeek() async {
    final currentDate = DateTime.now().withZeroTime;
    final temp = currentDate.microsecondsSinceEpoch;
    final lastWeek =
        currentDate.subtract(Duration(days: 7)).microsecondsSinceEpoch;
    final map = await _database.query(jokesTable,
        where: 'created >= ? AND created < ?', whereArgs: [lastWeek, temp]);
    if (map.isEmpty) return [];

    final list = map.map(Joke.fromMap).toList();
    return list;
  }

  Future<List<Joke>> getLastMonth() async {
    final currentDate = DateTime.now().withZeroTime;
    final lastWeek =
        currentDate.subtract(Duration(days: 7)).microsecondsSinceEpoch;
    final map = await _database.query(
      jokesTable,
      where: 'created < ?',
      whereArgs: [lastWeek],
    );
    if (map.isEmpty) return [];

    final list = map.map(Joke.fromMap).toList();
    return list;
  }
}
