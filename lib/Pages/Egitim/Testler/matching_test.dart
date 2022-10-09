import 'package:flutter/material.dart';
import 'package:noron/datas/data_fiiler.dart';
import 'package:noron/datas/data_isimler.dart';
import 'package:noron/datas/data_sifatlar.dart';
import 'package:noron/datas/data_zarflar.dart';

import '../../../Interfaces/database/db_helper_hatalarim.dart';
import '../../../Interfaces/database/kelime.dart';

// ignore: must_be_immutable
class KelimeEslestirme extends StatefulWidget {
  KelimeEslestirme(this.bolum, this.yukseklik, this.genislik,
      {Key? key, required this.seviye})
      : super(key: key);
  double yukseklik;
  double genislik;
  String bolum;
  final int seviye;

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _KelimeEslestirme(yukseklik, genislik);
}

class _KelimeEslestirme extends State<KelimeEslestirme> {
  _KelimeEslestirme(this.yukseklik, this.genislik);
  final double yukseklik;
  final double genislik;

  // late List<Widget> cardlist;
  late List<Widget> hedefList;
  DbHelperH db = DbHelperH();
  int counter = 0;
  //tebrik ekranı için yazdım
  bool _visible = false;
  bool isatla = false;
// burda tebrik widget ı gösterilip Future.delayed ile 900 ms sonra diğer kelimeye geçiliyor
  void guncelle() {
    setState(() {
      _visible = true;
      isatla = false;
    });
    if (counter == 24) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });
    }
    // İşlemi bekletip ondan sonra set ediyoruz
    Future.delayed(const Duration(milliseconds: 1100), () {
      setState(() {
        counter++;

        _visible = false;
        // cardlist = kelimeGetir(counter);
        hedefList = hedefGetir(counter, widget.seviye);
      });
    });
  }

  void atla() {
    setState(() {
      isatla = true;
      _visible = true;
    });
    // İşlemi bekletip ondan sonra set ediyoruz
    if (counter == 24) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });
    }
    Future.delayed(const Duration(milliseconds: 1100), () {
      setState(() {
        counter++;
        isatla = false;
        _visible = false;

        // cardlist = kelimeGetir(counter);
        hedefList = hedefGetir(counter, widget.seviye);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // cardlist = kelimeGetir(counter);
    hedefList = hedefGetir(counter, widget.seviye);
  }
  // late Widget bilmem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //İngilizce Kelimeyi Aşağıda Yer Alan Anlamıyla Eşleştiriniz(Sürükleyiniz).Eğer Kelimeyi Bilmiyorsanız Bilmiyorum Kısmına Sürükleyiniz
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
        backgroundColor: const Color.fromARGB(255, 89, 40, 229),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Harf Yerleştirme",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const Dialog(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color.fromARGB(255, 89, 40, 229)),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                            backgroundColor: Color.fromARGB(255, 207, 230, 249),
                            child: SizedBox(
                              height: 90,
                              child: Text(
                                "İngilizce Kelimeyi Aşağıda Yer Alan Anlamıyla Eşleştiriniz(Sürükleyiniz).Eğer Kelimeyi Bilmiyorsanız Bilmiyorum Atlayın",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                          ));
                },
                icon: const Icon(Icons.help)),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            const Text(
                "Veilen Kelimeyi Anlamının Yazılı Olduğu\n          Kutuya Sürükleyiniz"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    (counter + 1).toString() + "/25",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
//HEDEF KARTLAR
            Wrap(children: hedefList),
            const Center(
              child: Text(
                "Kelime",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    textBaseline: TextBaseline.alphabetic,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                    decorationStyle: TextDecorationStyle.solid),
              ),
            ),
//KELİME KARTLARI
            Draggable(
              data: widget.bolum.toLowerCase() == "isimler"
                  ? isimler[widget.seviye - 1]["data"][counter]
                      ["ingilizceKelime"]
                  : widget.bolum.toLowerCase() == "fiiller"
                      ? fiiller[widget.seviye - 1]["data"][counter]
                          ["ingilizceKelime"]
                      : widget.bolum.toLowerCase() == "zarflar"
                          ? zarflar[widget.seviye - 1]["data"][counter]
                              ["ingilizceKelime"]
                          : sifatlar[widget.seviye - 1]["data"][counter]
                              ["ingilizceKelime"],
              onDragCompleted: () {
                setState(() {
                  guncelle();
                });
              },
              childWhenDragging: Container(),
              child: Card(
                elevation: 10.0,
                color: (counter % 2 == 0) ? Colors.amber : Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: yukseklik / 15,
                  width: genislik / 3,
                  child: FittedBox(
                    child: Text(
                      widget.bolum.toLowerCase() == "isimler"
                          ? isimler[widget.seviye - 1]["data"][counter]
                              ["ingilizceKelime"]
                          : widget.bolum.toLowerCase() == "fiiller"
                              ? fiiller[widget.seviye - 1]["data"][counter]
                                  ["ingilizceKelime"]
                              : widget.bolum.toLowerCase() == "zarflar"
                                  ? zarflar[widget.seviye - 1]["data"][counter]
                                      ["ingilizceKelime"]
                                  : sifatlar[widget.seviye - 1]["data"][counter]
                                      ["ingilizceKelime"],
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              ),
              feedback: Card(
                elevation: 10.0,
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: yukseklik / 15,
                  width: genislik / 3,
                  child: Text(
                    widget.bolum.toLowerCase() == "isimler"
                        ? isimler[widget.seviye - 1]["data"][counter]
                            ["ingilizceKelime"]
                        : widget.bolum.toLowerCase() == "fiiller"
                            ? fiiller[widget.seviye - 1]["data"][counter]
                                ["ingilizceKelime"]
                            : widget.bolum.toLowerCase() == "zarflar"
                                ? zarflar[widget.seviye - 1]["data"][counter]
                                    ["ingilizceKelime"]
                                : sifatlar[widget.seviye - 1]["data"][counter]
                                    ["ingilizceKelime"],
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
//BİLMİYORUM KARTI
            Visibility(
              visible: !_visible,
              child: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red[300],
                        onPrimary: Colors.white,
                        shadowColor: Colors.purple,
                        onSurface: Colors.red,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                            side: BorderSide(
                                color: Color.fromARGB(255, 89, 40, 229)))),
                    onPressed: () {
                      db.ekleVeri(Kelime(widget.bolum.toLowerCase(),
                          widget.seviye - 1, counter));
                      showDialog(
                          context: context,
                          builder: (context) => WillPopScope(
                                onWillPop: () async => false,
                                child: Dialog(
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 89, 40, 229)),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30))),
                                  backgroundColor:
                                      const Color.fromARGB(255, 174, 149, 245),
                                  child: SizedBox(
                                    height: 90,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text("Cevap:",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white)),
                                          Text(
                                            widget.bolum.toLowerCase() ==
                                                    "isimler"
                                                ? isimler[widget.seviye - 1]
                                                        ["data"][counter]
                                                    ["turkceKelime"]
                                                : widget.bolum.toLowerCase() ==
                                                        "fiiller"
                                                    ? fiiller[widget.seviye - 1]
                                                            ["data"][counter]
                                                        ["turkceKelime"]
                                                    : widget.bolum
                                                                .toLowerCase() ==
                                                            "zarflar"
                                                        ? zarflar[widget.seviye - 1]
                                                                    ["data"]
                                                                [counter]
                                                            ["turkceKelime"]
                                                        : sifatlar[widget.seviye - 1]
                                                                    ["data"]
                                                                [counter]
                                                            ["turkceKelime"],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ]),
                                  ),
                                ),
                              ));
                      Future.delayed(const Duration(milliseconds: 2500), () {
                        Navigator.of(context, rootNavigator: true).pop();
                        atla();
                      });
                    },
                    child: const Text("Hatalarıma Ekle Ve Atla")),
              ),
            ),
            Center(
              child: Visibility(
                  visible: _visible,
                  child: Icon(
                    isatla ? Icons.indeterminate_check_box : Icons.check_circle,
                    size: 100,
                    color: isatla ? Colors.red : Colors.green,
                  )),
            )
          ],
        ),
      ),
    );
  }

/*-----------------HEDEF KARTLARINI GETİRME-----------------------------*/
  List<Widget> hedefGetir(int counter, int seviye) {
    List<Widget> cardlist = [];

    //karisik kelime kadar dongu donecek
    for (var i = 0; i < 6; i++) {
      bool dogru = false;

      cardlist.add(
        Stack(children: [
          //******Hedef Kartların oldugu kısım */
          DragTarget(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return Card(
                elevation: 10.0,
                color: dogru ? Colors.green : Colors.blueGrey[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: yukseklik / 15,
                  width: genislik / 3,
                  child: Text(
                      widget.bolum.toLowerCase() == "isimler"
                          ? isimler[seviye - 1]["data"]
                                  [(i + counter) >= 25 ? i : i + counter]
                              ["turkceKelime"]
                          : widget.bolum.toLowerCase() == "fiiller"
                              ? fiiller[seviye - 1]["data"]
                                      [(i + counter) >= 25 ? i : i + counter]
                                  ["turkceKelime"]
                              : widget.bolum.toLowerCase() == "zarflar"
                                  ? zarflar[seviye - 1]["data"][
                                          (i + counter) >= 25 ? i : i + counter]
                                      ["turkceKelime"]
                                  : sifatlar[seviye - 1]["data"]
                                          [(i + counter) >= 25 ? i : i + counter]
                                      ["turkceKelime"],
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                ),
              );
            },
            //gelen datanın kelimenin harfiyle uyumunu kontrol ediyorum
            onWillAccept: (data) {
              if (widget.bolum.toLowerCase() == "isimler"
                  ? isimler[seviye - 1]["data"]
                              [(i + counter) >= 25 ? i : i + counter]
                          ["ingilizceKelime"] ==
                      data
                  : widget.bolum.toLowerCase() == "fiiller"
                      ? fiiller[seviye - 1]["data"]
                                  [(i + counter) >= 25 ? i : i + counter]
                              ["ingilizceKelime"] ==
                          data
                      : widget.bolum.toLowerCase() == "zarflar"
                          ? zarflar[seviye - 1]["data"]
                                      [(i + counter) >= 25 ? i : i + counter]
                                  ["ingilizceKelime"] ==
                              data
                          : sifatlar[seviye - 1]["data"]
                                      [(i + counter) >= 25 ? i : i + counter]
                                  ["ingilizceKelime"] ==
                              data) {
                return true;
              } else {
                return false;
              }
            },
            //data dogruysa set state edip hedef kartı degistiriyorum
            onAccept: (data) {
              setState(() {
                dogru = true;
              });
            },
          )
        ]),
      );
    }
    cardlist.shuffle();
    return cardlist;
  }
}
