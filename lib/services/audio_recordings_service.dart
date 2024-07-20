import 'package:laughmaker_your_journal/models/models.dart';
import 'package:sqflite/sqflite.dart';

const recordingsTable = "RECORDINGS_TABLE";

class AudioRecordingsService {
  final Database _database;

  AudioRecordingsService({required Database database}) : _database = database;

  Future<void> onCreate(Joke joke) async {
    final map = joke.toMap();
    map['id'] = null;

    await _database.insert(recordingsTable, map);
  }

  Future<void> onDelete(Joke joke) async {
    await _database.delete(
      recordingsTable,
      where: 'id = ?',
      whereArgs: [joke.id],
    );
  }

  Future<List<Joke>> getJokes(int jokeId) async {
    final map = await _database.query(
      recordingsTable,
      where: 'joke_id = ?',
      whereArgs: [jokeId],
    );

    if (map.isEmpty) return [];

    final list = map.map(Joke.fromMap).toList();
    return list;
  }
}
