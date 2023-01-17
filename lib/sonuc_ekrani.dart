import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  final int? dogruSayisi;
  const SonucEkrani({
    super.key,
    required this.dogruSayisi,
  });

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "${widget.dogruSayisi} DOĞRU ${5 - widget.dogruSayisi!} YANLIŞ",
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              "%${((widget.dogruSayisi! * 100) ~/ 5).toInt()} BAŞARI ORANI",
              style: const TextStyle(fontSize: 30, color: Colors.pink),
            ),
            SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("TEKRAR DENE"))),
          ],
        ),
      ),
    );
  }
}
