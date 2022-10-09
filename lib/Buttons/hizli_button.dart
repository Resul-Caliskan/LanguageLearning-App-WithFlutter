import 'package:flutter/material.dart';
import 'package:noron/ButonIslemleri/hizli_buton_liste_kart.dart';
import 'package:noron/ButonIslemleri/hizlibuton_hata_kart.dart';

class HizliButon extends StatelessWidget {
  const HizliButon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        // kart(context, "Öğrendiklerimden", " Test Getir", const Color.fromARGB(255, 9, 104, 183),
        //     const Color.fromARGB(255, 79, 223, 248), HizliTestListe()),
        kart(context, "Listelerimden", " Test Getir", const Color.fromARGB(255, 3, 129, 7),
            const Color.fromARGB(255, 6, 248, 99), HizliTestListe()),
        kart(context, "Hatalarımdan", " Test Getir", const Color.fromARGB(255, 175, 19, 8),
            const Color.fromARGB(255, 249, 148, 133), HizliTestHata()),
      ],
    );
  }
}

Widget kart(
    context, String isim1, String isim, Color color, Color color2, sayfa) {
  return Card(
    color: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    elevation: 6,
    child: SizedBox(
      height: 180,
      width: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: FittedBox(
              child: Row(
                children: [
                  const Icon(
                    Icons.bolt_sharp,
                    color: Colors.yellow,
                    size: 40,
                  ),
                  Text(
                    isim1,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const Icon(
                    Icons.bolt_sharp,
                    color: Colors.yellow,
                    size: 40,
                  ),
                ],
              ),
            ),
          ),
          buton(context, isim, color2, sayfa)
        ],
      ),
    ),
  );
}

Widget buton(context, String isim, Color color, sayfa) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(33),
      color: color,
    ),
    child: SizedBox(
      width: 140,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => sayfa));
        },
        child: FittedBox(
          child: Text(isim,
              style: const TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ),
    ),
  );
}
