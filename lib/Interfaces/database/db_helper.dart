import 'dart:async';

import 'package:noron/Interfaces/database/kelime.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
    Database? _db;
    
  //Oluşması süre aldığı için async yapı ile yapıyoruz
  Future<Database?> get db async {
  
    // ignore: unnecessary_null_comparison
    if (_db == null) {
      
      _db = await baslatDb();
      return _db;
    } else {
      return _db;
    }
  }

//DATABASE BAŞLATMA
  Future<Database> baslatDb() async {
    String dbPath = join(await getDatabasesPath(), "listelerim.db");
    var listelerimDb =
        await openDatabase(dbPath, version: 1, onCreate: olusturDb);
    return listelerimDb;
  }

//DATABASE OLUŞTURMA
  void olusturDb(Database db, int version) async {
    await db.execute("Create Table listelerim(bolumadi string ,bolum integer,sira integer,Primary key(bolumadi,bolum,sira));");
  }

// VERİ OKUMA
  Future<List<Kelime>> getVeri() async {
    Database? db = await this.db;
    var query = await db!.query("listelerim");
    return List.generate(query.length, (i){
      //sorgudan gelen elemanın row unu contsructor a gönderiyoruz
      return Kelime.fromObject(query[i]);
    });
  }

// Veri EKLEME
  Future<int?> ekleVeri(Kelime kelime) async {
    Database? db = await this.db;
    List<Map?>? map=await db?.query("listelerim",columns: ['bolum'],where: '"bolumadi"=? and "bolum"=? and "sira"=?',whereArgs: [kelime.bolumadi,kelime.bolum,kelime.sira]);
    //eğer verinin var olup olmadığını sorgulayorum
    if (map!.isEmpty) {
      var query = await db!.insert("listelerim", kelime.toMap());
    return query;
        
    } else {
      return null;
    }
    
  }

// Veri Silme
  Future<int> silVeri(String bolumadi,int bolum, int sira) async {
    Database? db = await this.db;
   
    var query = await db!.rawDelete(
        'delete from listelerim where "bolumadi"=? and "bolum"=? and "sira"=?',[bolumadi,bolum,sira]);
    return query;
  }
}
