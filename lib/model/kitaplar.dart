import 'package:proje/model/Kategori_model.dart';

class Kitaplar {
  String kitap_id;
  String kitapAdi;
  String yazar_ad;
  String kitapResimAdi;
  String kategori_ad;

  Kitaplar(this.kitap_id, this.kitapAdi, this.yazar_ad, this.kitapResimAdi, this.kategori_ad);

  factory Kitaplar.fromJson(String key, Map<dynamic,dynamic> json){
    return Kitaplar(key,
    json["kitapAdi"] as String,
    json["yazar_ad"] as String,
    json["kitapResimAdi"] as String,
    json["kategori_ad"] as String, );
  }
}
