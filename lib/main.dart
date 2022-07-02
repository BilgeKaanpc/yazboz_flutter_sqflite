import 'package:flutter/material.dart';
import 'package:yazboz/Design/DesignVeriables.dart';
import 'package:yazboz/Pages/ciftliOyunBasla.dart';
import 'package:yazboz/Pages/gameDetay.dart';
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
      backgroundColor: Colors.blue.shade300,
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
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    border: Border.all(
                      color: Colors.black,
                      width: 5,
                    ),
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.black26],
                    ),
                  ),
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
                                elevation: 8,
                                shadowColor: Colors.green,
                                margin: EdgeInsets.all(20),
                                shape:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                child: SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(game.teamA),
                                      Text((game.toplamA).toString()),
                                      Text("-"),
                                      Text((game.toplamB).toString()),
                                      Text(game.teamB),
                                    ],
                                  ),
                                ),
                              ),
                              onDoubleTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => gameDetay(teamA: game.teamA,teamB: game.teamB,teamApuan: game.teamApuan,teamBpuan: game.teamBpuan,teamAceza: game.teamAceza,teamBceza: game.teamBceza,toplamA: game.toplamA,toplamB: game.toplamB,)));

                              },
                              onLongPress: () async{
                                await CiftliOyunlarShow().hedefSil(game.Id);
                                setState((){

                                });

                              },
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
