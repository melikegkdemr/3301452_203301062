import 'package:flutter/material.dart';
import 'package:proje/Yazarlar.dart';
import 'package:proje/kitap_ekle.dart';
import 'package:proje/kitaplar%C4%B1m.dart';
import 'package:proje/login_page.dart';
import 'package:proje/okudugum_kitaplar.dart';
import 'package:proje/kisi_ekle.dart';
import 'package:proje/profilim.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

var secenekler = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2/3,
        children: [
          
          GestureDetector(
            onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => profilim()));
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person,),
                  Text("Profilim"),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => kisi_ekle()));
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.group_add_sharp),
                  Text("Kullanıcı Ekle"),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              
              Navigator.push(context, MaterialPageRoute(builder: ((context) => OkudugumKitaplar())));
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.book_rounded),
                  Text("Okuduğum Kitaplar"),
                ],
              ),
            ),
          ),
          
           GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => KitapEkle()));
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.blueGrey,),
                  Text("Kitap Ekle"),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => Yazarlar())));
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark_remove),
                  Text("Yazarlar"),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => Kitaplarim()));
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.book),
                  Text("Tavsiye Kitaplar"),
                ],
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}
