import 'package:flutter/material.dart';
import 'package:noron/ButonIslemleri/hatalarimdan_kartlar.dart';
import 'package:noron/ButonIslemleri/listeden_kartlar.dart';

class ListelerimButton extends StatelessWidget {
  const ListelerimButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        kart(context, "Benim Listelerim", false, Colors.green),
        kart(context, "Hatalarım Listesi", true,
            const Color.fromARGB(255, 189, 18, 6))
      ],
    );
  }
}

Widget kart(context, String isim, bool _isHatalarim, Color color) {
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
          Text(
            isim,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          const Text(
            "Kelim Kartları",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          _isHatalarim
              ? buton(
                  context,
                  "Hatalarım Listesini Getir",
                  const Color.fromARGB(255, 249, 145, 97),
                   const HatalarimdanKartlar(),
                  40)
              : buton(
                  context,
                  "Listemi Getir",
                  const Color.fromARGB(255, 4, 245, 156),
                   const ListedenKartlar(),
                  40)
        ],
      ),
    ),
  );
}

Widget buton(context, String isim, Color color, sayfa, double size) {
  return Container(
    height: size,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(33),
      color: color,
    ),
    child: SizedBox(
      width: 140,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, animation, _) =>
                        sayfa,
                  opaque: false));
        },
        child: FittedBox(
          child: Text(isim,
              style: const TextStyle(fontSize: 18, color: Colors.white)),
        ),
      ),
    ),
  );
}


