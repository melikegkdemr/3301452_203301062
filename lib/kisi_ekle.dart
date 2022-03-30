import 'package:flutter/material.dart';
import 'package:proje/datacontrol.dart';
import 'package:proje/profilim.dart';
import 'kisi_model.dart';

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

  @override
  Widget build(BuildContext cosntext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration:
                            InputDecoration(hintText: "Adınız ve Soyadınız"),
                        onChanged: (value) {
                          Kullaniciismi = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(hintText: "Cinsiyetiniz"),
                        onChanged: (value) {
                          cinsiyet = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration:
                            InputDecoration(hintText: "Doğum Tarihiniz"),
                        onChanged: (value) {
                          dogumTarihi = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(hintText: "E-mail"),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) {
                          biyografi = value;
                        },
                        decoration:
                            InputDecoration(hintText: "Mini Biyografiniz"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(

                        child: Text("Ekle"),
                        onPressed: () {

                          bool kontrolSonucu = formKey.currentState!.validate();
                          if (kontrolSonucu) {
                            kisiModel yeniKisi = kisiModel(Kullaniciismi, cinsiyet, dogumTarihi, email, biyografi);
                            DataControl.kisiEkle(yeniKisi);
                            print(DataControl.kitaplar);
                          };
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => profilim() )));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
