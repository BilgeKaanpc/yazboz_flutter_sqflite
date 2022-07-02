import 'package:flutter/material.dart';
import 'package:yazboz/Design/DesignVeriables.dart';

class gameDetay extends StatefulWidget {
  final String teamA;
  final String teamB;
  final String teamApuan;
  final String teamBpuan;
  final String teamAceza;
  final String teamBceza;
  final int toplamA;
  final int toplamB;

  const gameDetay(
      {required this.teamA,
      required this.teamB,
      required this.teamApuan,
      required this.teamBpuan,
      required this.teamAceza,
      required this.teamBceza,
      required this.toplamA,
      required this.toplamB,
      Key? key})
      : super(key: key);

  @override
  State<gameDetay> createState() => _gameDetayState();
}

class _gameDetayState extends State<gameDetay> {
  List cezaYaz(String text) {
    var cezaList = [];
    String sonCeza = "";
    for (int i = 0; i < text.length; i++) {
      if (text[i] == ".") {
        var cezaInt = int.parse(sonCeza);
        cezaList.add(cezaInt);
        sonCeza = "";
      } else {
        sonCeza = sonCeza + text[i];
      }
    }
    return cezaList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: Column(
          children: [
            Expanded(child: Container()),
            Expanded(
              child: _teamNames(),
            ),
            Expanded(
                child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    (widget.toplamA.toString()),
                    style: DesignVeribles.pointStyle,
                  ),
                  Text(
                    (widget.toplamB.toString()),
                    style: DesignVeribles.pointStyle,
                  )
                ],
              ),
            )),
            Expanded(
              child: Center(
                child: Text(
                  "Cezalar",
                  style: DesignVeribles.cezaStyle,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: _cezalarList(),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Oyunlar",
                  style: DesignVeribles.cezaStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: _puanlarList(),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  _cezalarList() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.black26],
                ),
              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        cezaYaz(widget.teamAceza)[index].toString(),
                        textAlign: TextAlign.center,
                        style: DesignVeribles.scoreStyle,
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  );
                },
                itemCount: cezaYaz(widget.teamAceza).length,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.black26],
                ),
              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        cezaYaz(widget.teamBceza)[index].toString(),
                        textAlign: TextAlign.center,
                        style: DesignVeribles.scoreStyle,
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  );
                },
                itemCount: cezaYaz(widget.teamBceza).length,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _puanlarList() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.black26],
                ),
              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        cezaYaz(widget.teamApuan)[index].toString(),
                        textAlign: TextAlign.center,
                        style: DesignVeribles.scoreStyle,
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  );
                },
                itemCount: cezaYaz(widget.teamApuan).length,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.black26],
                ),
              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        cezaYaz(widget.teamBpuan)[index].toString(),
                        textAlign: TextAlign.center,
                        style: DesignVeribles.scoreStyle,
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  );
                },
                itemCount: cezaYaz(widget.teamBpuan).length,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _teamNames() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          widget.teamA,
          style: DesignVeribles.teamStyle,
        ),
        Text(
          widget.teamB,
          style: DesignVeribles.teamStyle,
        )
      ],
    );
  }
}
