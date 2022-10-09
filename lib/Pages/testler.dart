import 'package:flutter/material.dart';
import 'package:noron/Pages/Egitim/Testler/matching_test.dart';
import 'package:noron/Pages/Egitim/Testler/writing_test.dart';

class Testler extends StatefulWidget {
 const Testler({Key? key,required this.bolum,required this.seviye}) : super(key: key);
 final String bolum;
 final int seviye;
  @override
  State<Testler> createState() => _TestlerState();
}

class _TestlerState extends State<Testler> {
  final Color renk = const Color.fromARGB(255, 89, 40, 229);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: height / 60,
        ),
        SizedBox(
          height: height / 5.2,
          width: width / 1.2,
          child: Card(
            color: renk,
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: <Color>[
                    Color.fromARGB(255, 89, 40, 229),
                    Colors.black
                  ],
                  tileMode: TileMode.mirror,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        " Öğrenmenin Temeli",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        " Tekrardır",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: const Image(
                        image: AssetImage("assets/cinar.png"),
                        fit: BoxFit.fill,
                      ))
                ],
              ),
            ),
          ),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IkizAnimasyon("Kelime Yazma", WritingTest(bolum: widget.bolum,seviye: widget.seviye,)),
            IkizAnimasyon(
                "Anlam Bulma",
                KelimeEslestirme(widget.bolum,MediaQuery.of(context).size.height,
                    MediaQuery.of(context).size.width,seviye: widget.seviye,),),
            const SizedBox(
              height: 10,
            )
          ],
        ))
      ],
    );
  }
}

/// Animasyon Classı 3
class IkizAnimasyon extends StatefulWidget {
  const IkizAnimasyon(this.isim, this.sayfa, {Key? key}) : super(key: key);
  final String isim;
  final Widget sayfa;
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _IkizAnimasyon(isim, sayfa);
}

class _IkizAnimasyon extends State<IkizAnimasyon> {
  _IkizAnimasyon(this.isim, this.sayfa);
  Widget sayfa;
  final String isim;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 1200),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 7,
        width: MediaQuery.of(context).size.width / 3,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.blue[50],
              onPrimary: const Color.fromARGB(255, 89, 40, 229),
              shadowColor: Colors.purple,
              onSurface: Colors.red,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  side: BorderSide(color: Color.fromARGB(255, 89, 40, 229)))),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => sayfa,
                ));
          },
          child: Text(isim),
        ),
      ),
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child:
              Padding(padding: EdgeInsets.only(top: value * 20), child: child),
        );
      },
    );
  }
}
