import 'package:flutter/material.dart';
import 'package:noron/Pages/gruplar.dart';
import 'package:noron/Pages/kullanici.dart';
import 'package:noron/sayfaIcerik/ana_sayfa.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.isim}) : super(key: key);
  final String isim;
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  int _selectedIndex = 0;
  // ignore: prefer_final_fields
  late List<Widget> _widgetOptions;
  @override
  void initState() {
    _widgetOptions = <Widget>[
      AnaSayfa(
        isim: widget.isim,
      ),     
      const Gruplar(),
      Kullanici(isim: widget.isim),
    ];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
        backgroundColor: const Color.fromARGB(255, 89, 40, 229),
        title:
            const Text("NÖRON", style: TextStyle(fontStyle: FontStyle.italic)),
      ),
      // Center üzerinden gerekli sayfalara erişim
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      //altbuton inin gelekli kodlar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.sort_by_alpha_sharp),
              label: "Gruplanmış Kelimeler"),
          BottomNavigationBarItem(
            icon: Icon(Icons.safety_divider),
            label: 'İstatistikler',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: _selectedIndex == 0
            ? Colors.blue[700]
            : _selectedIndex == 1
                ? Colors.green
                : Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
