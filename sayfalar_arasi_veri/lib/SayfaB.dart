import 'package:flutter/material.dart';

class SayfaB extends StatefulWidget {
  SayfaB({Key? key}) : super(key: key);

  @override
  State<SayfaB> createState() => _SayfaBState();
}

class _SayfaBState extends State<SayfaB> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                print(
                  "melike"
                )  ;
              },
            )
          ],
        ),
      ),
     
    );
  }
}