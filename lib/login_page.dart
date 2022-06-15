import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proje/main.dart';
import 'package:proje/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

String KullaniciAdi = "";
String Sifre = "";

var formKey = GlobalKey<FormState>();
var tfKullaniciAdi = TextEditingController();
var tfSifre = TextEditingController();
late FirebaseAuth _auth;

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController animasyonKontrol;
  late Animation<double> alphaAnimasyonDegerleri;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    _auth=FirebaseAuth.instance;
    animasyonKontrol =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    alphaAnimasyonDegerleri =
        Tween(begin: 0.0, end: 1.0).animate(animasyonKontrol)
          ..addListener(() {
            setState(() {});
          });
    animation = AlignmentTween(
            begin: const Alignment(1, 0), end: const Alignment(-1, 0))
        .animate(CurvedAnimation(
            parent: animasyonKontrol, curve: Curves.easeInOutExpo));

    animasyonKontrol.forward().orCancel;
    animasyonKontrol.repeat(reverse: true);
  }

  @override
  void dispose() {
    animasyonKontrol.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                  opacity: alphaAnimasyonDegerleri.value,
                  child: Image.asset("resimler/anasayfaBook.png")),
              Container(
                alignment: animation.value,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Bir Kitapla Mümkün!",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: _loginTFKullaniciAdi(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: _loginTFSifre(),
                    ),
                    _loginButton(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          child: Text("Üye Ol"),
                          onPressed: () {
Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RegisterPage()));                          },
                        ),
                        MaterialButton(
                          child: Text("Şifremi Unuttum"),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton() => ElevatedButton(
    
        child: Text("Giriş Yap"),
        onPressed: () async {
          
          bool kontrolSonuc = formKey.currentState!.validate();
          if (kontrolSonuc) {
            String ka = tfKullaniciAdi.text;
            String s = tfSifre.text;
            print("Kullanıcı adı: $ka - Şifre: $s");
            try{
              await _auth.signInWithEmailAndPassword(email: ka, password: s).then((value) {
                if(value.user!=null){
                  Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Anasayfa()));
                }
                else{
                  print("yanlış girişşşşşş");
                  showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("HATA"),
                      content: Text("Hatalı giriş! Lütfen tekrar deneyiniz"),
                    );
                  });
                }
               });
            }catch(e){}

          }
         
          
        },
      );

  Widget _loginTFKullaniciAdi() => TextFormField(
        validator: (tfGirdisi) {
          if (tfGirdisi!.isEmpty) {
            return "Lütfen Kullanıcı Adınızı Giriniz";
          } else {
            return null;
          }
        },
        controller: tfKullaniciAdi,
        decoration: InputDecoration(
          labelText: "Kullanıcı Adı",
          labelStyle: TextStyle(color: Colors.black54),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
            ),
          ),
          border: OutlineInputBorder(),
        ),
      );

  Widget _loginTFSifre() => TextFormField(
        validator: (tfGirdisi) {
          if (tfGirdisi!.isEmpty) {
            return "Lütfen Kullanıcı Adınızı Giriniz";
          } else {
            return null;
          }
        },
        controller: tfSifre,
        decoration: InputDecoration(
          labelText: "Şifre",
          labelStyle: TextStyle(color: Colors.black54),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
            ),
          ),
          border: OutlineInputBorder(),
        ),
      );
}
