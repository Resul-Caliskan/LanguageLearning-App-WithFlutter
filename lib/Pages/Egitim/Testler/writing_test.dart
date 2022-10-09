import 'package:flutter/material.dart';
import 'package:noron/Interfaces/database/db_helper_hatalarim.dart';
import 'package:noron/datas/data_fiiler.dart';
import 'package:noron/datas/data_sifatlar.dart';
import 'package:noron/datas/data_zarflar.dart';
import '../../../Interfaces/database/kelime.dart';
import '../../../datas/data_isimler.dart';

// ignore: must_be_immutable
class WritingTest extends StatefulWidget {
  double height = 10;
  double width = 10;

  WritingTest({Key? key, required this.bolum, required this.seviye})
      : super(key: key);
  final String bolum;
  final int seviye;
  @override
  State<StatefulWidget> createState() => _WritingTest();
}

class _WritingTest extends State<WritingTest> {
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
        cardlist = cardGetir(counter, widget.seviye);
        hedefList = hedefGetir(counter, widget.seviye);
      });
    });
  }

  void atla() {
    setState(() {
      isatla = true;
      _visible = true;
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
        isatla = false;
        _visible = false;

        cardlist = cardGetir(counter, widget.seviye);
        hedefList = hedefGetir(counter, widget.seviye);
      });
    });
  }

  late List<Widget> cardlist;
  late List<Widget> hedefList;
  @override
  void initState() {
    super.initState();
    cardlist = cardGetir(counter, widget.seviye);
    hedefList = hedefGetir(counter, widget.seviye);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                "Anlamı Verilen Kelimeyi Yazınız.",
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          const SizedBox(
            height: 10,
          ),
//DİNLEME BUTONU
          // Container(
          //   decoration: BoxDecoration(
          //       color: const Color.fromARGB(255, 89, 40, 229),
          //       border: Border.all(color: Colors.amber),
          //       borderRadius: BorderRadius.circular(50)),
          //   child: IconButton(
          //       onPressed: () => Navigator.of(context).pop(),
          //       icon: const Icon(
          //         Icons.record_voice_over_rounded,
          //         color: Colors.amber,
          //         size: 30,
          //       )),
          // ),
          const SizedBox(
            height: 10,
          ),
// Kelimenin anlamı burada yazıyor
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 30,
              ),
              Container(
                  decoration: const BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(
                              color: Color.fromARGB(255, 89, 40, 229),
                              width: 2))),
                  child: turkceKelime(counter, widget.seviye)),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  (counter + 1).toString() + "/25",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
//Hedef Kartlar

          Container(
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(
                        color: Color.fromARGB(255, 89, 40, 229), width: 2))),
            child: FittedBox(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: hedefList,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
// harf kartları
          Visibility(
            visible: !_visible,
            child: TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 1500),
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                    border: Border.fromBorderSide(BorderSide(
                        color: Color.fromARGB(255, 89, 40, 229), width: 2))),
                child: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: cardlist,
                ),
              ),
              builder: (BuildContext context, double value, Widget? child) {
                return ShaderMask(
                  shaderCallback: (rect) {
                    return RadialGradient(
                      radius: value * 5,
                      colors: const [
                        Colors.white,
                        Colors.white,
                        Colors.transparent,
                        Colors.transparent
                      ],
                      stops: const [0.0, 0.90, 0.0, 0.90],
                      center: const FractionalOffset(0.10, 0.95),
                    ).createShader(rect);
                  },
                  child: child,
                );
              },
            ),
          ),

//---HATALARIM BUTONU
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
                                                    ["ingilizceKelime"]
                                                : widget.bolum.toLowerCase() ==
                                                        "fiiller"
                                                    ? fiiller[widget.seviye - 1]
                                                            ["data"][counter]
                                                        ["ingilizceKelime"]
                                                    : widget.bolum
                                                                .toLowerCase() ==
                                                            "zarflar"
                                                        ? zarflar[widget.seviye - 1]
                                                                    ["data"]
                                                                [counter]
                                                            ["ingilizceKelime"]
                                                        : sifatlar[widget.seviye - 1]
                                                                    ["data"]
                                                                [counter]
                                                            ["ingilizceKelime"],
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
              )),
//Tik işareti widget ı
          Center(
            child: Visibility(
                visible: _visible,
                child: Icon(
                  isatla ? Icons.indeterminate_check_box : Icons.check_circle,
                  size: 100,
                  color: isatla ? Colors.red : Colors.green,
                )),
          )
        ]),
      ),
    );
  }

  ///---------turkce Kelime-------------------  */
  Widget turkceKelime(int i, int seviye) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          widget.bolum.toLowerCase() == "isimler"
              ? isimler[seviye - 1]["data"][counter]["turkceKelime"]
              : widget.bolum.toLowerCase() == "fiiller"
                  ? fiiller[seviye - 1]["data"][counter]["turkceKelime"]
                  : widget.bolum.toLowerCase() == "zarflar"
                      ? zarflar[seviye - 1]["data"][counter]["turkceKelime"]
                      : sifatlar[seviye - 1]["data"][counter]["turkceKelime"],
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 1.5,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = Colors.black,
          ),
        ),
        // Solid text as fill.
        Text(
          widget.bolum.toLowerCase() == "isimler"
              ? isimler[seviye - 1]["data"][counter]["turkceKelime"]
              : widget.bolum.toLowerCase() == "fiiller"
                  ? fiiller[seviye - 1]["data"][counter]["turkceKelime"]
                  : widget.bolum.toLowerCase() == "zarflar"
                      ? zarflar[seviye - 1]["data"][counter]["turkceKelime"]
                      : sifatlar[seviye - 1]["data"][counter]["turkceKelime"],
          style: const TextStyle(
            fontSize: 25,
            letterSpacing: 1.5,
            color: Color.fromARGB(255, 115, 171, 234),
          ),
        ),
      ],
    );
  }

//-----------------Karismis ipucu--------------------/
  String ipucu(int i, int seviye) {
    Text text;

    text = Text(
      "${karisitirici(widget.bolum.toLowerCase() == "isimler" ? isimler[seviye - 1]["data"][counter]["ingilizceKelime"].toString() : widget.bolum.toLowerCase() == "fiiller" ? fiiller[seviye - 1]["data"][counter]["ingilizceKelime"].toString() : widget.bolum.toLowerCase() == "zarflar" ? zarflar[seviye - 1]["data"][counter]["ingilizceKelime"].toString() : sifatlar[seviye - 1]["data"][counter]["ingilizceKelime"].toString())}",
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
    );

    return text.data.toString();
  }

  ///-------------KARIŞTIRICI ----------------*/
  karisitirici(String word) {
    List kelime = [];
    String karma = "";
    //word ü parçalarına ayırıyorum
    for (int i = 0; i < word.length; i++) {
      kelime.add(word.substring(i, i + 1));
    }
    //burada kelime listesine attığımız kelimeleri karışık sırada çağırmak
    //için List.generate oluşturdum onuda word.length uznuluğu kadar çağırdım
    //ve i değerini karışık bir şekilde listeye aktarmak için tek çift şeklinde sorgulayıp return ettim
    //List<int>.generate(3, (int index) => index * index); // [0, 1, 4] buda başka örnek kullanımı
    var list = List.generate(word.length, (i) {
      if (i % 2 == 0) {
        if (i == word.length - 1) {
          return i;
        } else {
          return i + 1;
        }
      } else if (i % 2 == 1) {
        return i - 1;
      } else {
        return 0;
      }
    });
    kelime.sort();
    for (int i = 0; i < word.length; i++) {
      karma += kelime[list[i]];
    }

    return karma;
  }

/*----------------------------------------------*/
  //--------------HARF GETİRME------------------------------
  List<Widget> cardGetir(int counter, int seviye) {
    List<Widget> cardlist = [];
    List<bool> gorunurluk = [];
    int sayici = ipucu(counter, seviye).length;
    int uzunluk = sayici;
    //karisik kelime kadar dongu donecek
    for (var i = 0; i < uzunluk; i++) {
      gorunurluk.add(true);
      // print(i.toString() + "dongu");
      cardlist.add(
        Visibility(
          key: Key("index_$i"),
          visible: gorunurluk[i],
          child: Draggable(
            onDragEnd: (drag) {},
            childWhenDragging: Container(),
            // Doğru hedef karta gidince ne olacağını belirliyoruz
            onDragCompleted: () {
              setState(() {
                cardlist.removeWhere((data) {
                  //silme islemi gerceklesiyor
                  return data.key == Key("index_$i");
                });
                uzunluk--;
                sayici--;
                // tüm kelimeler yerleştirlimişse güncelleyi çağırıyoruz
                if (sayici == 0) {
                  guncelle();
                }
              });
            },

            //slide oncesi

            child: Card(
              elevation: 10.0,
              color: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                child: Text(
                  ipucu(counter, seviye)[i],
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),

            //slide sonrasi
            feedback: Card(
              elevation: 10.0,
              color: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                child: Text(ipucu(counter, seviye)[i]),
              ),
            ),
            data: ipucu(counter, seviye)[i],
          ),
        ),
      );
    }
    return cardlist;
  }

/*---------------HEDEF KARTLARI GETİRME-------------------------------*/
  List<Widget> hedefGetir(counter, int seviye) {
    List<Widget> cardlist = [];
    List<bool> gorunurluk = [];
    // ignore: unused_local_variable
    int sayici = ipucu(counter, seviye).length;
    //karisik kelime kadar dongu donecek
    for (var i = 0; i < ipucu(counter, seviye).length; i++) {
      bool dogru = false;
      gorunurluk.add(true);
      cardlist.add(
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
                height: 40,
                width: 40,
                child: dogru
                    ? Text(
                        widget.bolum.toLowerCase() == "isimler"
                            ? isimler[seviye - 1]["data"][counter]
                                    ["ingilizceKelime"]
                                .toString()[i]
                            : widget.bolum.toLowerCase() == "fiiller"
                                ? fiiller[seviye - 1]["data"][counter]
                                        ["ingilizceKelime"]
                                    .toString()[i]
                                : widget.bolum.toLowerCase() == "zarflar"
                                    ? zarflar[seviye - 1]["data"][counter]
                                            ["ingilizceKelime"]
                                        .toString()[i]
                                    : sifatlar[seviye - 1]["data"][counter]
                                            ["ingilizceKelime"]
                                        .toString()[i],
                        style: const TextStyle(fontSize: 20))
                    : const Text(""),
              ),
            );
          },
          //gelen datanın kelimenin harfiyle uyumunu kontrol ediyorum
          onWillAccept: (data) {
            if (widget.bolum.toLowerCase() == "isimler"
                ? data ==
                    isimler[seviye - 1]["data"][counter]["ingilizceKelime"]
                        .toString()[i]
                : widget.bolum.toLowerCase() == "fiiller"
                    ? data ==
                        fiiller[seviye - 1]["data"][counter]["ingilizceKelime"]
                            .toString()[i]
                    : widget.bolum.toLowerCase() == "zarflar"
                        ? data ==
                            zarflar[seviye - 1]["data"][counter]
                                    ["ingilizceKelime"]
                                .toString()[i]
                        : data ==
                            sifatlar[seviye - 1]["data"][counter]
                                    ["ingilizceKelime"]
                                .toString()[i]) {
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
        ),
      );
    }
    return cardlist;
  }
}
