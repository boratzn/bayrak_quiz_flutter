import 'dart:collection';

import 'package:bayrak_quiz_uyg_flutter/bayraklar.dart';
import 'package:bayrak_quiz_uyg_flutter/bayraklar_dao.dart';
import 'package:bayrak_quiz_uyg_flutter/sonuc_ekrani.dart';
import 'package:flutter/material.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({super.key});

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {
  var sorular = <Bayrak>[];
  var yanlisSecenekler = <Bayrak>[];
  Bayrak? dogruSoru;
  var tumSecenekler = HashSet<Bayrak>();

  int soruSayac = 0;
  int dogruSayac = 0;
  int yanlisSayac = 0;

  String bayrakResimAdi = "placeholder.png";
  String buttonAyazi = "";
  String buttonByazi = "";
  String buttonCyazi = "";
  String buttonDyazi = "";

  Future<void> sorulariAl() async {
    sorular = await BayraklarDao().rastgele5Getir();
    soruYukle();
  }

  Future<void> soruYukle() async {
    dogruSoru = sorular[soruSayac];

    bayrakResimAdi = dogruSoru!.bayrak_resim!;

    yanlisSecenekler = await BayraklarDao().yanlisGetir(dogruSoru!.bayrak_id!);

    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru!);
    tumSecenekler.addAll(yanlisSecenekler);

    buttonAyazi = tumSecenekler.elementAt(0).bayrak_ad!;
    buttonByazi = tumSecenekler.elementAt(1).bayrak_ad!;
    buttonCyazi = tumSecenekler.elementAt(2).bayrak_ad!;
    buttonDyazi = tumSecenekler.elementAt(3).bayrak_ad!;

    setState(() {});
  }

  void soruSayacKontrol() {
    soruSayac += 1;

    if (soruSayac != 5) {
      soruYukle();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SonucEkrani(dogruSayisi: dogruSayac),
          ));
    }
  }

  void dogruKontrol(String buttonYazi) {
    if (dogruSoru!.bayrak_ad! == buttonYazi) {
      dogruSayac += 1;
    } else {
      yanlisSayac += 1;
    }
  }

  @override
  void initState() {
    super.initState();
    sorulariAl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Doğru $dogruSayac",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Yanlış $yanlisSayac",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            soruSayac != 5
                ? Text(
                    "${soruSayac + 1}. Soru",
                    style: TextStyle(fontSize: 30),
                  )
                : Text(
                    "${soruSayac}. Soru",
                    style: TextStyle(fontSize: 30),
                  ),
            Image.asset("resimler/$bayrakResimAdi"),
            SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      dogruKontrol(buttonAyazi);
                      soruSayacKontrol();
                    },
                    child: Text(buttonAyazi))),
            SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      dogruKontrol(buttonByazi);
                      soruSayacKontrol();
                    },
                    child: Text(buttonByazi))),
            SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      dogruKontrol(buttonCyazi);
                      soruSayacKontrol();
                    },
                    child: Text(buttonCyazi))),
            SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      dogruKontrol(buttonDyazi);
                      soruSayacKontrol();
                    },
                    child: Text(buttonDyazi))),
          ],
        ),
      ),
    );
  }
}
