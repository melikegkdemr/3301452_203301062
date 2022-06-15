import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proje/datacontrol.dart';
import 'package:proje/model/kitap_model.dart';


class KitapEkle extends StatelessWidget {
   KitapEkle({Key? key}) : super(key: key);
 GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
 FirebaseFirestore _firestore=FirebaseFirestore.instance;
 FirebaseAuth _auth=FirebaseAuth.instance;
 
 
  @override
  Widget build(BuildContext context) {
    String kitapAdi="";
    String yazarAdi="";
    String kitapIcerigi="";
    String kitapTuru="";


    return Scaffold(appBar: AppBar(),
    body: Form(
      key: formKey3,
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
              
              ElevatedButton(onPressed: ()  async{
                if(formKey3.currentState!.validate()){
                  KitapModel yeniKitap=KitapModel(kullaniciId: _auth.currentUser!.uid,kitapAd: kitapAdi, yazarAdi: yazarAdi,kitapTuru:  kitapTuru,kitapIcerik:  kitapIcerigi);
                   var ref = _firestore.collection("Kitaplar");

 await ref.add({
      'kullaniciId': yeniKitap.kullaniciId,
      'kitapAd': yeniKitap.kitapAd,
      'kitapIcerik': yeniKitap.kitapIcerik,
      'kitapTuru': yeniKitap.kitapTuru,
      'yazarAdi': yeniKitap.yazarAdi
    });
    Navigator.pop(context);
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