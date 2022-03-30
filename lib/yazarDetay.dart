import 'package:flutter/material.dart';
import 'package:proje/Yazarlar.dart';
import 'package:proje/yazar.dart';

class yazarDetay extends StatefulWidget {
  yazar yazarKisi;

  yazarDetay({required this.yazarKisi});

  @override
  State<yazarDetay> createState() => _yazarDetayState();
}

class _yazarDetayState extends State<yazarDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("resimler/${widget.yazarKisi.yazar_fotograf}"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${widget.yazarKisi.yazar_adi}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                 Text("${widget.yazarKisi.yazar_icerik}",style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
        ));
  }
}