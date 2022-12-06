import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'tasks';

  static Future initDb() async {
    if (_db != null) {
      debugPrint('not null db');
      return;
    } else
      try {
        String path = '${await getDatabasesPath()}task.db';
        _db = await openDatabase(path, version: _version,
            onCreate: (db, version) async {
          await db.execute('CREATE TABLE $_tableName ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'title STRING , note TEXT , date STRING , '
              'startTime STRING , endTime STRING , '
              'remind INTEGER , repeat STRING , '
              'color INTEGER , '
              'isCompleted INTEGER'
              ')');
        });
      } catch (e) {
        print(e);
      }
  }

  static Future insert(Task? task)async {
    print('insert');
    try{
      return await _db!.insert(_tableName, task!.toJson());
    }catch(e){
      print('we are here');
      return 90000;
    }
    
  }
  static Future delete(Task task)async {
    print('delete');
    return await _db!.delete(_tableName , where: 'id == ?' , whereArgs: [task.id]);

  }  static Future deleteAll()async {
    print('delete');
    return await _db!.delete(_tableName);
  }
  static Future<List<Map<String, Object?>>> query( )async {
    print('query');
    return await _db!.query(_tableName);
  }
  static Future update(int id)async {
    print('update');
    return await _db!.rawUpdate('''
    UPDATE tasks
    SET isCompleted = ?
    WHERE id = ?
    
    ''', [1 , id]);
  }
}
