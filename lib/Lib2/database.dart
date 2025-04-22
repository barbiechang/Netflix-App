import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import './model.dart';

class AppDatabase {
  static Database? _database;

  //--------- ฟังก์ชันสำหรับตรวจสอบว่ามีฐานข้อมูลแล้วหรือไม่ ---------
  Future<Database> initializedb() async {
    if (_database == null) _database = await createdb();
    return _database!;
  }

  //--------- ฟังก์ชันสำหรับสร้างฐานข้อมูล ---------
  Future<Database> createdb() async {
    final path = await getDatabasesPath();

    var database = await openDatabase(
      join(path, 'topicDB.db'),
      version: 1,
      onCreate: ((db, version) async {
        await db.execute(
          '''CREATE TABLE topic(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
        title TEXT, 
        conversation TEXT)''',
        );
      }),
    );
    return database;
  }

  //--------- ฟังก์ชันสำหรับเพิ่มข้อมูลในฐานข้อมูล ---------
  Future insertData(TopicModel model) async {
    var db = await initializedb();
    db.delete('topic');
    var result = await db.insert('topic', model.toMap());
    return result;
  }

  //--------- ฟังก์ชันสำหรับดึงข้อมูลจากฐานข้อมูลทั้งหมด ---------
  Future<List<TopicModel>> getAllData() async {
    var db = await initializedb();
    List<Map<String, dynamic>> result = await db.query('topic');
    return List.generate(
      result.length,
      (index) => TopicModel(
          id: result[index]['id'],
          title: result[index]['title'],
          conversation: result[index]['conversation']),
    );
  }

  //--------- ฟังก์ชันสำหรับแก้ไข/อัพเดทข้อมูลในฐานข้อมูล ---------
  Future updataData(TopicModel model) async {
    var db = await initializedb();
    // print('++++ ${model.id}');
    var result = await db.update(
      'topic',
      model.toMap(),
      where: 'id=?',
      whereArgs: [model.id],
    );
    return result;
  }


  //--------- ฟังก์ชันสำหรับลบข้อมูลตาม id ที่ระบุใน whereArgs ---------
  Future deleteData(TopicModel model) async {
    var db = await initializedb();
    // print('++++ ${model.id}');
    var result = db.delete(
      'topic',
      where: 'id=?',
      whereArgs: [model.id],
    );
    return result;
  }
}