import 'package:flutter/material.dart';

class Covid1 extends StatefulWidget {
  @override
  _Covid1State createState() => _Covid1State();
}

class _Covid1State extends State<Covid1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(15),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "COVID 19 NEWS",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "All Cases : 272691",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "All Death : 11310",
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  ),
                  Text(
                    "All Recovered : 90618",
                    style: TextStyle(fontSize: 25, color: Colors.green),
                  ),
                  Text(
                    "All Active Cases : 170763",
                    style: TextStyle(fontSize: 30, color: Colors.orange),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                initialValue: 'Input Country',
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: <Widget>[
                  new MaterialButton(
                    height: 55.0,
                    minWidth: 185.0,
                    color: Colors.red[200],
                    textColor: Colors.white,
                    child: Text(
                      "Search",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    splashColor: Colors.redAccent,
                  ),
                  Container(
                    width: 10,
                  ),
                  new MaterialButton(
                    height: 55.0,
                    minWidth: 185.0,
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text(
                      "All Information",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    splashColor: Colors.redAccent,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: new MaterialButton(
                height: 55.0,
                minWidth: 350.0,
                color: Colors.red,
                textColor: Colors.white,
                child: Text(
                  "Updates Of Indonesia",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                splashColor: Colors.redAccent,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "IMPORTANT",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Search "South Korea" as Korea',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
