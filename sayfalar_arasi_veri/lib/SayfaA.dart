import 'package:flutter/material.dart';
import 'SayfaB.dart';
import 'kisiler.dart';

class SayfaA extends StatefulWidget {
  Kisiler kisi;

  SayfaA({required this.kisi});

  @override
  State<SayfaA> createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayfa A"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Sayfa B'ye git"),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SayfaB()));
              },
            ),
            Text("İsim: ${widget.kisi.isim}"),
            Text("Yaş: ${widget.kisi.yas}"),
            Text("Boy: ${widget.kisi.boy}"),
            Text("Bekar Mı?: ${widget.kisi.bekarMi}"),
          ],
        ),
      ),
    );
  }
}
