import 'package:flutter/material.dart';
import 'package:proje/datacontrol.dart';
import 'package:proje/kitap_model.dart';


class KitapEkle extends StatelessWidget {
   KitapEkle({Key? key}) : super(key: key);
 GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String kitapAdi="";
    String yazarAdi="";
    String kitapIcerigi="";
    String kitapTuru="";


    return Scaffold(appBar: AppBar(),
    body: Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Kitap Adı"),
                validator: (value){
                  if(value!.length<2)
                  return "iki karakterden az girdiniz";
                },
                onChanged: (value) {
                  kitapAdi=value;
                },
              
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Yazar Adı"),
                validator: (value){
                  if(value!.length<2)
                  return "iki karakterden az girdiniz";
                },
                onChanged: (value) {
                  yazarAdi = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Kitap Türü"),
                onChanged: (value) {
                  kitapTuru = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Kitap İçeriği"),
                onChanged: (value) {
                  kitapIcerigi = value;
                },
              ),
              
              ElevatedButton(onPressed: () {
                if(formKey.currentState!.validate()){
                  KitapModel yeniKitap=KitapModel(kitapAdi, yazarAdi, kitapTuru, kitapIcerigi);
                  DataControl.kitapEkle(yeniKitap);
                  print(DataControl.kitaplar);

                }

              } ,
               child: Text("Ekle")
               )

            ],
          ),
        ),
      ),
    ),
    
    );
  }
}