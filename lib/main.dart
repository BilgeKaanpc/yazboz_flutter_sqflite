import 'package:flutter/material.dart';
import 'package:yazboz/Design/DesignVeriables.dart';
import 'package:yazboz/Pages/ciftliOyunBasla.dart';
import 'package:yazboz/showFiles/ciftliOyunlarShow.dart';

import 'Classes/ciftliOyun.dart';
import 'databaseHelpers/databaseHelper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: DesignVeribles.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Future<List<CiftliOyun>> tumOyunlar() async {
    var oyunlarList = await CiftliOyunlarShow().tumCiftliOyunlar();
    return oyunlarList;
  }

  void ciftliOyunBasla() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CiftliOyunEkle()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(child: Container()),
            Expanded(
                child: Text(
              "Yaz-Boz",
              style: DesignVeribles.baslikStyle,
            )),

            Expanded(
              flex: 8,
              child: Padding(
                padding: DesignVeribles.padding4,
                child: Container(
                  color: Colors.red,
                  child: FutureBuilder<List<CiftliOyun>>(
                    future: tumOyunlar(),
                    builder: (context, snapshot) {
                      var games = snapshot.data;
                      return ListView.builder(
                          itemCount: games!.length,
                          itemBuilder: (context, index) {
                            var game = games[index];
                            return GestureDetector(
                              child: Card(
                                child: Text(game.teamA),
                              ),
                            );
                          });
                    },
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ciftliOyunBasla,
        child: Icon(Icons.add),
      ),

    );
  }
}
