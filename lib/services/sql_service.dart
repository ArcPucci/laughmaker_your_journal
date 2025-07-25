import 'dart:async';

import 'package:laughmaker_your_journal/services/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
const uuidType = "TEXT PRIMARY KEY";
const boolType = "BOOLEAN DEFAULT FALSE";
const intType = "INTEGER NOT NULL";
const textType = "TEXT NOT NULL";
const blobType = "BLOB NOT NULL";
const timestampType = "DATETIME DEFAULT CURRENT_TIMESTAMP";
const doubleType = "REAL DEFAULT 0";
const textOrNullType = "TEXT DEFAULT NULL";

class SqlService {
  static final SqlService _instance = SqlService._();

  static Database? _database;

  SqlService._();

  factory SqlService() => _instance;

  Database get database => _database!;

  Future<void> init() async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, 'my_garden.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  FutureOr<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $jokesTable (
        id $idType,
        title $textType,
        content $textType,
        tags $textType,
        created $intType
      )
    ''');
    await db.execute('''
      CREATE TABLE $recordingsTable (
        id $idType,
        joke_id $intType,
        duration $intType,
        path $textType,
        created $intType
      )
    ''');
    await db.execute('''
      CREATE TABLE $tagsTable (
        id $idType,
        tag $textType
      )
    ''');
  }

  Future<void> close() async {
    _database?.close();
  }
}
