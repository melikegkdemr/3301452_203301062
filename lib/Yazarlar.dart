import 'package:flutter/material.dart';
import 'package:proje/yazar.dart';
import 'package:proje/yazarDetay.dart';

class Yazarlar extends StatefulWidget {
  Yazarlar({Key? key}) : super(key: key);

  @override
  State<Yazarlar> createState() => _YazarlarState();
}

class _YazarlarState extends State<Yazarlar> {
  Future<List<yazar>> yazariGetir() async {
    var yazarListesi = <yazar>[];
  
    var yazar1 = yazar(
        yazar_adi: "Jack London",
        yazar_fotograf: "jack_london2.jpg",
        yazar_icerik: "(1876- 1916), ABD'li roman yazarı. 1876 yılında San Fransisco'da doğdu, 22 Kasım 1916 da böbrek yetmezliğinden öldü. Çocukluğu yoksulluk içinde geçti. 14 yaşında okulunu bırakarak hayata atıldı. Türlü işlere girip çıktı, Amerika içinde ve dışında uzun, maceralı yolculuklar yaptı, hapis yattı. Giderek militan bir sosyalist oldu. İlk kitabı 'Kurt Dölü' 1900 yılında yayınlandı. London, 17 yılda kıpır kıpır hayat ve düşünce kaynayan (Anatole France) elli ciltlik dev bir eser vermiştir. Eserlerinde yaşam kavgasını romantik bir bakışla anlatır, çoğu eserinde sert bir kapitalizm eleştirisi göze çarpar. Kitapları yabancı dillere en çok çevrilmiş ABD'li yazarlardandır. 1897'de Klondike'a altın aramaya gidenlere katıldı ve Vahşetin Çağrısı dahil birçok kitabını bu tecrübesinden yararlanarak yazdı. İlk defa 1903 yılında The Saturday Evening Post'da yayınlanan ve Jack London'ı üne kavuşturan Vahşetin Çağrısı (The Call of the Wild) nefes nefese okuyacağınız bir dünya klasiğidir.");
    var yazar2 = yazar(
        yazar_adi: "Sabahattin Ali",
        yazar_fotograf: "sabahattin_ali.jpg",
        yazar_icerik: "(25 Şubat 1907, Eğridere - 2 Nisan 1948, Kırklareli), Türk yazar ve şair. Edebî kişiliğini toplumcu gerçekçi bir düzleme oturtarak yaşamındaki deneyimlerini okuyucusuna yansıttı ve kendisinden sonraki Cumhuriyet dönemi Türk edebiyatını etkileyen bir figür hâline geldi.  Daha çok öykü türünde eserler verse de romanlarıyla ön plana çıktı; romanlarında uzun tasvirlerle ele aldığı sevgi ve aşk temasını, zaman zaman siyasi tartışmalarına gönderme yapan anlatılarla zaman zaman da toplumsal aksaklıklara yönelttiği eleştirilerle destekledi. Kuyucaklı Yusuf (1937), İçimizdeki Şeytan (1940) ve Kürk Mantolu Madonna (1943) romanları Türkiye'deki edebiyat çevrelerinin takdirini toplayarak hem 20. yüzyılda hem 21. yüzyılda etkisini sürdürdü. Hayatının son yıllarında Türk milliyetçileriyle yaşadığı tartışmalarla da öne çıktı, özellikle Türkçü-Turancı yazar Nihal Atsız ile yaşadığı gerilim giderek artarak Irkçılık-Turancılık Davasının bir parçası oldu. ");
    var yazar3 = yazar(
        yazar_adi: "Jean Paul Sartre",
        yazar_fotograf: "jean_paul_sartre.jpg",
        yazar_icerik: " Jean-Paul Sartre (tam adı: Jean-Paul Charles Aymard Sartre) 21 Haziran 1905'te Fransa'da doğdu. 15 Nisan 1980'de yaşamını yitirdi. Babasını küçük yaşta kaybetti. Sarbonne Üniversitesi'nde Almanca profesörü olan dedesi tarafından yetiştirildi. Paris'te başladığı lise eğitimini Rochelle'de tamamladı. 1929'da yüksek öğretmen okulundan mezun oldu. Öğrencilik yıllarında kız arkadaşı Simone de Beauvoir ile başlayan ilişkisi ömür boyu sürdü. 1931-1945 arasında Le Havre, Lion ve Paris'teki okullarda öğretmenlik yaptı. Berlin'de 2 yıl Alman fesefesini inceledi. 2'nci Dünya Savaşı'nda esir düştü. Komünizme yakınlık duydu. 1956'da Sovyetler Birliği, İskandinavya, Afrika, ABD ve Küba'yı gezdi. 1960'a kadar yazılarını ve düşüncesini komünizm ve Sovyetler'e ayırdı.1974 yılında Sartre'ın gözleri büyük oranda görmez oldu. Bu nedenle politik etkinlikleri yavaşladı.");

    yazarListesi.add(yazar1);
    yazarListesi.add(yazar2);
    yazarListesi.add(yazar3);

    return yazarListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: FutureBuilder<List<yazar>>(
          future: yazariGetir(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var yazarListesi = snapshot.data;
              return ListView.builder(
                itemCount: yazarListesi!.length,
                itemBuilder: (BuildContext context, int index) {
                  var yazar = yazarListesi[index];
                  return GestureDetector(
                    onTap: () {
                      print("");
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => yazarDetay(yazarKisi: yazarListesi[index])));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Image.asset("resimler/${yazar.yazar_fotograf}"),
                            Text("${yazar.yazar_adi}", style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
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
