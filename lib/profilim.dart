import 'package:flutter/material.dart';
import 'package:proje/datacontrol.dart';
import 'package:proje/kisi_ekle.dart';
import 'package:proje/kisi_model.dart';

class profilim extends StatelessWidget {
  const profilim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: DataControl.kisiler.length > 0
              ? DataControl.kisiler
                  .map((e) => SizedBox(
                    
                    width: ekranGenisligi,
                    height: ekranYuksekligi/2 ,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 200,
                              child: Image.asset("resimler/okur.png")),
                              Spacer(),
                            Text(e.Kullaniciismi,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text("E-mail: ${e.email}"),
                            Text("Cinsiyet: ${e.cinsiyet}"),
                            Text("Doğum Tarihi: ${e.dogumTarihi}"),
                            Text("Mini Biyografi: ${e.biyografi}"),
                            Spacer(),
                          ]),
                    ),
                  ))
                  .toList()
              : bosliste(),
        ),
      ),
    );
  }

  List<Widget> bosliste() {
    return [const Text("")];
  }
}
