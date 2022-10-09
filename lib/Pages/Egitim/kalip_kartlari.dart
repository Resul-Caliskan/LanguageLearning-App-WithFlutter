import 'package:flutter/material.dart';
import 'package:noron/datas/data_kalip.dart';

class KalipKartlari extends StatefulWidget {
  const KalipKartlari({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _KalipKartlari();
}

class _KalipKartlari extends State<KalipKartlari> {
  int _index = 0;

   List<Widget> cocuklar=const [Animasyon(i:0),
Animasyon(i:1),
Animasyon(i:2),
Animasyon(i:3),
Animasyon(i:4),
Animasyon(i:5),
Animasyon(i:6),
Animasyon(i:7),
Animasyon(i:8),
Animasyon(i:9),
Animasyon(i:10),
Animasyon(i:11),
Animasyon(i:12),
Animasyon(i:13),
Animasyon(i:14),
Animasyon(i:15),
Animasyon(i:16),
Animasyon(i:17),
Animasyon(i:18),
Animasyon(i:19),
Animasyon(i:20),
Animasyon(i:21),
Animasyon(i:22),
Animasyon(i:23),
Animasyon(i:24),
Animasyon(i:25)];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
        backgroundColor: const Color.fromARGB(255, 89, 40, 229),
        title:
            const Text("Kalıp Cümleler", style: TextStyle(fontStyle: FontStyle.italic)),
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
                      : _index == 24
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
      ),
    );
  }
}

///   Animasyon Classı 2
class Animasyon extends StatefulWidget {
  const Animasyon( {Key? key,required this.i}) : super(key: key);
  final int i;
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _Animasyon();
}

class _Animasyon extends State<Animasyon> {

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
                          kaliplar[0]["data"][widget.i]["ingilizceCumle"],
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
                          kaliplar[0]["data"][widget.i]["okunus"],
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
                      kaliplar[0]["data"][widget.i]["turkceCumle"],
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