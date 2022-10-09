import 'package:flutter/material.dart';
import 'package:noron/Pages/Egitim/kalip_kartlari.dart';

class Kaliplar extends StatelessWidget {
  const Kaliplar({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [buton(context, "1"),buton(context, "2"),buton(context, "3")],
          ),Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [buton(context, "4"),buton(context, "5"),buton(context, "6")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [buton(context, "7"),buton(context, "8"),buton(context, "9")],
          ),
          buton(context, "10")
        ],
      ),
    );
  }
}
Widget buton(context , String numara){
 return SizedBox(
    height: MediaQuery.of(context).size.height / 8,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.blue[50],
          onPrimary: const Color.fromARGB(255, 89, 40, 229),
          shadowColor: Colors.purple,
          onSurface: Colors.red,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  topLeft: Radius.circular(50)),
              side: BorderSide(color: Color.fromARGB(255, 89, 40, 229)))),
      //Burası değişken olacak tamamlananlar yeşil yanacak
      onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) =>const KalipKartlari(),));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            numara + ". Deste ",
            style: const TextStyle(
                color: Color.fromARGB(255, 89, 40, 229), fontSize: 15),
          ),
        ],
      ),
    ),
  );  
}