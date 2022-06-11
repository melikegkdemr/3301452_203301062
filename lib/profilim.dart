import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class gununSozu extends StatefulWidget {
  @override
  State<gununSozu> createState() => _gununSozuState();
}

class _gununSozuState extends State<gununSozu> {
  var tfGirdi = TextEditingController();
  String mesaj="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfGirdi,
                decoration: InputDecoration(hintText: "Günün Sözünü Giriniz"),
              ),
            ),
            ElevatedButton(
              child: Text("Yaz"),
              onPressed: () {
                veriYaz();
              },
            ),
           // veriOku().then((value)=>Text(value));
           
            Text(mesaj),
            ElevatedButton(
              child: Text("Gör"),
              onPressed: () {
                setState(() {
                  
                });
                veriOku().then((value) => mesaj=value);
              },
            )
          ],
        ));
  }

   _oku()async{
    var data= await veriOku();
  return data;
  }

 Future<String> veriOku() async {
    String okunanVeri = "";

    try {
      var ad = await getApplicationDocumentsDirectory();

      var uygulamaDosyalamaYolu = await ad.path;

      var dosya = File("$uygulamaDosyalamaYolu/dosyam.txt");

       okunanVeri = await dosya.readAsString();


    } catch (e) {
      e.toString();
    }

    return okunanVeri;

  }

  Future<void> veriYaz() async {
    var ad = await getApplicationDocumentsDirectory();

    var uygulamaDosyalamaYolu = await ad.path;

    var dosya = File("$uygulamaDosyalamaYolu/dosyam.txt");

    dosya.writeAsString(tfGirdi.text);

    tfGirdi.text = "";
  }
}
