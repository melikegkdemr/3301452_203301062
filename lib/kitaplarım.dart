import 'package:flutter/material.dart';
import 'package:proje/kitapDetay.dart';
import 'package:proje/kitaplar.dart';

class Kitaplarim extends StatefulWidget {
  Kitaplarim({Key? key}) : super(key: key);

  @override
  State<Kitaplarim> createState() => _KitaplarimState();
}

class _KitaplarimState extends State<Kitaplarim> {
  Future<List<Kitaplar>> kitaplariGetir() async {
    var kitapListesi = <Kitaplar>[];

    var kitap1 = Kitaplar(
        kitap_id: 1,
        kitapAdi: "Martin Eden",
        kitapFiyat: 50.0,
        kitapResimAdi: "kitap1.jpg",
        kitapTuru: "Amerikan Edebiyatı",
        sayfaSayisi: 500,
        yazarAdi: "Jack London",
        kitap_icerigi: "Jack London’ın yarı otobiyografik romanı Martin Eden, 20. yüzyıl başında sosyal ve ideolojik meseleler ağırlıklı içeriğiyle Amerikan edebiyatında büyük ölçüde kabul görmüştür. London farklı sınıflar arasındaki zihniyet ve değer farklarını gözlerimizin önüne sererken, statü ve servetin Amerikan toplumundaki hayati önemine işaret eder. Romanın ana temalarından biri, başarı ve refah yolunun sosyal sınıf farkı gözetilmeksizin herkese açık olduğu şeklinde özetlenebilecek Amerikan Rüyası’dır. ",
        basim_yili: 2,
        ebat: "28x50");
        
    var kitap2 = Kitaplar(
        kitap_id: 2,
        kitapAdi: "Fareler ve İnsanlar",
        kitapFiyat: 20.20,
        kitapResimAdi: "kitap2.jpg",
        kitapTuru: "Dünya Klasikleri",
        sayfaSayisi: 111,
        yazarAdi: "John Steinbeck",
        kitap_icerigi: "Fareler ve İnsanlar, birbirine zıt karakterdeki iki mevsimlik tarım işçisinin, zeki George Milton ve onun güçlü kuvvetli ama akli dengesi bozuk yoldaşı Lennie Small’un öyküsünü anlatır. Küçük bir toprak satın alıp insanca bir hayat yaşamanın hayalini kuran bu ikilinin öyküsünde dostluk ve dayanışma duygusu önemli bir yer tutar. Steinbeck insanın insanla ilişkisini anlatmakla kalmaz insanın doğayla ve toplumla kurduğu ilişkileri de konu eder bu destansı romanında. ",
        basim_yili: 2,
        ebat: "28x50");

    var kitap3 = Kitaplar(
        kitap_id: 3,
        kitapAdi: "Şeker Portakalı",
        kitapFiyat: 29.25,
        kitapResimAdi: "kitap3.jpg",
        kitapTuru: "Dünya Roman",
        sayfaSayisi: 200,
        yazarAdi: "Jose Mauro De Vasconcelos",
        kitap_icerigi: "Yazarlıkta karar kılıncaya kadar, muz plantasyonlarında hamallıktan gece kulüplerinde garsonluğa kadar çeşitli işlerde çalışan Jose Mauro de Vasconcelos’un başyapıtı Şeker Portakalı, *günün birinde acıyı keşfeden küçük bir çocuğun öyküsü*dür. Çok yoksul bir ailenin oğlu olarak dünyaya gelen, dokuz yaşında yüzme öğrenirken bir gün yüzme şampiyonu olmanın hayalini kuran Vasconcelos’un çocukluğundan derin izler taşıyan küçük zeze'yi anlatır.",
        basim_yili: 2,
        ebat: "28x50");
    var kitap4 = Kitaplar(
        kitap_id: 4,
        kitapAdi: "İnsan Geleceğini Nasıl Kurar?",
        kitapFiyat: 36.55,
        kitapResimAdi: "kitap4.jpg",
        kitapTuru: "Kişisel Gelişim",
        sayfaSayisi: 288,
        yazarAdi: "İlber Ortaylı",
        kitap_icerigi: "“Bir hedef bulacaksınız, o uğurda çalışacaksınız, hedefinizi gerçekleştirmek için bir yol arayacaksınız, yol yoksa da o yolu yapacaksınız. Bir defa geçtiğiniz yoldan da bir daha geri dönmeyeceksiniz. Çünkü lüzumsuz geri dönüş başarısızlıktır, tekrara düşmektir, ufku kapatmaktır. Hedef bulmak, yol açmak ve aynı yoldan geri dönmemek… Hayattaki gayemiz budur.” ",
        basim_yili: 2,
        ebat: "28x50");
    var kitap5 = Kitaplar(
        kitap_id: 5,
        kitapAdi: "Körlük",
        kitapFiyat: 29.25,
        kitapResimAdi: "kitap5.jpg",
        kitapTuru: "Dünya Roman",
        sayfaSayisi: 200,
        yazarAdi: "Jose Saramago",
        kitap_icerigi: "Usta yazarın belki de en etkileyici yapıtı olan, sinemaya da uyarlanmış Körlük, toplumsal yaşamın nasıl bir vahşete dönüşebileceğini müthiş bir incelikle gözler önüne sererken, insana dair son umut kırıntısını da bir kadının tek başına örgütlediği dayanışma ve direniş örneğiyle sergileyen unutulmaz eserler arasında yerini almıştır. ",
        basim_yili: 2,
        ebat: "28x50");
    var kitap6 = Kitaplar(
        kitap_id: 6,
        kitapAdi: "Kürk Mantolu Madonna",
        kitapFiyat: 4.95,
        kitapResimAdi: "kitap6.jpg",
        kitapTuru: "Türkiye Roman",
        sayfaSayisi: 160,
        yazarAdi: "Sabahattin Ali",
        kitap_icerigi: "1940-1941 yılları arasında tefrika halinde yayımlanan Kürk Mantolu Madonna, Raif Efendi ile Maria Puder aşkını anlatıyor. Sıradan bir memur gibi görünen Raif Efendi’nin çekmecenin dibine gizlediği bir defterle tekrar canlanan hatıraları, Almanya’da yaşadığı müthiş bir aşkı açığa çıkarır. Bir sanat galerisinde gördüğü resimle başlayan aşkı, umutsuzluk ve imkânsızlık arasında sıkışıp kalan gencin tek sığınağı olur.",
        basim_yili: 2,
        ebat: "28x50");

    kitapListesi.add(kitap1);
    kitapListesi.add(kitap2);
    kitapListesi.add(kitap3);
    kitapListesi.add(kitap4);
    kitapListesi.add(kitap5);
    kitapListesi.add(kitap6);

    return kitapListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: FutureBuilder<List<Kitaplar>>(
          future: kitaplariGetir(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var kitapListesi = snapshot.data;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.5,
                ),
                itemCount: kitapListesi!.length,
                itemBuilder: (context, index) {
                  var kitap = kitapListesi[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  kitapDetay(kitap: kitapListesi[index])));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child:
                                Image.asset("resimler/${kitap.kitapResimAdi}"),
                          ),
                          Text(
                            "${kitap.kitapAdi}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${kitap.kitapFiyat} \u{20BA}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center();
            }
          },
        ));
  }
}
