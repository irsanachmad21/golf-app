// ignore_for_file: unused_field, unnecessary_null_comparison
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:golf_app/models/golf.dart';

class DbHelper {
  static DbHelper? _dbHelper;
  static Database? _database;

  DbHelper._createObject();

  factory DbHelper() {
    return _dbHelper ??= DbHelper._createObject();
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'golf.db';
    var golfDatabase = openDatabase(
      path,
      version: 3, // Pastikan versi di sini mencerminkan perubahan
      onCreate: _createDb,
      onUpgrade: _upgradeDb,
    );
    return golfDatabase;
  }

  void _upgradeDb(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE golf ADD COLUMN metode_pembayaran TEXT');
    }
    if (oldVersion < 3) {
      await db.execute(
          'ALTER TABLE golf ADD COLUMN balls_value TEXT'); // Tambahkan kolom ini
    }
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE golf (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        tanggal TEXT,
        jam TEXT,
        no_telp TEXT,
        email TEXT,
        alamat TEXT,
        driving_range TEXT,
        balls_value TEXT,
        tipe_lapangan TEXT,
        metode_pembayaran TEXT
      )
    ''');
  }

  Future<Database> get database async {
    return _database ??= await initDb();
  }

  // Create (C)
  Future<int> insertGolf(Golf golf) async {
    Database db = await this.database;
    int count = await db.insert('golf', golf.toMap());
    return count;
  }

  // Read (R)
  Future<List<Map<String, dynamic>>> getGolfMapList() async {
    Database db = await this.database;
    var mapList = await db.query('golf', orderBy: 'nama');
    return mapList;
  }

  // Update (U)
  Future<int> updateGolf(Golf golf) async {
    Database db = await this.database;
    int count = await db
        .update('golf', golf.toMap(), where: 'id=?', whereArgs: [golf.id]);
    return count;
  }

  // Delete (D)
  Future<int> deleteGolf(int id) async {
    Database db = await this.database;
    int count = await db.delete('golf', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Golf>> getGolfList() async {
    var golfMapList = await getGolfMapList();
    int count = golfMapList.length;
    List<Golf> golfList = [];
    for (int i = 0; i < count; i++) {
      golfList.add(Golf.fromMap(golfMapList[i]));
    }
    return golfList;
  }
}
