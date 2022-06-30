import 'package:yazboz/Classes/tekliOyun.dart';
import 'package:yazboz/databaseHelpers/databaseHelper.dart';

class TekliOyunlarShow {
  Future<List<TekliOyun>> tumTekliOyunlar() async {
    var db = await DatabaseHelper.dbErisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM oyunlartek");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      var game = TekliOyun(
          satir["Id"],
          satir["kisiA"],
          satir["kisiB"],
          satir["kisiC"],
          satir["kisiD"],
          satir["kisiAceza"],
          satir["kisiBceza"],
          satir["kisiCceza"],
          satir["kisiDceza"],
          satir["kisiApuan"],
          satir["kisiBpuan"],
          satir["kisiCpuan"],
          satir["kisiDpuan"],
          satir["toplamA"],
          satir["toplamB"],
          satir["toplamC"],
          satir["toplamD"],
          satir["tarih"]);

      return game;
    });
  }
}
