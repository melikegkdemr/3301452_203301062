import 'package:flutter/material.dart';
import 'package:proje/kitaplar.dart';

class DetaySayfa extends StatefulWidget {
  Kitaplar kitap;

  DetaySayfa({required this.kitap});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.kitap.kitapAdi),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.kitap.kitapResimAdi}"),
            Text(widget.kitap.yazar_ad, style: TextStyle(fontSize: 30),)

          ],
        ),
      ),
    );
  }
}