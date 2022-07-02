import 'package:yazboz/Classes/ciftliOyun.dart';
import 'package:yazboz/databaseHelpers/databaseHelper.dart';

class CiftliOyunlarShow {
  Future<List<CiftliOyun>> tumCiftliOyunlar() async {
    var db = await DatabaseHelper.dbErisim();
      print("girdik");
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM oyunlar");
    print("1");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      print("girdik3");
      var game = CiftliOyun(
          satir["Id"],
          satir["teamA"],
          satir["teamB"],
          satir["teamApuan"],
          satir["teamBpuan"],
          satir["teamAceza"],
          satir["teamBceza"],
          satir["toplamA"],
          satir["toplamB"],
          satir["tarih"]);
      return game;
    });
  }

  Future<void> hedefSil(int id)async{
    var db = await DatabaseHelper.dbErisim();

    await db.delete("oyunlar",where: "Id = ?",whereArgs: [id]);
  }

}