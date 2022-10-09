class Kelime{
  Kelime(this.bolumadi,this.bolum,this.sira);
   int? bolum;
   String? bolumadi;
   int? sira;
// veri gönderirken Map formatında göndermemiz gerekir
  Map<String,dynamic> toMap(){
    // ignore: prefer_collection_literals
    var map= Map<String,dynamic>();
    map["bolum"]=bolum;
    map["bolumadi"]=bolumadi;
    map["sira"]=sira;
    return map;

  }
//database den veri getiriken map gibi getirdiğinden onu objeye çevirip oradan kelime sınıfı verilerine dönüştürücez 
  Kelime.fromObject(dynamic o){
    bolum=o["bolum"];
    bolumadi=o["bolumadi"];
    sira=o["sira"];
   
  }
}