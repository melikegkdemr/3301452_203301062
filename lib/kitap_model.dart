class KitapModel {
  String kitapAdi;
  String yazarAdi;
  String kitapTuru;
  String kitap_icerigi;

KitapModel(this.kitapAdi,this.yazarAdi,this.kitapTuru,this.kitap_icerigi);

@override
  String toString() {
    // TODO: implement toString
    return this.kitapAdi+" "+this.kitapTuru;
  }
  
}
