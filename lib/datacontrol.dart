import 'package:proje/model/kitap_model.dart';
import 'package:proje/model/kisi_model.dart';

class DataControl{

static List<KitapModel> kitaplar=[];
static List<kisiModel> kisiler = [];


static kitapEkle(KitapModel eklenecekKitab){
kitaplar.add(eklenecekKitab);
}

static kisiEkle(kisiModel eklenecekKisi){
kisiler.add(eklenecekKisi);
}


}