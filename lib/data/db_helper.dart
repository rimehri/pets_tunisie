import 'package:sqflite/sqflite.dart';

import 'features/events/EventController.dart';
import 'model/Event.dart';

class DbHelper {
  static   Database? _db ;
  static final int _version = 1 ;
  static final String _tablename ="events";
  static Future <void > initdb () async {
    if (_db != null ){
      return ; 
  }
    try {
      String _path = await getDatabasesPath ()+ 'events.db'; 
      _db = await openDatabase(_path,version: _version,onCreate: (db,version ) {
        print("creating a new one ");
        return db.execute("CREATE TABLE $_tablename ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "title STRING,note TEXT ,date STRING,"

            "startTime STRING,endTime STRING,"
            "remind INTEGER,repeat STRING,"
            "color INTEGRE,"
            "isCompleted INTEGER)",



        );
  });
  } catch(e){
      print(e);
    }
  }
  static Future <int> insert(Event? event ) async {
    print ("insert function, called ");
    return await _db?.insert(_tablename, event!.toJson())??1;
  }
  static Future<List<Map<String,dynamic>>?> query() async  {
    print("query function called");


    return  await _db?.query(_tablename);

  }
static delete(Event event) async {


  return await  _db!.delete(_tablename,where :'id=?',whereArgs: [event.id]);

}
}