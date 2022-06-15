import 'package:cloud_firestore/cloud_firestore.dart';

class KitapModel {
  final String? id;
  final String? kullaniciId;
  final String? kitapAd;
  final String? kitapIcerik;
  final String? kitapTuru;
  final String? yazarAdi;

  KitapModel(
      {this.id,
      this.kullaniciId,
      this.kitapAd,
      this.kitapIcerik,
      this.kitapTuru,
      this.yazarAdi});

  factory KitapModel.fromSnapShot(DocumentSnapshot snapshot) {
    return KitapModel(
        id: snapshot.id,
        kullaniciId: snapshot["kullaniciId"],
        kitapAd: snapshot["kitapAd"],
        kitapIcerik: snapshot["kitapIcerik"],
        kitapTuru: snapshot["kitapTuru"],
        yazarAdi: snapshot["yazarAdi"]);
  }
}