import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mytransbb/adminPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mytransbb/halaman/profile.dart';
import 'package:mytransbb/halaman/register.dart';
import 'package:mytransbb/halaman/covid1.dart';
import 'package:mytransbb/halaman/covid2.dart';

void main() {
  runApp(HomePage());
}

String username = '';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Cash Register',
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/AdminPage': (BuildContext context) => new AdminPage(
              username: username,
            ),
        '/ProfilePage': (BuildContext context) => new ProfilePage(
              username: username,
            ),
        '/MyHomePage': (BuildContext context) => new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isHidePassword = true;

  void _togglePassword() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  Future<List> _login() async {
    final response =
        await http.post("https://alkhaniaga.com/api/login.php", body: {
      "username": user.text,
      "password": pass.text,
    });
    var datauser = json.decode(response.body);
    if (datauser.length == 0) {
      setState(() {
        tampil();
      });
    } else {
      if (datauser[0]['level'] == 'admin') {
        Navigator.pushReplacementNamed(context, '/AdminPage');
      } else if (datauser[0]['level'] == 'member') {
        Navigator.pushReplacementNamed(context, '/ProfilePage');
      }

      setState(() {
        username = datauser[0]['username'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      // padding: EdgeInsets.all(10),
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                      child: TextField(
                        controller: user,
                        decoration: InputDecoration(
                          fillColor: Colors.lightGreen[40],
                          filled: true,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                          prefixStyle: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                          labelText: "Username",
                          hintText: 'Username anda',
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w200),
                          labelStyle: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                      child: TextField(
                        controller: pass,
                        obscureText: _isHidePassword,
                        decoration: InputDecoration(
                          fillColor: Colors.lightGreen[40],
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          prefixStyle: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                          labelText: "Password",
                          hintText: 'Pawssord anda',
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w200),
                          labelStyle: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _togglePassword();
                            },
                            child: Icon(
                              _isHidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color:
                                  _isHidePassword ? Colors.grey : Colors.blue,
                            ),
                          ),
                          isDense: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    new MaterialButton(
                      height: 55.0,
                      minWidth: 350.0,
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                      onPressed: () {
                        _login();
                      },
                      splashColor: Colors.redAccent,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    new MaterialButton(
                      height: 55.0,
                      minWidth: 350.0,
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text(
                        "Info COVID 1",
                        style: TextStyle(fontSize: 20),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Covid1()),
                        );
                      },
                      splashColor: Colors.yellowAccent,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    new MaterialButton(
                      height: 55.0,
                      minWidth: 350.0,
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text(
                        "Info COVID 2",
                        style: TextStyle(fontSize: 20),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Covid2()),
                        );
                      },
                      splashColor: Colors.redAccent,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Register()));
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                              text: 'Belum punya akun sendiri ? ',
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Daftar Disini',
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void tampil() {
    Fluttertoast.showToast(
        msg: "LOGIN GAGAL",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
