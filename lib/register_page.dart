import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proje/services/auth_service.dart';
import 'package:proje/login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    hintText: "Kullanıcı Adı",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                    ),
                    hintText: "E-mail",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
            
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.password,
                    ),
                    hintText: "Şifre",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 55,
              ),
              ElevatedButton(
                onPressed: _registerOnTap,
               child: Text("Kayıt ol")),
             
            ],
          ),
        ));
  }

  

  void _registerOnTap() {
    if (_usernameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      _authService
          .createPerson(_usernameController.text,
           _emailController.text,
              _passwordController.text)
          .then((value) {
        Navigator.pop(context);
      }).catchError((error) {
        _warningToast("Beklenmedik bir hata oluştu!");
      }).whenComplete(() => null);
    } else {
      _warningToast("İstenilen bilgiler boş bırakılamaz..");
    }
  }

  Future<bool?> _warningToast(String text) {
    return Fluttertoast.showToast(
        msg: text,
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14);
  }
}
