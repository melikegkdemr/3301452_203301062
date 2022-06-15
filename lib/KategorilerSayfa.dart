import 'package:flutter/material.dart';
import 'package:proje/model/Kategori_model.dart';
import 'package:proje/KitaplarSayfa.dart';
import 'package:firebase_database/firebase_database.dart';

class KategorilerSayfa extends StatefulWidget {
  @override
  State<KategorilerSayfa> createState() => _KategorilerSayfaState();
}

class _KategorilerSayfaState extends State<KategorilerSayfa> {

  var refKategoriler = FirebaseDatabase.instance.ref().child("kategoriler");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Kategoriler"),
        ),
        body: StreamBuilder<DatabaseEvent>(
          stream: refKategoriler.onValue,
          builder: (context, event) {
            if (event.hasData) {
              var kategoriListesi = <Kategoriler>[];
              var gelenDegerler = event.data!.snapshot.value as dynamic;
              if (gelenDegerler != null) {
                gelenDegerler.forEach((key,nesne){
                  var gelenKategori = Kategoriler.fromJson(key, nesne);
                  kategoriListesi.add(gelenKategori);
                });
              }
              return ListView.builder(
                itemCount: kategoriListesi.length,
                itemBuilder: (context, index) {
                  var kategori = kategoriListesi[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KitaplarSayfa(
                                    kategori: kategori,
                                  )));
                    },
                    child: Card(
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(kategori.kategori_ad),
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
