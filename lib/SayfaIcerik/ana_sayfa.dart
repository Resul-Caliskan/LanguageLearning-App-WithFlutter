import 'package:flutter/material.dart';
import 'package:noron/Buttons/hizli_button.dart';
import 'package:noron/Buttons/listelerim_buttons.dart';
import 'package:noron/Pages/seviyeler.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key,required this.isim}) : super(key: key);
  final String isim;
  @override
  State<StatefulWidget> createState() => _AnaSayfa();
}

class _AnaSayfa extends State<AnaSayfa> {
  final Color renk = const Color.fromARGB(255, 89, 40, 229);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    
    return Column(
      //mainAxisAlignment:MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height / 40,
        ),
//KULLANICI SELAMLAMA
        Text(
          "Merhaba "+widget.isim +",",
          style: TextStyle(
            color: renk,
            fontSize: 18,
          ),
        ),
        Text(
          "Hadi Öğrenmeye Başlayalım,",
          style: TextStyle(
            color: renk,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: height / 30,
        ),
//MOTİVE EDİCİ
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Düşündüğünden",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Daha Kolay",
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
                        image: AssetImage("assets/brain.jpg"),
                        fit: BoxFit.fill,
                      ))
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: height / 60,
        ),
//HIZLI TEST
        SizedBox(
            height: height/20,
            width: width / 1.2,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const HizliButon());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.bolt_sharp,
                      color: Colors.yellow,
                      size: 35,
                    ),
                    Text(
                      "Hızlı Test",
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(
                      Icons.bolt_sharp,
                      color: Colors.yellow,
                      size: 35,
                    ),
                  ],
                ))),
        SizedBox(
          height: height / 60,
        ),
//LİSTELERİM
        SizedBox(
            height: height/20,
            width: width / 1.2,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const ListelerimButton());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.format_list_numbered_sharp,
                      color: Colors.white,
                      size: 35,
                    ),
                    Text(
                      "Listelerim",
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(
                      Icons.format_list_numbered_rtl,
                      color: Colors.white,
                      size: 35,
                    ),
                  ],
                ))),
        SizedBox(
          height: height / 30,
        ),
//BAŞLIKLAR
        Text(
          "Başlıklar",
          style: TextStyle(
            color: renk,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: height / 50,
        ),
        SizedBox(
          height: height / 4.8,
          width: width / 1.2,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              kart(
                context,
                "İSİMLER",
              ),
              kart(
                context,
                "FİİLLER",
              ),
              kart(
                context,
                "SIFATLAR",
              ),
              kart(
                context,
                "ZARFLAR",
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget kart(
  context,
  String isim,
) {
  return Card(
      shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side:const BorderSide(color: Colors.white)
          ),
      child: SizedBox(
          width: 125,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: <Color>[
                  Color.fromARGB(255, 89, 40, 229),
                  Color.fromARGB(255, 56, 149, 220)
                ],
                tileMode: TileMode.mirror,
              ),
            ),
            child: SizedBox(
              width: 125,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Seviyeler(isim,)));
                },
                child: Text(isim,
                    style: const TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          )));
}
