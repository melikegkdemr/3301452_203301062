import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proje/model/kitap_model.dart';

class KitapListe extends StatefulWidget {
  const KitapListe({Key? key}) : super(key: key);

  @override
  State<KitapListe> createState() => _KitapListeState();
}

class _KitapListeState extends State<KitapListe> {
  late FirebaseFirestore _services;
  late FirebaseAuth _auth;

  @override
  void initState() {
    super.initState();
    _services = FirebaseFirestore.instance;
    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Okuduğum Kitaplar"),
        leading: const Icon(Icons.bookmarks_outlined),
      ),
      body: StreamBuilder(
        stream: kitapGetir(_auth.currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.size,
                  itemBuilder: (BuildContext context, int index) {
                    var kitap = snapshot.data!.docs[index];

                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.menu_book),
                            focusColor: Colors.pink,
                            title: Text(
                              kitap["kitapAd"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(kitap["yazarAdi"]),
                           // isThreeLine: true,
                            

                          ),
                        ],
                      ),
                    );
                  })
              : const CircularProgressIndicator();
        },
      ),
    );
  }

  Stream<QuerySnapshot> kitapGetir(String kulId) {
    var docm = _services
        .collection("Kitaplar")
        .where("kullaniciId", isEqualTo: kulId)
        .snapshots();
    return docm;
  }
}
