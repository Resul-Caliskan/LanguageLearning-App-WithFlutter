import 'package:flutter/material.dart';
import 'package:noron/Interfaces/database/db_helper_seviye.dart';
import 'package:noron/Interfaces/database/seviye.dart';
import 'package:noron/SayfaIcerik/kart_ve_test.dart';

class Seviyeler extends StatefulWidget {
  const Seviyeler(
    this.isim, {
    Key? key,
  }) : super(key: key);
  final String isim;

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _Seviyeler(isim);
}

class _Seviyeler extends State<Seviyeler> {
  DbHelperS db = DbHelperS();
  _Seviyeler(this.isim);
  final String isim;
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
  @override
  void initState() {
    var liste = db.getVeri();
    liste.then((value) {
      if (value.isEmpty) {
      } else {
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
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
        backgroundColor: const Color.fromARGB(255, 89, 40, 229),
        title: Text(isim, style: const TextStyle(fontStyle: FontStyle.italic)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Animasyon(1, isim, "1.Seviye",
                seviye: isim == "İSİMLER"
                    ? seviyeler[0].deste!
                    : isim == "FİİLLER"
                        ? seviyeler[8].deste!
                        : isim == "SIFATLAR"
                            ? seviyeler[15].deste!
                            : seviyeler[18].deste!),
            Animasyon(2, isim, "2.Seviye",
                seviye: isim == "İSİMLER"
                    ? seviyeler[1].deste!
                    : isim == "FİİLLER"
                        ? seviyeler[9].deste!
                        : isim == "SIFATLAR"
                            ? seviyeler[16].deste! //zarf son
                            : seviyeler[19].deste!),
            isim == "İSİMLER" || isim == "FİİLLER" || isim == "SIFATLAR"
                ? Animasyon(3, isim, "3.Seviye",
                    seviye: isim == "İSİMLER"
                        ? seviyeler[2].deste!
                        : isim == "FİİLLER"
                            ? seviyeler[10].deste!
                            : isim == "SIFATLAR"
                                ? seviyeler[17].deste! //sıfat son
                                : seviyeler[17].deste!)
                : const SizedBox(),
            isim == "İSİMLER" || isim == "FİİLLER"
                ? Animasyon(4, isim, "4.Seviye",
                    seviye: isim == "İSİMLER"
                        ? seviyeler[3].deste!
                        : isim == "FİİLLER"
                            ? seviyeler[11].deste!
                            : isim == "SIFATLAR"
                                ? seviyeler[13].deste!
                                : seviyeler[18].deste!)
                : const SizedBox(),
            isim == "İSİMLER" || isim == "FİİLLER"
                ? Animasyon(5, isim, "5.Seviye",
                    seviye: isim == "İSİMLER"
                        ? seviyeler[4].deste!
                        : isim == "FİİLLER"
                            ? seviyeler[12].deste!
                            : isim == "SIFATLAR"
                                ? seviyeler[14].deste!
                                : seviyeler[19].deste!)
                : const SizedBox(),
            isim == "İSİMLER" || isim == "FİİLLER"
                ? Animasyon(6, isim, "6.Seviye",
                    seviye: isim == "İSİMLER"
                        ? seviyeler[5].deste!
                        : isim == "FİİLLER"
                            ? seviyeler[13].deste!
                            : isim == "SIFATLAR"
                                ? seviyeler[14].deste!
                                : seviyeler[19].deste!)
                : const SizedBox(),
            isim == "İSİMLER" || isim == "FİİLLER"
                ? Animasyon(7, isim, "7.Seviye",
                    seviye: isim == "İSİMLER"
                        ? seviyeler[6].deste!
                        : isim == "FİİLLER"
                            ? seviyeler[14].deste! //fiil son
                            : isim == "SIFATLAR"
                                ? seviyeler[14].deste!
                                : seviyeler[19].deste!)
                : const SizedBox(),
            isim == "İSİMLER"
                ? Animasyon(8, isim, "8.Seviye",
                    seviye: isim == "İSİMLER"
                        ? seviyeler[7].deste!
                        : isim == "FİİLLER"
                            ? seviyeler[15].deste!
                            : isim == "SIFATLAR"
                                ? seviyeler[14].deste!
                                : seviyeler[19].deste!)
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

///  Animasyon Classı                    */
class Animasyon extends StatefulWidget {
  const Animasyon(this.animasyonseviyesi, this.bolum, this.isim,
      {Key? key, required this.seviye})
      : super(key: key);
  final int animasyonseviyesi;
  final String isim;
  final String bolum;
  final String seviye;
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _Animasyon(isim);
  }
}

class _Animasyon extends State<Animasyon> {
  _Animasyon(
    this.isim,
  );

  final String isim;
  bool firstChild = true;
  int x() {
    int toplam = 0;
    var liste = widget.seviye.split("-");
    for (var i = 0; i < 6; i++) {
      toplam += 25 * int.parse(liste[i]);
    }
    return toplam;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color.fromARGB(255, 89, 40, 229),
                Color.fromARGB(255, 69, 28, 251)
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          alignment: Alignment.center,
          margin: const EdgeInsets.all(5),
          width: double.infinity,
          height: 30,
          child: Text(
            isim + " Grup Kelimeler " + x().toString() + "/150",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )),
      AnimatedCrossFade(
        crossFadeState:
            firstChild ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 500),
        firstChild: InkWell(
          onTap: (() {
            setState(() {
              firstChild = !firstChild;
            });
          }),
          child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width / 1.1,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color.fromARGB(255, 31, 151, 231),
                    Color.fromARGB(255, 89, 49, 220),
                  ],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: const Text(
                "Desteler İçin Tıklayınız",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        secondChild: InkWell(
          onTap: () {
            setState(() {
              firstChild = !firstChild;
            });
          },
          child: Container(
            color: Colors.white,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.spaceAround,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                buton(widget.animasyonseviyesi, context, widget.bolum, isim[0],
                    "1", widget.seviye.split("-")),
                widget.bolum == "ZARFLAR" && isim[0] == "2"
                    ? const SizedBox()
                    : buton(widget.animasyonseviyesi, context, widget.bolum,
                        isim[0], "2", widget.seviye.split("-")),
                widget.bolum == "ZARFLAR" && isim[0] == "2"
                    ? const SizedBox()
                    : widget.bolum == "FİİLLER" && isim[0] == "7"
                        ? const SizedBox()
                        : buton(widget.animasyonseviyesi, context, widget.bolum,
                            isim[0], "3", widget.seviye.split("-")),
                widget.bolum == "ZARFLAR" && isim[0] == "2"
                    ? const SizedBox()
                    : widget.bolum == "FİİLLER" && isim[0] == "7"
                        ? const SizedBox()
                        : buton(widget.animasyonseviyesi, context, widget.bolum,
                            isim[0], "4", widget.seviye.split("-")),
                widget.bolum == "ZARFLAR" && isim[0] == "2"
                    ? const SizedBox()
                    : widget.bolum == "FİİLLER" && isim[0] == "7"
                        ? const SizedBox()
                        : widget.bolum == "SIFATLAR" && isim[0] == "3"
                            ? const SizedBox()
                            : widget.bolum == "FİİLLER" && isim[0] == "7"
                                ? const SizedBox()
                                : buton(
                                    widget.animasyonseviyesi,
                                    context,
                                    widget.bolum,
                                    isim[0],
                                    "5",
                                    widget.seviye.split("-")),
                widget.bolum == "ZARFLAR" && isim[0] == "2"
                    ? const SizedBox()
                    : widget.bolum == "SIFATLAR" && isim[0] == "3"
                        ? const SizedBox()
                        : widget.bolum == "FİİLLER" && isim[0] == "7"
                            ? const SizedBox()
                            : buton(
                                widget.animasyonseviyesi,
                                context,
                                widget.bolum,
                                isim[0],
                                "6",
                                widget.seviye.split("-"))
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

Widget buton(int animasyonseviyesi, context, String bolum, String isim,
    String numara, List deger) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 7,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue[50],
        onPrimary: const Color.fromARGB(255, 89, 40, 229),
        shadowColor: Colors.purple,
        onSurface: Colors.red,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Color.fromARGB(255, 89, 40, 229))),
      ),
      //Burası değişken olacak tamamlananlar yeşil yanacak
      onPressed: () {
        String deste = "";
        List liste = [];
        for (var i = 0; i < 6; i++) {
          if (i == int.parse(numara) - 1) {
            liste.add(1);
          } else {
            liste.add(deger[i]);
          }
          deste += liste[i].toString();
          i == 5 ? deste = deste : deste += "-";
        }

        DbHelperS db = DbHelperS();
        db.update(Seviye(bolum.toLowerCase(), int.parse(isim), deste));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IkiliSekme(
                      bolum: bolum,
                      seviye: int.parse(numara) + ((animasyonseviyesi - 1) * 6),
                    )));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            numara + ". Deste ",
            style: const TextStyle(
                color: Color.fromARGB(255, 89, 40, 229), fontSize: 15),
          ),
          Icon(
            deger[int.parse(numara) - 1] == "0"
                ? Icons.donut_large_rounded
                : Icons.check_circle_outline_outlined,
            color:
                deger[int.parse(numara) - 1] == "0" ? Colors.red : Colors.green,
            size: 30,
          )
        ],
      ),
    ),
  );
}
