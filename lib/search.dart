
import 'package:flutter/material.dart';
import 'package:proje/search_api.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String aramaKelimesi = "";
  var scaffoldKey = GlobalKey<ScaffoldState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              Text("Aramak İçin Kelime Giriniz", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              
              Padding(
                
                padding: const EdgeInsets.only(top: 50),
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(),
                  hintText: "Aranacak Kitabı Giriniz"),
                  onChanged: (aramaSonucu){
                    print("Arama Kelimesi : ${aramaSonucu}");
                    setState(() {
                      aramaKelimesi = aramaSonucu;
                    });
                  },
                ),
              ),
             
              ElevatedButton(
               onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => SearchApi(aramaKelimesi: aramaKelimesi)));
               },
               child: Text("Ara"),
              ),
              

            ],
          ),
        ),
      ),
    );
  }
}