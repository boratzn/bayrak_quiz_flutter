import 'package:bayrak_quiz_uyg_flutter/bayraklar.dart';
import 'package:bayrak_quiz_uyg_flutter/database_helper.dart';

class BayraklarDao {
  Future<List<Bayrak>> rastgele5Getir() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 5");

    return List.generate(maps.length, (index) {
      var satir = maps[index];

      return Bayrak(
          satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
    });
  }

  Future<List<Bayrak>> yanlisGetir(int bayrak_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM bayraklar WHERE bayrak_id != $bayrak_id ORDER BY RANDOM() LIMIT 3");

    return List.generate(maps.length, (index) {
      var satir = maps[index];

      return Bayrak(
          satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
    });
  }
}
