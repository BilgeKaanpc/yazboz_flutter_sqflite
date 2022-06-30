import 'package:flutter/material.dart';
import 'package:yazboz/Design/DesignVeriables.dart';

class CiftliOyunEkle extends StatefulWidget {
  const CiftliOyunEkle({Key? key}) : super(key: key);

  @override
  State<CiftliOyunEkle> createState() => _CiftliOyunEkleState();
}

class _CiftliOyunEkleState extends State<CiftliOyunEkle> {
  late String teamAcezalar =
      "123-345-123-423-345-123-464-123-354-123-464-123-354-123-464-123-354-123";
  late String teamBcezalar = "123-345-123-464-123-354-123-464-123-354";

  String teamA = "bizimkiler";
  String teamB = "sizinkiler";

  List cezaYaz(String text) {
    var cezaList = [];
    String sonCeza = "";
    for (int i = 0; i < text.length; i++) {
      if (text[i] == "-") {
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
      body: Center(
        child: Column(
          children: [
            Expanded(child: Container()),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Team A",
                            filled: true,
                            fillColor: DesignVeribles.mainColor.shade300.withOpacity(0.3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      teamA + "Cezalar",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      teamA + "Cezalar",
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(
                          cezaYaz(teamAcezalar)[index].toString(),
                          textAlign: TextAlign.center,
                        );
                      },
                      itemCount: cezaYaz(teamAcezalar).length,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(
                          cezaYaz(teamAcezalar)[index].toString(),
                          textAlign: TextAlign.center,
                        );
                      },
                      itemCount: cezaYaz(teamAcezalar).length,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      teamA + "Cezalar",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      teamA + "Cezalar",
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(
                          cezaYaz(teamAcezalar)[index].toString(),
                          textAlign: TextAlign.center,
                        );
                      },
                      itemCount: cezaYaz(teamAcezalar).length,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(
                          cezaYaz(teamAcezalar)[index].toString(),
                          textAlign: TextAlign.center,
                        );
                      },
                      itemCount: cezaYaz(teamAcezalar).length,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container(),),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Bitir",
                  style: DesignVeribles.butonTextStyle,
                ),
              ),
            ),
            Expanded(child: Container(),),
          ],
        ),
      ),
    );
  }

  _teamNames() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(),
          ),
        )
      ],
    );
  }

  _teamCeza(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(
                  cezaYaz(teamAcezalar)[index].toString(),
                  textAlign: TextAlign.center,
                );
              },
              itemCount: cezaYaz(teamAcezalar).length,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(
                  cezaYaz(teamAcezalar)[index].toString(),
                  textAlign: TextAlign.center,
                );
              },
              itemCount: cezaYaz(teamAcezalar).length,
            ),
          ),
        ],
      ),
    );
  }
}
