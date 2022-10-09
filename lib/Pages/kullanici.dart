import 'package:flutter/material.dart';
import 'package:noron/Pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Interfaces/database/db_helper_seviye.dart';
import '../Interfaces/database/seviye.dart';

class Kullanici extends StatefulWidget {
  const Kullanici({Key? key, required this.isim}) : super(key: key);
  final String isim;
  @override
  State<Kullanici> createState() => _KullaniciState();
}

class _KullaniciState extends State<Kullanici> {
  DbHelperS db = DbHelperS();
  final controllerTxt = TextEditingController();
  List<Seviye> seviyeler = [
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
    Seviye("isim", 1, "0-0-0-0-0-0"),
  ];
  double isimler = 0, fiiler = 0, sifatlar = 0, zarflar = 0;
  @override
  void initState() {
    var liste = db.getVeri();
    liste.then((value) {
      setState(() {
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler.removeAt(0);
        seviyeler = value;

        void topla() {
          for (var i = 0; i < 8; i++) {
            var listeI = seviyeler[i].deste!.split("-");
            for (var j = 0; j < 6; j++) {
              isimler += 25 * int.parse(listeI[j]);
            }
          }
          for (var i = 0; i < 7; i++) {
            var listeF = seviyeler[i + 8].deste!.split("-");
            for (var j = 0; j < 6; j++) {
              fiiler += 25 * int.parse(listeF[j]);
            }
          }
          for (var i = 0; i < 3; i++) {
            var listeS = seviyeler[i + 15].deste!.split("-");
            for (var j = 0; j < 6; j++) {
              sifatlar += 25 * int.parse(listeS[j]);
            }
          }
          for (var i = 0; i < 2; i++) {
            var listeZ = seviyeler[i + 18].deste!.split("-");
            for (var j = 0; j < 6; j++) {
              zarflar += 25 * int.parse(listeZ[j]);
            }
          }
        }

        topla();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width - 3,
            child: Wrap(
              runAlignment: WrapAlignment.spaceAround,
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 20,
              spacing: 20,
              children: [
                GestureDetector(
                  onTap: (() {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 89, 40, 229)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60))),
                              backgroundColor: Colors.white,
                              child: SizedBox(
                                height: 90,
                                child: Center(
                                  child: Text(
                                    "Öğrenilen Kelime Sayısı:" +
                                        isimler.toStringAsFixed(0),
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                              ),
                            ));
                  }),
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: CircularProgressIndicator(
                        backgroundColor:
                            const Color.fromARGB(255, 208, 206, 206),
                        color: Colors.green,
                        value: isimler / 1200,
                        strokeWidth: 10,
                      ),
                    ),
                    Text(
                      "İsimler\n %" + (isimler * 100 / 1200).toStringAsFixed(2),
                      style: const TextStyle(color: Colors.purple),
                    )
                  ]),
                ),
                GestureDetector(
                  onTap: (() {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 89, 40, 229)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60))),
                              backgroundColor: Colors.white,
                              child: SizedBox(
                                height: 90,
                                child: Center(
                                  child: Text(
                                    "Öğrenilen Kelime Sayısı:" +
                                        (isimler + fiiler + sifatlar + zarflar)
                                            .toStringAsFixed(0),
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                              ),
                            ));
                  }),
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
                    SizedBox(
                      height: 110,
                      width: 110,
                      child: CircularProgressIndicator(
                        backgroundColor:
                            const Color.fromARGB(255, 208, 206, 206),
                        color: Colors.green,
                        value: (isimler + fiiler + sifatlar + zarflar) / 2725,
                        strokeWidth: 15,
                      ),
                    ),
                    Text(
                      "Tümü\n %" +
                          ((isimler + fiiler + sifatlar + zarflar) * 100 / 2725)
                              .toStringAsFixed(2),
                      style:
                          const TextStyle(color: Colors.purple, fontSize: 20),
                    )
                  ]),
                ),
                GestureDetector(
                  onTap: (() {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 89, 40, 229)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60))),
                              backgroundColor: Colors.white,
                              child: SizedBox(
                                height: 90,
                                child: Center(
                                  child: Text(
                                    "Öğrenilen Kelime Sayısı:" +
                                        fiiler.toStringAsFixed(0),
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                              ),
                            ));
                  }),
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: CircularProgressIndicator(
                        backgroundColor:
                            const Color.fromARGB(255, 208, 206, 206),
                        color: Colors.green,
                        value: fiiler / 950,
                        strokeWidth: 10,
                      ),
                    ),
                    Text(
                      "Fiiler\n %" + (fiiler * 100 / 950).toStringAsFixed(2),
                      style: const TextStyle(color: Colors.purple),
                    )
                  ]),
                ),
                GestureDetector(
                  onTap: (() {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 89, 40, 229)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60))),
                              backgroundColor: Colors.white,
                              child: SizedBox(
                                height: 90,
                                child: Center(
                                  child: Text(
                                    "Öğrenilen Kelime Sayısı:" +
                                        sifatlar.toStringAsFixed(0),
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                              ),
                            ));
                  }),
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: CircularProgressIndicator(
                        backgroundColor:
                            const Color.fromARGB(255, 208, 206, 206),
                        color: Colors.green,
                        value: sifatlar / 400,
                        strokeWidth: 10,
                      ),
                    ),
                    Text(
                      "Sıfatlar\n %" +
                          (sifatlar * 100 / 400).toStringAsFixed(2),
                      style: const TextStyle(color: Colors.purple),
                    )
                  ]),
                ),
                GestureDetector(
                  onTap: (() {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 89, 40, 229)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60))),
                              backgroundColor: Colors.white,
                              child: SizedBox(
                                height: 90,
                                child: Center(
                                  child: Text(
                                    "Öğrenilen Kelime Sayısı:" +
                                        zarflar.toStringAsFixed(0),
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                              ),
                            ));
                  }),
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: CircularProgressIndicator(
                        backgroundColor:
                            const Color.fromARGB(255, 208, 206, 206),
                        color: Colors.green,
                        value: zarflar / 175,
                        strokeWidth: 10,
                      ),
                    ),
                    Text(
                      "Zarflar\n %" + (zarflar * 100 / 175).toStringAsFixed(2),
                      style: const TextStyle(color: Colors.purple),
                    )
                  ]),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Card(
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side:
                    const BorderSide(color: Color.fromARGB(255, 89, 40, 229))),
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width - 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 89, 40, 229),
                        size: 30,
                      ),
                      Text(
                        "Merhaba " + widget.isim,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 89, 40, 229),
                            fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[50],
                        onPrimary: const Color.fromARGB(255, 89, 40, 229),
                        shadowColor: Colors.purple,
                        onSurface: Colors.red,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 89, 40, 229))),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 89, 40, 229))),
                                child: SizedBox(
                                  height: 300,
                                  // decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(30),
                                  //     color: const Color.fromARGB(
                                  //         255, 89, 40, 229)),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 50),
                                      TextFormField(
                                        controller: controllerTxt,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            decorationColor: Colors.amber),
                                        cursorColor: Colors.black,
                                        decoration: const InputDecoration(
                                          labelStyle: TextStyle(
                                              color: Colors.black,
                                              decorationColor: Colors.amber,
                                              fontSize: 16),
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              decorationColor: Colors.amber,
                                              fontSize: 14),
                                          filled: true,
                                          fillColor: Colors.white,
                                          icon: Icon(
                                            Icons.person,
                                            color: Color.fromARGB(255, 95, 9, 200),
                                            size: 30,
                                          ),
                                          hintText: 'isminiz...',
                                          labelText: 'Kullanıcı Adı Giriniz ',
                                        ),
                                        onSaved: (String? value) {
                                          // This optional block of code can be used to run
                                          // code when the user saves the form.
                                        },
                                        validator: (String? value) {
                                          return (value != null &&
                                                  value.contains('@'))
                                              ? 'Do not use the @ char.'
                                              : null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          final isim = await SharedPreferences
                                              .getInstance();
                                          isim.setString(
                                              "isim", controllerTxt.text);

                                          Future.delayed(const Duration(
                                              milliseconds: 200));

                                          Navigator.pushAndRemoveUntil<dynamic>(
                                            context,
                                            MaterialPageRoute<dynamic>(
                                              builder: (BuildContext context) =>
                                                  Home(
                                                isim: controllerTxt.text,
                                              ),
                                            ),
                                            (route) =>
                                                false, //if you want to disable back feature set to false
                                          );
                                        },
                                        child: const Text(
                                          "Kaydet",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.blue[50],
                                            minimumSize: const Size(150, 50),
                                            onPrimary: const Color.fromARGB(
                                                255, 89, 40, 229),
                                            shadowColor: Colors.yellow,
                                            onSurface: Colors.red,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                side: BorderSide(
                                                    color: Colors.black,
                                                    width: 1))),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Wrap(
                        children: const [
                          SizedBox(
                            width: 10,
                          ),
                          Text("İsim Değiştir"),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.change_circle_outlined,
                            color: Color.fromARGB(255, 89, 40, 229),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
