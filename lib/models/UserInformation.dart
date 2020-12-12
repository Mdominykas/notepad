import 'package:flutter/cupertino.dart';
import 'package:notepad/models/note.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';

///https://pusher.com/tutorials/local-data-flutter
///ant use the database sustojau
class UserInformation {

  int numberOfNotes = 0;

  static final _databaseName = "MyDatabase.db";
  ///increment after upgrade
  static final _databaseVersion = 1;

  UserInformation._privateConstructor();
  static final UserInformation instance = UserInformation._privateConstructor();

  static Database _database;
  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await  _initDatabase();
    return _database;
  }

  _initDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async{
    await db.execute('''
    CREATE TABLE $tableNotes(
      $columnId INTEGER PRIMARY KEY,
      $columnText TEXT NOT NULL
    )
    ''');
  }

  Future<int> insert(Note note) async{
    Database db = await database;
    int id = await db.insert(tableNotes, note.toMap());
    numberOfNotes = max(numberOfNotes, id);
    return id;
  }

  Future<Note> queryNote(int id) async{
    Database db = await database;
    List<Map> maps = await db.query(tableNotes,
      columns: [columnId, columnText],
      where: '$columnId = ?',
      whereArgs: [id]);
    if(maps.length>0)
      return Note.fromMap(maps.first);
    return null;
  }

  void createDummyData() async {
    return;
  }

  int getNumberOfNotes() {
    return numberOfNotes;
  }

  Future<List<Note>> getAllNotes() async {
    int kiek = getNumberOfNotes();
    List<Note> ans = List<Note>();
    for(int i=0; i<kiek; i++)
      {
        Note a = await queryNote(i);
        ans.add(a);
      }
    return ans;
  }
}
