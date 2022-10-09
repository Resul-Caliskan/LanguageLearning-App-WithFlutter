import 'package:flutter/material.dart';
import 'package:noron/Interfaces/database/db_helper.dart';
import 'package:noron/Interfaces/database/kelime.dart';
import 'package:noron/datas/data_fiiler.dart';
import 'package:noron/datas/data_sifatlar.dart';
import 'package:noron/datas/data_zarflar.dart';
import '../../datas/data_isimler.dart';

class KelimeKartlari extends StatefulWidget {
  const KelimeKartlari({Key? key, required this.bolum,required this.seviye}) : super(key: key);
  final String bolum;
  final int seviye;
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _KelimeKartlari();
}

class _KelimeKartlari extends State<KelimeKartlari> {
  int _index = 0;

   List<Widget> cocuklar=[];
  @override
  void initState() {
    super.initState();
    setState(() {
    cocuklar.add(Animasyon(0, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(1, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(2, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(3, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(4, bolum: widget.bolum,seviye: widget.seviye,));
    
    cocuklar.add(Animasyon(5, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(6, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(7, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(8, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(9, bolum: widget.bolum,seviye: widget.seviye,));

    cocuklar.add(Animasyon(10, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(11, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(12, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(13, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(14, bolum: widget.bolum,seviye: widget.seviye,));
   
    cocuklar.add(Animasyon(15, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(16, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(17, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(18, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(19, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(20, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(21, bolum: widget.bolum,seviye: widget.seviye,)); 
    cocuklar.add(Animasyon(22, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(23, bolum: widget.bolum,seviye: widget.seviye,));
    cocuklar.add(Animasyon(24, bolum: widget.bolum,seviye: widget.seviye,));

    });
 

    
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints) {
        return TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 1500),
          child: Column(
            children: [
              Visibility(
                visible: _index == 0
                    ? false
                    : _index == 14
                        ? false
                        : true,
                child: const SizedBox(
                  height: 20,
                ),
              ),
//Anlam Görme
              Visibility(
                visible: _index == 0 ? true : false,
                child: const Text(
                    "Anlamını Görmek İçin Kelimenin Üzerine Tıklayın."),
              ),
              //KART SAYISI
              Center(
                child: Text(
                  (_index + 1).toString() + "/25",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
//Aşağı Kaydırın
              Visibility(
                visible: _index == 0 ? true : false,
                child: const Text("Aşağıya Doğru Sürükleyin."),
              ),
              //KELİME KARTLARI
              Center(
                child: SizedBox(
                  // KART YUKSEKLİĞİ
                  height: MediaQuery.of(context).size.height * 0.75,
                  //KART GENİŞLİĞİ
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 25,
                    controller: PageController(viewportFraction: 0.5),
                    onPageChanged: (int index) =>
                        setState(() => _index = index),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                          scale: i == _index ? 1 : 0.5, child: cocuklar[i]);
                    },
                  ),
                ),
              ),
            ],
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
                  stops: const [0.0, 0.55, 0.6, 1.0],
                  center: const FractionalOffset(0.10, 0.95),
                ).createShader(rect);
              },
              child: child,
            );
          },
        );
      },
    );
  }
}

///   Animasyon Classı 2
class Animasyon extends StatefulWidget {
  const Animasyon(this.i, {Key? key, required this.bolum,required this.seviye}) : super(key: key);
  final String bolum;
  final int seviye;
  final int i;
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _Animasyon(i);
}

class _Animasyon extends State<Animasyon> {
  DbHelper db = DbHelper();
  int? i;
  _Animasyon(this.i);
  bool _firstChild = true;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double widht = MediaQuery.of(context).size.width;
    return Card(
      color: _firstChild
          ? const Color.fromARGB(255, 89, 40, 229)
          : const Color.fromARGB(255, 38, 152, 245),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 3,
          ),
//Ses iconu
          // Container(
          //   decoration: BoxDecoration(
          //       border: Border.all(color: Colors.amber),
          //       borderRadius: BorderRadius.circular(20)),
          //   child: const Icon(
          //     Icons.calendar_view_day_rounded,
          //     color: Colors.amber,
          //     size: 30,
          //   ),
          // ),
//animasyon kısmı
          Expanded(
            child: AnimatedCrossFade(
              firstCurve: Curves.easeInCubic,
              secondCurve: Curves.easeInCubic,
              firstChild: InkWell(
                onTap: () {
                  setState(() {
                    _firstChild = !_firstChild;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 145, 112, 235),
                      borderRadius: BorderRadius.circular(18)),
                  height: height * 0.25,
                  width: widht / 1.2,
//Kelimenin yazdığı kısım
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      FittedBox(
                        child: Text(
                          widget.bolum.toLowerCase() == "isimler"
                              ? isimler[widget.seviye-1]["data"][i]["ingilizceKelime"]
                              : widget.bolum.toLowerCase() == "fiiller"
                                  ? fiiller[widget.seviye-1]["data"][i]["ingilizceKelime"]
                                  : widget.bolum.toLowerCase() == "zarflar"
                                      ? zarflar[widget.seviye-1]["data"][i]["ingilizceKelime"]
                                      : sifatlar[widget.seviye-1]["data"][i]
                                          ["ingilizceKelime"],
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        ),
                      ),
                      const Text(
                        "Okunuşu",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.amber,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.amber,
                            decorationStyle: TextDecorationStyle.solid),
                      ),
                      FittedBox(
                        child: Text(
                          widget.bolum.toLowerCase() == "isimler"
                              ? isimler[widget.seviye-1]["data"][i]["okunus"]
                              : widget.bolum.toLowerCase() == "fiiller"
                                  ? fiiller[widget.seviye-1]["data"][i]["okunus"]
                                  : widget.bolum.toLowerCase() == "zarflar"
                                      ? zarflar[widget.seviye-1]["data"][i]["okunus"]
                                      : sifatlar[widget.seviye-1]["data"][i]
                                          ["okunus"],
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                ),
              ),
              secondChild: InkWell(
                onTap: () {
                  setState(() {
                    _firstChild = !_firstChild;
                  });
                },
//Anlamının yazdığı kısım
                child: Container(
                  height: height * 0.25,
                  width: widht / 1.2,
                  color: const Color.fromARGB(255, 16, 110, 251),
                  alignment: Alignment.center,
                  child: Text(
                      widget.bolum.toLowerCase() == "isimler"
                          ? isimler[widget.seviye-1]["data"][i]["turkceKelime"]
                          : widget.bolum.toLowerCase() == "fiiller"
                              ? fiiller[widget.seviye-1]["data"][i]["turkceKelime"]
                              : widget.bolum.toLowerCase() == "zarflar"
                                  ? zarflar[widget.seviye-1]["data"][i]["turkceKelime"]
                                  : sifatlar[widget.seviye-1]["data"][i]["turkceKelime"],
                      style:
                          const TextStyle(fontSize: 25, color: Colors.white)),
                ),
              ),
              crossFadeState: _firstChild
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
              layoutBuilder: (
                Widget topChild,
                Key topChildKey,
                Widget bottomChild,
                Key bottomChildKey,
              ) {
                return Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    PositionedDirectional(
                      child: bottomChild,
                      key: bottomChildKey,
                      top: 0,
                    ),
                    PositionedDirectional(
                      child: topChild,
                      key: topChildKey,
                    ),
                  ],
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              
              db.ekleVeri(Kelime(widget.bolum.toLowerCase(),widget.seviye, i));

              showDialog(
                  context: context,
                  builder: (context) => Dialog(
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color.fromARGB(255, 89, 40, 229)),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      backgroundColor: Colors.white,
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                          child: listemeEkleWidget())));
              
            },
            child: const Text(
              "Listeme Ekle",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                primary: Colors.green),
          ),
        ],
      ),
    );
  }
}

Widget listemeEkleWidget() {
  return Container(
    decoration: BoxDecoration(
        border:
            Border.all(color: const Color.fromARGB(255, 89, 40, 229), width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(30))),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 70,
          ),
          Text(
            "Listeme Eklendi",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ]),
  );
}
