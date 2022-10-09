import 'package:flutter/material.dart';
import 'package:noron/Pages/Egitim/kelime_kartlari.dart';
import 'package:noron/Pages/testler.dart';

class IkiliSekme extends StatefulWidget {
  const IkiliSekme({Key? key,required this.bolum,required this.seviye}) : super(key: key);
 final String bolum;
 final int seviye;

  @override
  State<StatefulWidget> createState() => _IkiliSekme();
}

class _IkiliSekme extends State<IkiliSekme> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 89, 40, 229),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              TabBar(
                indicatorColor: Colors.amber,
                labelColor: Colors.amber,
                unselectedLabelColor: Colors.white,
                labelStyle: TextStyle(fontSize: 15),
                tabs: [
                  Tab(
                    text: 'Kelime Kartları',
                  ),
                  Tab(
                    text: 'Testler',
                  ),
                ],
              )
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            KelimeKartlari(bolum:widget.bolum ,seviye: widget.seviye,),
            Testler(bolum: widget.bolum,seviye: widget.seviye,),
          ],
        ),
      ),
    );
  }
}
