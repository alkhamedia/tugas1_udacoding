import 'package:flutter/material.dart';
import 'package:mytransbb/halaman/home_page.dart';
import 'package:splashscreen/splashscreen.dart';
import 'halaman/home_page.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 14,
        navigateAfterSeconds: new HomePage(),
        title: new Text('BPPRD Kabupaten Batu Bara',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white)),
        image: new Image.asset('assets/images/logo.png'),
        backgroundColor: Colors.blueAccent,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.red);
  }
}
