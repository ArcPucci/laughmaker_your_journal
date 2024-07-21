import 'package:laughmaker_your_journal/models/models.dart';
import 'package:sqflite/sqflite.dart';

const recordingsTable = "RECORDINGS_TABLE";

class AudioRecordingsService {
  final Database _database;

  AudioRecordingsService({required Database database}) : _database = database;

  Future<void> onCreate(Recording recording) async {
    final map = recording.toMap();
    map['id'] = null;

    await _database.insert(recordingsTable, map);
  }

  Future<void> onUpdate(Recording recording) async {
    await _database.update(
      recordingsTable,
      recording.toMap(),
      where: 'id = ?',
      whereArgs: [recording.id],
    );
  }

  Future<void> onDelete(Recording recording) async {
    await _database.delete(
      recordingsTable,
      where: 'id = ?',
      whereArgs: [recording.id],
    );
  }

  Future<void> onDeleteByJoke(int jokeId) async {
    await _database.delete(
      recordingsTable,
      where: 'joke_id = ?',
      whereArgs: [jokeId],
    );
  }

  Future<List<Recording>> getAllRecordings() async {
    final map = await _database.query(recordingsTable);

    if (map.isEmpty) return [];

    final list = map.map(Recording.fromMap).toList();
    return list;
  }

  Future<List<Recording>> getRecordings(int jokeId) async {
    final map = await _database.query(
      recordingsTable,
      where: 'joke_id = ?',
      whereArgs: [jokeId],
    );

    if (map.isEmpty) return [];

    final list = map.map(Recording.fromMap).toList();
    return list;
  }
}
