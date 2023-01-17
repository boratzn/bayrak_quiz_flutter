import 'package:bayrak_quiz_uyg_flutter/quiz_ekrani.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "QUİZE HOŞGELDİNİZ",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizEkrani(),
                          ));
                    },
                    child: Text("BAŞLA")))
          ],
        ),
      ),
    );
  }
}
