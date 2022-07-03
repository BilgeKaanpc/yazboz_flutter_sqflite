import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  static final String databaseName = "veri.sqlite";


  static Future<Database> dbErisim() async{
    String databasePath = join(await getDatabasesPath(),databaseName);
    if(await databaseExists(databasePath)){
    }else{

      ByteData data = await rootBundle.load("database/$databaseName");
      List<int> bytes = data.buffer.asInt8List(data.offsetInBytes,data.lengthInBytes);
      await File(databasePath).writeAsBytes(bytes,flush: true);

    }
    return openDatabase(databasePath);
  }






}
