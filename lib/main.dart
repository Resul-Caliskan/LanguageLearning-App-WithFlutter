import 'package:flutter/material.dart';
import 'package:noron/IntroPages/introducing.dart';
import 'package:noron/Pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
String isim ="";
//import 'IntroPages/introducing.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final intro=await SharedPreferences.getInstance();
  final show=intro.getBool("show") ?? true;
  final name= await  SharedPreferences.getInstance();
  final _isim=name.getString("isim") ?? "";
  isim=_isim;
  runApp( MaterialApp(
    home:show ?const Introducing():const KelimeDiyari(),
    debugShowCheckedModeBanner: false,
  ));
}

class KelimeDiyari extends StatelessWidget {
  const KelimeDiyari({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(isim: isim,),
    );
  }
}
