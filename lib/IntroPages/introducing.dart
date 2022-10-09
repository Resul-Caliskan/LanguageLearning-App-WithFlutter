import 'package:flutter/material.dart';
import 'package:noron/Pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Introducing extends StatefulWidget {
  const Introducing({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Introducing();
}

class _Introducing extends State<Introducing> {
  final controller = PageController();
  final controllerTxt = TextEditingController();
  int pageCount = 0;
  bool lastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double yuksek = MediaQuery.of(context).size.height;
    double genis = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        //Tanıtım ekranında alt kısma gelecek butonlar için boşluk bıraktım
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => lastPage = index == 4);
            setState(() {
              pageCount = index;
            });
          },
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 89, 40, 229),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: yuksek / 9,
                  ),
                  const Text(
                    "NÖRON",
                    style: TextStyle(
                        color: Colors.white,
                        decorationColor: Colors.amber,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: yuksek / 9,
                      child:
                          const Image(image: AssetImage("assets/beyin.png"))),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Uygulamamıza Hoş Geldiniz",
                    style: TextStyle(
                        color: Colors.white,
                        decorationColor: Colors.amber,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const FittedBox(
                    child: Text(
                      "Uygulamamız İngilizce Kelime Öğrenme Uygulaması Olup ",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const FittedBox(
                    child: Text(
                      " Yaklaşık 3000 Kelime İçermektedir",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const FittedBox(
                    child: Text(
                      "Kelime Kartı Konseptinin Mobile ",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const FittedBox(
                    child: Text(
                      " Uygulanmış Hali Olan Uygulamamızı ",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const FittedBox(
                    child: Text(
                      " Tanımak İçin Sola Kaydırın",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: yuksek / 6,
                  ),
                  const Icon(
                    Icons.swipe_left,
                    size: 40,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 89, 40, 229),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: yuksek / 2,
                      width: genis,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Image(image: AssetImage("assets/anasayfa.png")),
                          Image(image: AssetImage("assets/listelerim.png"))
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const FittedBox(
                    child: Text(
                      " Hızlı Testler Ve Listelerim Kısmı İle ",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const FittedBox(
                    child: Text(
                      "Kelime Kartları Ve Testlerden Eklemiş",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const FittedBox(
                    child: Text(
                      "Olduğunuz Kelimeler İle Kendinizi Sınayın",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: yuksek / 9,
                  ),
                  const Icon(
                    Icons.swipe_left,
                    size: 40,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 89, 40, 229),
              ),
              child: Column(
                children: [
                  SizedBox(
                      height: yuksek / 2,
                      width: genis,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Image(image: AssetImage("assets/kelime.png")),
                          Image(image: AssetImage("assets/anlami.png")),
                        ],
                      )),
                  const FittedBox(
                    child: Text(
                      "Kelime Kartları Konseptine Uygun Olacak Şekilde ",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const FittedBox(
                    child: Text(
                      " Ön Yüzüne Kelimeyi Ve Okunuşunu Yazdık ",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const FittedBox(
                    child: Text(
                      "Kelimenin Üzerine Tıkladığınız Zaman ",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const FittedBox(
                    child: Text(
                      "Türkçesini Görebilirsiniz ",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const FittedBox(
                    child: Text(
                      "Listeme Ekle Butonu İle Kelimeyi Listeye Ekleyip",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const FittedBox(
                    child: Text(
                      "Ana Ekrandan Hızlı Bir Şekilde Kelimeye Ulaşabilirsiniz",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: yuksek / 13,
                  ),
                  const Icon(
                    Icons.swipe_left,
                    size: 40,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 89, 40, 229),
              ),
              child: Column(
                children: [
                  SizedBox(
                      height: yuksek / 2,
                      width: genis,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Image(image: AssetImage("assets/yazma.png")),
                          Image(image: AssetImage("assets/eslestirme.png")),
                        ],
                      )),
                  const FittedBox(
                    child: Text(
                      "Kelime Yazma Ve Eşleştirme Testleri",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const FittedBox(
                    child: Text(
                      "Öğrenmenin Temeli Tekrardır Kuralı Gereğince",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const FittedBox(
                    child: Text(
                      "Kelime İle Daha Çok Temasa Geçip",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const FittedBox(
                    child: Text(
                      "Yazılışını Ve Anlamını Ezberlemeyi Kolaylaştırdığını ",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const FittedBox(
                    child: Text(
                      "Düşünüyoruz",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(height:5,),
                  const FittedBox(
                    child: Text(
                      "Hatırlayamadığınız Kelimeyi Hatalarıma Ekle Butonuyla",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                  const FittedBox(
                    child: Text(
                      " Listelerinize Ekleyip Ana Sayfadan Görüntüleyebilirsiniz",
                      style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.amber,
                          fontSize: 18),
                    ),
                  ),
                   SizedBox(
                    height: yuksek / 17,
                  ),
                  const Icon(
                    Icons.swipe_left,
                    size: 40,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 89, 40, 229)),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    "NÖRON",
                    style: TextStyle(
                        color: Colors.white,
                        decorationColor: Colors.amber,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: yuksek / 8,
                      child:
                          const Image(image: AssetImage("assets/beyin.png"))),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    " Öğrenmeye Az Kaldı\n Son olarak Kullanıcı Adı Giriniz",
                    style: TextStyle(
                        color: Colors.white,
                        decorationColor: Colors.amber,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    controller: controllerTxt,
                    style: const TextStyle(
                        color: Colors.black, decorationColor: Colors.amber),
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                          color: Colors.black,
                          decorationColor: Colors.amber,
                          fontSize: 16),
                      hintStyle: TextStyle(
                          color: Colors.black,
                          decorationColor: Colors.amber,
                          fontSize: 14),
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                      hintText: 'isminiz...',
                      labelText: 'Kullanıcı Adı Giriniz ',
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                      return (value != null && value.contains('@'))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final intro = await SharedPreferences.getInstance();
                      intro.setBool("show", false);
                      final isim = await SharedPreferences.getInstance();
                      isim.setString("isim", controllerTxt.text);
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Home(isim: controllerTxt.text),
                          ));
                    },
                    child: const Text(
                      "Kaydet Ve Başla",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[50],
                        minimumSize: const Size(150, 50),
                        onPrimary: const Color.fromARGB(255, 89, 40, 229),
                        shadowColor: Colors.yellow,
                        onSurface: Colors.red,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            side: BorderSide(color: Colors.black, width: 1))),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      // Buton boşlukları
      bottomSheet: lastPage
          ? TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  primary: const Color.fromARGB(255, 89, 40, 229),
                  backgroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(80)),
              onPressed: () async {},
              child: const Text(
                "Hadi Öğrenelim",
                style: TextStyle(fontSize: 24),
              ))
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              height: 80,
              child: Row(
                // row daki elemanlar arası boşluk ayarı
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        if (controller.hasClients) {
                          controller.animateToPage(4,
                              duration: const Duration(microseconds: 400),
                              curve: Curves.easeInOut);
                        }
                      },
                      child: const Text("Atla")),
                  // nokta kısmı
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: pageCount == 0
                                ? const Color.fromARGB(255, 89, 40, 229)
                                : Colors.grey),
                      ),
                      Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: pageCount == 1
                                  ? const Color.fromARGB(255, 89, 40, 229)
                                  : Colors.grey)),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: pageCount == 2
                                ? const Color.fromARGB(255, 89, 40, 229)
                                : Colors.grey),
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: pageCount == 3
                                ? const Color.fromARGB(255, 89, 40, 229)
                                : Colors.grey),
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: pageCount == 4
                                ? const Color.fromARGB(255, 89, 40, 229)
                                : Colors.grey),
                      ),
                    ],
                  ),

                  TextButton(
                      onPressed: () {
                        if (controller.hasClients) {
                          setState(() {
                            pageCount += 1;
                          });
                          controller.animateToPage(pageCount,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut);
                        }
                      },
                      child: const Text("Sonraki"))
                ],
              ),
            ),
    );
  }
}
