import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qrreader_app/src/model/qr_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider{

  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async{
    if(_database != null){
      return _database;
    }
    else{
      _database = await initDB();
    }

    return _database;

  }

  initDB() async {

    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = join(docDirectory.path, 'QR.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int index) async {
        await db.execute(
          'CREATE TABLE Scans ('
          ' id INTEGER PRIMARY KEY,'
          ' tipo TEXT,'
          ' valor TEXT'
          ')'
        );  
      }
    );
  }

  Future<int> save(Qr qr) async {

    final db = await database;
    final result = db.insert('Scans', qr.toJson());

    return result;

  }

  Future<Qr> findById(int id) async {
    final db = await database;
    final result = db.query(
      'Scans',
      where: 'id = ?',
      whereArgs: [
        id
      ]
    );

    Qr object = Qr();

    result.then((data){
      if(data.isNotEmpty){
        object = Qr.fromJson(data.first);
      }
      else{
        object = null;
      }
    });

    return object;

  }

  Future<List<Qr>> findAll() async {
    final db = await database;
    final result = await db.query('Scans');

    List<Qr> list = result.isNotEmpty 
    ? result.map((data) => Qr.fromJson(data)).toList()
    : [];

    return list;
  }

  Future<List<Qr>> findAllPerType(String tipo) async {
    final db = await database;
    final result = await db.rawQuery('SELECT * FROM Scans WHERE tipo="$tipo"');

    List<Qr> list = result.isNotEmpty 
    ? result.map((data) => Qr.fromJson(data)).toList()
    : [];

    return list;
  }

  Future<int> update(Qr qr) async{
    final db = await database;
    final result = await db.update('Scans', qr.toJson(), where: 'id = ?', whereArgs: [
      qr.id
    ]);
    return result;
  }

  delete(int id) async{
    final db = await database;
    final result = db.delete('Scans', where: 'id = ?', whereArgs: [
      id
    ]);
    return result;
  }

  Future<int> deleteAll() async {
    final db = await database;
    final result = db.delete('Scans');
    return result;
  }

}