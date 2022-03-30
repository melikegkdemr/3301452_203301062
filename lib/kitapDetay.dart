import 'package:flutter/material.dart';
import 'package:proje/kitaplar.dart';

class kitapDetay extends StatefulWidget {
  Kitaplar kitap;

  kitapDetay({required this.kitap});

  @override
  State<kitapDetay> createState() => _kitapDetayState();
}

class _kitapDetayState extends State<kitapDetay> {
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("resimler/${widget.kitap.kitapResimAdi}"),
                Text(
                  "${widget.kitap.kitapAdi}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Yazar: ${widget.kitap.yazarAdi}", ),
                        Text("Sayfa Sayısı: ${widget.kitap.sayfaSayisi}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Türü: ${widget.kitap.kitapTuru}"),
                        Text("Hamur Tipi: "),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Basım Yılı: ${widget.kitap.basim_yili}"),
                        Text("Ebat: ${widget.kitap.ebat}"),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "${widget.kitap.kitap_icerigi}",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ));
  }
}