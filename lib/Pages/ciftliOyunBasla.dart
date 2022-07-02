import 'package:flutter/material.dart';
import 'package:yazboz/Design/DesignVeriables.dart';
import 'package:yazboz/databaseHelpers/databaseHelper.dart';
import 'package:yazboz/main.dart';

class CiftliOyunEkle extends StatefulWidget {
  const CiftliOyunEkle({Key? key}) : super(key: key);

  @override
  State<CiftliOyunEkle> createState() => _CiftliOyunEkleState();
}

class _CiftliOyunEkleState extends State<CiftliOyunEkle> {
  late String teamAcezalar = "";
  late String teamBcezalar = "";
  late String teamApuan = "";
  late String teamBpuan = "";

  late TextEditingController cezaA = TextEditingController();
  late TextEditingController cezaB = TextEditingController();

  late TextEditingController puanA = TextEditingController();

  late TextEditingController puanB = TextEditingController();

  late TextEditingController nameA = TextEditingController();

  late TextEditingController nameB = TextEditingController();

  late String teamAname = "Team A";
  late String teamBname = "Team B";

  Future<void> dbEkle(
      String teamAm,
      String teamBm,
      String teamApuanm,
      String teamBpuanm,
      String teamAcezam,
      String teamBcezam,
      int toplamAm,
      int toplamBm) async {
    var db = await DatabaseHelper.dbErisim();
    var info = Map<String, dynamic>();
    info["teamA"] = teamAm;
    info["teamB"] = teamBm;
    info["teamApuan"] = teamApuanm;
    info["teamBpuan"] = teamBpuanm;
    info["teamAceza"] = teamAcezam;
    info["teamBceza"] = teamBcezam;
    info["toplamA"] = toplamAm;
    info["toplamB"] = toplamBm;

    await db.insert("oyunlar", info);
  }

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

  int toplamPuan(String veri, String cezalar) {
    String deger = "";
    int toplam = 0;
    for (int i = 0; i < veri.length; i++) {
      if (veri[i] == ".") {
        toplam = toplam + int.parse(deger);
        deger = "";
      } else {
        deger = deger + veri[i];
      }
    }
    for (int i = 0; i < cezalar.length; i++) {
      if (cezalar[i] == ".") {
        toplam = toplam + int.parse(deger);
        deger = "";
      } else {
        deger = deger + cezalar[i];
      }
    }

    return toplam;
  }

  var snackBar = SnackBar(
    content:
        Text('Takım adıları veya puanlarının boş olmadığından emin olun!!!'),
  );

  Future<void> _showDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Oyun Bitti",
              style: DesignVeribles.alertStyle,
            ),
            content: Container(
              child: Text(
                "Oyunu kaydetmek istiyor musunuz?",
                style: DesignVeribles.teamStyle,
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  dbEkle(
                      teamAname,
                      teamBname,
                      teamApuan,
                      teamBpuan,
                      teamAcezalar,
                      teamBcezalar,
                      toplamPuan(teamApuan, teamAcezalar),
                      toplamPuan(teamBpuan, teamBcezalar));

                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyApp()), (e) => false);
                },
                child: Text(
                  "Evet",
                  style: DesignVeribles.butonTextStyle,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyApp()), (e) => false);
                },
                child: Text(
                  "Hayır",
                  style: DesignVeribles.butonTextStyle,
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Expanded(child: Container()),
            Expanded(
              flex: 2,
              child: _teamNames(),
            ),
            Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: _puanCezaEkle(),
                )),
            Expanded(
              flex: 1,
              child: _cezalarText(),
            ),
            Expanded(
              flex: 3,
              child: _cezalarList(),
            ),
            Expanded(
              flex: 1,
              child: _puanTexts(),
            ),
            Expanded(
              flex: 5,
              child: _puanList(),
            ),
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Expanded(
                          child: Text(
                        teamAname,
                        style: DesignVeribles.puanStyle,
                      )),
                      Expanded(
                          child: Text(
                        toplamPuan(teamApuan, teamAcezalar).toString(),
                        style: DesignVeribles.teamStyle,
                      )),
                      Expanded(
                          child: Text(
                        "Toplam Oyun: ",
                        style: DesignVeribles.puanStyle,
                      ))
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                          child: Text(
                        teamBname,
                        style: DesignVeribles.puanStyle,
                      )),
                      Expanded(
                          child: Text(
                        toplamPuan(teamBpuan, teamBcezalar).toString(),
                        style: DesignVeribles.teamStyle,
                      )),
                      Expanded(
                          child: Text(
                        cezaYaz(teamApuan).length.toString(),
                        style: DesignVeribles.puanStyle,
                      ))
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {

                      //dbEkle(teamAname, teamBname, teamApuan, teamBpuan, teamAcezalar, teamBcezalar, toplamPuan(teamApuan, teamAcezalar), toplamPuan(teamBpuan, teamBcezalar));

                      if (nameA.text.length <= 0 ||
                          nameB.text.length <= 0 ||
                          teamApuan.length <= 0 ||
                          teamBpuan.length <= 0) {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        _showDialog(context);
                      }
                    },
                    child: Text(
                      "Bitir",
                      style: DesignVeribles.butonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  _puanCezaEkle() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cezaA,
                  keyboardType: TextInputType.number,
                  onEditingComplete: () {
                    setState(() {
                      teamAcezalar = teamAcezalar + cezaA.text + ".";
                      FocusManager.instance.primaryFocus?.unfocus();
                      cezaA.clear();
                    });
                  },
                  style: DesignVeribles.puanStyle,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    hintText: "Ceza Ekle",
                    filled: true,
                    fillColor:
                        DesignVeribles.mainColor.shade300.withOpacity(0.3),
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
                child: TextFormField(
                  controller: cezaB,
                  keyboardType: TextInputType.number,
                  onEditingComplete: () {
                    setState(() {
                      teamBcezalar = teamBcezalar + cezaB.text + ".";
                      FocusManager.instance.primaryFocus?.unfocus();
                      cezaB.clear();
                    });
                  },
                  style: DesignVeribles.puanStyle,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    hintText: "Ceza Ekle",
                    filled: true,
                    fillColor:
                        DesignVeribles.mainColor.shade300.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: puanA,
                  keyboardType: TextInputType.number,
                  onEditingComplete: () {
                    setState(() {
                      teamApuan = teamApuan + puanA.text + ".";
                      FocusManager.instance.primaryFocus?.unfocus();
                      puanA.clear();
                    });
                  },
                  style: DesignVeribles.puanStyle,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    hintText: "Puan Ekle",
                    filled: true,
                    fillColor:
                        DesignVeribles.mainColor.shade300.withOpacity(0.3),
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
                child: TextFormField(
                  controller: puanB,
                  keyboardType: TextInputType.number,
                  onEditingComplete: () {
                    setState(() {
                      teamBpuan = teamBpuan + puanB.text + ".";
                      FocusManager.instance.primaryFocus?.unfocus();
                      puanB.clear();
                    });
                  },
                  style: DesignVeribles.puanStyle,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    hintText: "Puan Ekle",
                    filled: true,
                    fillColor:
                        DesignVeribles.mainColor.shade300.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _puanTexts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          teamAname + " Puan",
          textAlign: TextAlign.center,
          style: DesignVeribles.puanStyle,
        ),
        Text(
          teamBname + " Puan",
          textAlign: TextAlign.center,
          style: DesignVeribles.puanStyle,
        ),
      ],
    );
  }

  _puanList() {
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
                        cezaYaz(teamApuan)[index].toString(),
                        textAlign: TextAlign.center,
                        style: DesignVeribles.scoreStyle,
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  );
                },
                itemCount: cezaYaz(teamApuan).length,
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
                        cezaYaz(teamBpuan)[index].toString(),
                        textAlign: TextAlign.center,
                        style: DesignVeribles.scoreStyle,
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  );
                },
                itemCount: cezaYaz(teamBpuan).length,
              ),
            ),
          ),
        ),
      ],
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
                        cezaYaz(teamAcezalar)[index].toString(),
                        textAlign: TextAlign.center,
                        style: DesignVeribles.scoreStyle,
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  );
                },
                itemCount: cezaYaz(teamAcezalar).length,
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
                        cezaYaz(teamBcezalar)[index].toString(),
                        textAlign: TextAlign.center,
                        style: DesignVeribles.scoreStyle,
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  );
                },
                itemCount: cezaYaz(teamBcezalar).length,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _cezalarText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          teamAname + " Cezalar",
          textAlign: TextAlign.center,
          style: DesignVeribles.cezaStyle,
        ),
        Text(
          teamBname + " Cezalar",
          textAlign: TextAlign.center,
          style: DesignVeribles.cezaStyle,
        ),
      ],
    );
  }

  _teamNames() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: nameA,
              onEditingComplete: () {
                setState(() {
                  teamAname = nameA.text;
                  FocusManager.instance.primaryFocus?.unfocus();
                });
              },
              style: DesignVeribles.teamStyle,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                label: Center(
                  child: Text("Team A"),
                ),
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
            child: TextFormField(
              controller: nameB,
              onEditingComplete: () {
                setState(() {
                  teamBname = nameB.text;
                  FocusManager.instance.primaryFocus?.unfocus();
                });
              },
              style: DesignVeribles.teamStyle,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                label: Center(
                  child: Text("Team B"),
                ),
                filled: true,
                fillColor: DesignVeribles.mainColor.shade300.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
