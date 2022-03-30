import 'package:flutter/material.dart';
import 'package:sayfalar_arasi_veri/kisiler.dart';

import 'SayfaA.dart';

void main() {
  runApp(const Anasayfa());
}

class Anasayfa extends StatelessWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Sayfa A'ya git"),
              onPressed: (){
                var kisi  = Kisiler(isim: "Melike", yas: 20, boy: 1.58, bekarMi: true);
                Navigator.push(context, MaterialPageRoute(builder:  (context) => SayfaA(kisi: kisi)));  
              },
            )
          ],
        ),
      ),
     
    );
  }
}
