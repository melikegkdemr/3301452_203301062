import 'package:flutter/material.dart';
import 'package:proje/datacontrol.dart';

class OkudugumKitaplar extends StatelessWidget {


  const OkudugumKitaplar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
  final double ekranGenisligi = ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Okuduğunuz Kitaplar"),
      ),
    body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: DataControl.kitaplar.length > 0 ? DataControl.kitaplar.map((e) =>
           SizedBox(
             width: ekranGenisligi,
             height: ekranYuksekligi/4,
             child: Card(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(e.kitapAdi, style: TextStyle(fontWeight: FontWeight.bold),),
                   Text(e.yazarAdi),
                   Text(e.kitap_icerigi),
                   ]
                 ),
      
             ),
           )).toList():liste(),
          
          ),
      ),
    ),
    
    );
  }



List<Widget> liste(){
  return [const Text("")];
}


}