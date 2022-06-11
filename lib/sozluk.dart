
import 'package:flutter/material.dart';
import 'package:proje/Kelimelerdao.dart';
import 'package:proje/Kelimeler.dart';


class kisi_ekle extends StatefulWidget {
  @override
  State<kisi_ekle> createState() => _kisi_ekleState();
}

String Kullaniciismi = "";
String cinsiyet = "";
String dogumTarihi = "";
String email = "";
String biyografi = "";

class _kisi_ekleState extends State<kisi_ekle> {
  var formKey = GlobalKey<FormState>();

  bool aramaYapiliyorMu = false;
  String aramaKelimesi = "";

  Future<List<Kelimeler>> tumKelimelerGoster() async {
    var kelimelerListesi = await Kelimelerdao().tumKelimeler();
    return kelimelerListesi;

  }

  Future<List<Kelimeler>> aramaYap(String aramaKelimesi) async {
    var kelimelerListesi = await Kelimelerdao().kelimeAra(aramaKelimesi);

    return kelimelerListesi;

  }

  @override
  Widget build(BuildContext cosntext) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
         TextField(
          decoration: InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonucu){
            print("Arama Sonucu : $aramaSonucu");
            setState(() {
              aramaKelimesi = aramaSonucu;
            });
          },
        )  
        : Text("Sözlük"),
        actions: [
          aramaYapiliyorMu ? 
          IconButton(
           icon: Icon(Icons.cancel),
           onPressed: (){
             setState(() {
               aramaYapiliyorMu = false;
               aramaKelimesi = "";
             });
           },
         )
          : IconButton(
           icon: Icon(Icons.search),
           onPressed: (){
             setState(() {
               aramaYapiliyorMu = true;
             });
           },
         )
        ],
      ),
      body: FutureBuilder <List<Kelimeler>> (
        future: aramaYapiliyorMu ? aramaYap(aramaKelimesi) : tumKelimelerGoster(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            var kelimelerListesi = snapshot.data;
            return ListView.builder(
              itemCount: kelimelerListesi!.length,
              itemBuilder: (context, indeks){
                var kelime = kelimelerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                  },
                  child: SizedBox(
                    height: 70,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(kelime.yabanci, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
                            Text("     "),
                            Text(kelime.turkce),
                          ],
                        ),
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
      ),
    );
  }
}
