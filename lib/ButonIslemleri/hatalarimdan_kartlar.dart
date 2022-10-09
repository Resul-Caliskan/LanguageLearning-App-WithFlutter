import 'package:flutter/material.dart';
import 'package:noron/Interfaces/database/db_helper_hatalarim.dart';
import 'package:noron/Interfaces/database/kelime.dart';
import 'package:noron/datas/data_fiiler.dart';
import 'package:noron/datas/data_sifatlar.dart';
import 'package:noron/datas/data_zarflar.dart';

import '../datas/data_isimler.dart';

class HatalarimdanKartlar extends StatefulWidget {
  
  const HatalarimdanKartlar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HatalarimdanKartlar();
}

class _HatalarimdanKartlar extends State<HatalarimdanKartlar> {
  bool isveri=false;
  int? _index=0;
DbHelperH db= DbHelperH();
int kelimeSayi=0;
List<Kelime>? kelimeler;

@override
  // ignore: must_call_super
  void initState() {
    //databaseden ilk açılınca verileri çekip kelimelere atıyouruz
   var liste=  db.getVeri();
   
   liste.then((data){
    if (data.isEmpty) {
       isveri=false;
      } else {
        setState(() {
         
          isveri = true;
          kelimeler = data;
          kelimeSayi = kelimeler!.length;
        });
      }
    });
    
    
  }

  @override
  Widget build(BuildContext context) {
       return isveri ? Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
        backgroundColor: const Color.fromARGB(255, 89, 40, 229),
        title: const Text("Kelime Kartları",
            style: TextStyle(fontStyle: FontStyle.italic)),
      ),
      body: LayoutBuilder(
        builder: (context, contraints) {
          return TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1500),
            child: Column(
              children: [
                Visibility(
                  visible: _index == 0
                      ? false
                      : _index == kelimeSayi
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
                    (_index! + 1).toString() + "/"+kelimeSayi.toString(),
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
                    height: _index == 14
                        ? MediaQuery.of(context).size.height * 0.6
                        : MediaQuery.of(context).size.height * 0.75,
                    //KART GENİŞLİĞİ
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: kelimeSayi,
                      controller: PageController(viewportFraction: 0.5),
                      onPageChanged: (int index) =>
                          setState(() => _index = index),
                      itemBuilder: (_, i) {
                        return Transform.scale(
                            scale: i == _index ? 1 : 0.5, child: Animasyon(kelimeler![i].sira!,bolum: kelimeler![i].bolumadi!,seviye:kelimeler![i].bolum!,));
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
      ),
    ) : Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(50))),
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
                                        color:
                                            Color.fromARGB(255, 89, 40, 229)),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30))),
                                backgroundColor:
                                    Color.fromARGB(255, 207, 230, 249),
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
          body: SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 89, 40, 229), width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(
                      Icons.indeterminate_check_box,
                      color: Colors.red,
                      size: 70,
                    ),
                    Text(
                      "Hatalarıma Eklenmiş Kelime Yok",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ]),
            ),
          ));
 }
}

///   Animasyon Classı 2
class Animasyon extends StatefulWidget {
  const Animasyon(this.i, {Key? key,required this.bolum,required this.seviye}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final String bolum;
  final int seviye;
  final int i;
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _Animasyon(i);
}

class _Animasyon extends State<Animasyon> {
  int i;
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
                              ? isimler[widget.seviye]["data"][i]["ingilizceKelime"]
                              : widget.bolum.toLowerCase() == "fiiller"
                                  ? fiiller[widget.seviye]["data"][i]["ingilizceKelime"]
                                  : widget.bolum.toLowerCase() == "zarflar"
                                      ? zarflar[widget.seviye]["data"][i]["ingilizceKelime"]
                                      : sifatlar[widget.seviye]["data"][i]
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
                            decorationStyle: TextDecorationStyle.double),
                      ),
                      FittedBox(
                        child: Text(
                          widget.bolum.toLowerCase() == "isimler"
                              ? isimler[widget.seviye]["data"][i]["okunus"]
                              : widget.bolum.toLowerCase() == "fiiller"
                                  ? fiiller[widget.seviye]["data"][i]["okunus"]
                                  : widget.bolum.toLowerCase() == "zarflar"
                                      ? zarflar[widget.seviye]["data"][i]["okunus"]
                                      : sifatlar[widget.seviye]["data"][i]
                                          ["ingilizceKelime"],
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
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 16, 110, 251),
                      borderRadius: BorderRadius.circular(18)),
                  height: height * 0.25,
                  width: widht / 1.2,
                  
                  alignment: Alignment.center,
                  child: Text(widget.bolum.toLowerCase() == "isimler"
                          ? isimler[widget.seviye]["data"][i]["turkceKelime"]
                          : widget.bolum.toLowerCase() == "fiiller"
                              ? fiiller[widget.seviye]["data"][i]["turkceKelime"]
                              : widget.bolum.toLowerCase() == "zarflar"
                                  ? zarflar[widget.seviye]["data"][i]["turkceKelime"]
                                  : sifatlar[widget.seviye]["data"][i]["turkceKelime"],
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
        ],
      ),
    );
  }
}

