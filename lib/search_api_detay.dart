import 'package:flutter/material.dart';
import 'Kitap.dart';


class KitapDetaySayfa extends StatelessWidget {
  final Kitap kitap;
  KitapDetaySayfa(this.kitap);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(kitap.title)),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BookDetails(kitap),
      ),
    );
  }
}

class BookDetails extends StatelessWidget {
  final Kitap kitap;
  BookDetails(this.kitap);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Image.network(book.thumbnailUrl),
          SizedBox(height: 10.0),
          Text(kitap.title),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(kitap.author,
                style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}