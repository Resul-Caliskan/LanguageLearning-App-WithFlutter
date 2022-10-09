import 'package:flutter/material.dart';

class Gruplar extends StatelessWidget {
  const Gruplar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        kart("Eşyalar Ve Aksesuarlar",context),
        kart("Renkler",context),
        kart("İletişim Ve Teknoloji",context),
        kart("Eğitim",context),
        kart("Eğlence Ve Medya",context),
        kart("Çevre",context),
        kart("Yiyecekler Ve İçecekler",context),
        kart("Sağlık,İlaç Ve Egzersiz",context),
        kart("Hobiler",context),
        kart("Ev",context),
        kart("Dil",context),
        kart("Hisler ve Düşünceler",context),
        kart("Binalar",context),
        kart("Coğrafi Terimler",context),
        kart("Şehir",context),
        kart("Servisler",context),
        kart("Alış-Veriş",context),
        kart("Spor",context),
        kart("Doğa",context),
        kart("Zaman",context),
        kart("Seyahat Ve Ulaşım Araçları",context),
        kart("Hava Durumu",context),
        kart("Meslekler ile İlgili",context),
      ],
    );
  }
}

Widget kart(String isim,BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color.fromARGB(255, 89, 40, 229)),
        borderRadius: BorderRadius.circular(18)),
    child:SizedBox (
      width: MediaQuery.of(context).size.width/4,
      child: TextButton(
        onPressed: () {},
        child: Text(
          isim,
          style: const TextStyle(color: Colors.amber, fontSize: 20),
        ),
      ),
    ),
  );
}
