class Kitaplar {
  int kitap_id;
  String kitapAdi;
  String yazarAdi;
  int sayfaSayisi;
  String kitapResimAdi;
  double kitapFiyat;
  String kitapTuru;
  String kitap_icerigi;
  int basim_yili = 0;
  String ebat;

  Kitaplar(
      {required this.kitap_id,
      required this.kitapAdi,
      required this.kitapFiyat,
      required this.kitapResimAdi,
      required this.kitapTuru,
      required this.sayfaSayisi,
      required this.yazarAdi,
      required this.kitap_icerigi,
      required this.basim_yili,
      required this.ebat});
}
