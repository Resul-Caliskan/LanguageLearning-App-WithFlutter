import 'dart:async';
import 'package:noron/Interfaces/database/seviye.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelperS {
  Database? _db;

  //Oluşması süre aldığı için async yapı ile yapıyoruz
  Future<Database?> get db async {
    // ignore: unnecessary_null_comparison
    if (_db == null) {
      _db = await baslatDb();
      _db!.rawQuery("Select * from seviyeler").then((value) async {
        if (value.isEmpty) {
          await _db!
              .insert("seviyeler", Seviye("isimler", 1, "0-0-0-0-0-0").toMap());
          await _db!
              .insert("seviyeler", Seviye("isimler", 2, "0-0-0-0-0-0").toMap());
          await _db!
              .insert("seviyeler", Seviye("isimler", 3, "0-0-0-0-0-0").toMap());
          await _db!
              .insert("seviyeler", Seviye("isimler", 4, "0-0-0-0-0-0").toMap());
          await _db!
              .insert("seviyeler", Seviye("isimler", 5, "0-0-0-0-0-0").toMap());
          await _db!
              .insert("seviyeler", Seviye("isimler", 6, "0-0-0-0-0-0").toMap());
          await _db!
              .insert("seviyeler", Seviye("isimler", 7, "0-0-0-0-0-0").toMap());
          await _db!
              .insert("seviyeler", Seviye("isimler", 8, "0-0-0-0-0-0").toMap());
          await _db!
              .insert("seviyeler", Seviye("fiiller", 1, "0-0-0-0-0-0").toMap());
          await _db!
              .insert("seviyeler", Seviye("fiiller", 2, "0-0-0-0-0-0").toMap());
          await _db!
              .insert("seviyeler", Seviye("fiiller", 3, "0-0-0-0-0-0").toMap());
          await _db!
              .insert("seviyeler", Seviye("fiiller", 4, "0-0-0-0-0-0").toMap());
          await _db!
              .insert("seviyeler", Seviye("fiiller", 5, "0-0-0-0-0-0").toMap());
              await _db!
              .insert("seviyeler", Seviye("fiiller", 6, "0-0-0-0-0-0").toMap());
              await _db!
              .insert("seviyeler", Seviye("fiiller", 7, "0-0-0-0-0-0").toMap());
          await _db!.insert(
              "seviyeler", Seviye("sifatlar", 1, "0-0-0-0-0-0").toMap());
          await _db!.insert(
              "seviyeler", Seviye("sifatlar", 2, "0-0-0-0-0-0").toMap());
          await _db!.insert(
              "seviyeler", Seviye("sifatlar", 3, "0-0-0-0-0-0").toMap());
          await _db!
              .insert("seviyeler", Seviye("zarflar", 1, "0-0-0-0-0-0").toMap());
          await _db!
              .insert("seviyeler", Seviye("zarflar", 2, "0-0-0-0-0-0").toMap());
          return _db;
        } else {
          return _db;
        }
      });
      return _db;
    } else {
      return _db;
    }
  }

//DATABASE BAŞLATMA
  Future<Database> baslatDb() async {
    String dbPath = join(await getDatabasesPath(), "seviyeler.db");
    var listelerimDb =
        await openDatabase(dbPath, version: 1, onCreate: olusturDb);
    return listelerimDb;
  }

//DATABASE OLUŞTURMA
  void olusturDb(Database db, int version) async {
    await db.execute(
        "Create Table seviyeler(bolum string,seviye integer,deste string,Primary key(bolum,seviye));");
  }

// VERİ OKUMA
  Future<List<Seviye>> getVeri() async {
    Database? db = await this.db;
    var query = await db!.query("seviyeler");
    return List.generate(query.length, (i) {
      //sorgudan gelen elemanın row unu contsructor a gönderiyoruz
      return Seviye.fromObject(query[i]);
    });
  }

// Veri EKLEME
  Future<int?> update(Seviye s) async {
    Database? db = await this.db;
    var query = await db!.update("seviyeler", s.toMap(),
        where: '"bolum"=? and "seviye"=?', whereArgs: [s.bolum, s.seviye]);
    return query;
  }

// Veri Silme
  Future<int> silVeri(String bolum, int seviye) async {
    Database? db = await this.db;
    var query = await db!.rawDelete(
        "delete from seviyeler where bolum=$bolum and seviye = $seviye ");
    return query;
  }
}
