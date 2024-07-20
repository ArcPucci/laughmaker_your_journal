import 'package:laughmaker_your_journal/models/models.dart';
import 'package:sqflite/sqflite.dart';

const tagsTable = "TAGS_TABLE";

class TagsService {
  final Database _database;

  TagsService({required Database database}) : _database = database;

  Future<void> onCreate(Tag tag) async {
    final map = tag.toMap();
    map['id'] = null;

    await _database.insert(tagsTable, map);
  }

  Future<void> onDelete(Tag tag) async {
    await _database.delete(tagsTable, where: 'id = ?', whereArgs: [tag.id]);
  }

  Future<List<Tag>> getTags() async {
    final map = await _database.query(tagsTable);
    if (map.isEmpty) return [];

    final list = map.map(Tag.fromMap).toList();
    return list;
  }
}
