import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:proje/search_api_detay.dart';
import 'Kitap.dart';

class SearchApi extends StatefulWidget {
  String aramaKelimesi;

  SearchApi({required this.aramaKelimesi});

  @override
  State<SearchApi> createState() => _SearchApiState();
}

class _SearchApiState extends State<SearchApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bulunan Sonuçlar"),
        leading: Icon(Icons.book),
      ),
      body: FutureBuilder(
        future: _kitaplariGetir('${widget.aramaKelimesi}'),
        builder: (context, AsyncSnapshot<List<Kitap>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error : ${snapshot.error}'));
            } else {
              return ListView(
                  children:
                      snapshot.data!.map((k) => KitaplariListele(k)).toList());
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class KitaplariListele extends StatelessWidget {
  final Kitap kitap;
  KitaplariListele(this.kitap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => KitapDetaySayfa(kitap),
        ));
      },
      child: ListTile(
        title: Text(kitap.title),
        subtitle: Text(kitap.author),
      ),
    );
  }
}

List<Kitap> _fetchBooks() {
  return List.generate(
      100,
      (i) => Kitap(
            title: 'Kitap $i',
            author: 'Yazar $i',
          ));
}

Future<List<Kitap>> _kitaplariGetir(String kelime) async {
  var url = Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$kelime');

  final res = await http.get(url);
  if (res.statusCode == 200) {
    return _parseBookJson(res.body);
  } else {
    throw Exception('Error: ${res.statusCode}');
  }
}

List<Kitap> _parseBookJson(String jsonStr) {
  try {
    final jsonMap = json.decode(jsonStr);
  final jsonList = (jsonMap['items'] as List);
  return jsonList
      .map((jsonBook) => Kitap(
            title: jsonBook['volumeInfo']['title'],
            author: (jsonBook['volumeInfo']['authors'] as List).join(', '),
          ))
      .toList();
  } 
  catch (e) {
    print("Hata! : $e");    
  }

  return [];
}
