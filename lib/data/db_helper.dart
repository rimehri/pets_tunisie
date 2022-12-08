import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'features/events/EventController.dart';
import 'model/Event.dart';
// database sqflite pour la table evenmnts
//pour ajouter un autre table il faut modifier le num de version pour modifier  la base
class DbHelper {
  static   Database? _db ;
  static final int _version = 2 ;
  static final String _tablename ="event";
static Database? _ddb;
Future <Database? > get db async{
  if (_ddb==null){

    _ddb = await initial();
    return _ddb;
  }
else {
  return _ddb;
  }
}
readData (String sql ) async {
  Database? mydb=  await db;
  List<Map> response = await  mydb!.rawQuery(sql);
  return response;
}
  insertData (Event event ) async {
    Database? mydb=  await db;
   int response = await  mydb!.insert(_tablename,event.toJson(),conflictAlgorithm: ConflictAlgorithm.fail);
    return response;
  }
  updateData (int id ) async {
    Database? mydb=  await db;
    int response = await  mydb!.rawUpdate('''
   UPDATE event
   SET isCompleted=?
   where id= ?


   ''',[1,id]);
    print(response.toString()+"update");
    return response;
  }
 Future <int> deletetData (Event event ) async {
    Database? mydb=  await db;
    int response = await  mydb!.delete(_tablename,where :'id=?',whereArgs: [event.id]);
    return response;
  }

  initial() async
  {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath,'events.db');
    Database mydb = await openDatabase(path,onCreate: _oncreate,version: _version,onUpgrade:_onupgrade);
    return mydb;
  }
  _onupgrade(Database db , int oldversion , int newversion ){
  print("onupgrade ==========");



  }
  static Future <void > initdb () async {
    if (_db != null ){
      print("db!=null");
      return ; 
  }
    try {
      String _path = await getDatabasesPath ()+ 'events.db';
      print(_path);
      _db = await openDatabase(_path,version: _version,
          onCreate: (db,version ) {
        print("creating a new one ");
        return db.execute("CREATE TABLE $_tablename ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "title STRING,note TEXT ,"
            "isCompleted INTEGER,date STRING,"
            "startTime STRING,endTime STRING,"
            "color INTEGRE,"
            "remind INTEGER,repeat STRING)"




        );
  });
  } catch(e){
      print(e);
    }
  }
  static Future <int?> insert(Event? event ) async {
    print ("insert function, called ");
    return await _db?.insert(_tablename, event!.toJson(),conflictAlgorithm: ConflictAlgorithm.fail);
  }

static delete(Event event) async {


  return await  _db!.delete(_tablename,where :'id=?',whereArgs: [event.id]);

}
//drop table
  Future<void> deletetable()async{
   Database? mydb=  await db;
   await mydb!.execute("DROP TABLE IF EXISTS event");
  }

//update table event isCompleted
_oncreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "event"(
     id  INTEGER PRIMARY KEY NOT NULL,
     title STRING,
     note TEXT ,
     date STRING,
     isCompleted INTEGER,
     
     startTime STRING,
     endTime STRING,
     color INTEGRE,
     remind INTEGER,
     repeat STRING
     
     ) 
    
    ''');
    print('on create database ');
  }
}