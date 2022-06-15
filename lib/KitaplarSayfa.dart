import 'package:flutter/material.dart';
import 'package:proje/DetaySayfa.dart';
import 'package:proje/model/Kategori_model.dart';
import 'package:proje/model/kitaplar.dart';
import 'package:firebase_database/firebase_database.dart';

import 'model/Kategori_model.dart';

class KitaplarSayfa extends StatefulWidget {

  Kategoriler kategori;

  KitaplarSayfa({required this.kategori});

  @override
  State<KitaplarSayfa> createState() => _KitaplarSayfaState();
}

class _KitaplarSayfaState extends State<KitaplarSayfa> {

  var refKitaplar = FirebaseDatabase.instance.ref().child("kitaplar");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" ${widget.kategori.kategori_ad} "),
      ),
      body: StreamBuilder<DatabaseEvent>(
          stream: refKitaplar.orderByChild("kategori_ad").equalTo(widget.kategori.kategori_ad).onValue,
          builder: (context, event) {
            if (event.hasData) {
              var kitaplarListesi = <Kitaplar>[];
              var gelenDegerler = event.data!.snapshot.value as dynamic;
              if (gelenDegerler != null) {
                gelenDegerler.forEach((key,nesne){
                  var gelenKitap = Kitaplar.fromJson(key, nesne);
                  kitaplarListesi.add(gelenKitap);
                });
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.5,
                ),
                itemCount: kitaplarListesi.length,
                itemBuilder: (context, index) {
                  var kitap = kitaplarListesi[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => DetaySayfa(kitap: kitap,)));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("resimler/${kitap.kitapResimAdi}"),
                          ),
                          Text(kitap.kitapAdi, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
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
        )
    );
  }
}