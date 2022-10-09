class Seviye {
  Seviye(this.bolum, this.seviye, this.deste);
  String? bolum;
  int? seviye;
  String? deste;
// veri gönderirken Map formatında göndermemiz gerekir
  Map<String, dynamic> toMap() {
    // ignore: prefer_collection_literals
    var map = Map<String, dynamic>();
    map["bolum"] = bolum;
    map["seviye"] = seviye;
    map["deste"] = deste;
    return map;
  }

//database den veri getiriken map gibi getirdiğinden onu objeye çevirip oradan kelime sınıfı verilerine dönüştürücez
  Seviye.fromObject(dynamic o) {
    bolum = o["bolum"];
    seviye = o["seviye"];
    deste = o["deste"];
  }
}
