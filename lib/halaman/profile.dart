import 'package:flutter/material.dart';
import 'package:mytransbb/halaman/home_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({this.username});

  final String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ProfileDetail(),
    ));
  }
}

class ProfileDetail extends StatefulWidget {
  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  bool _mentor1 = true;
  bool _mentor2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Profile",
          style: TextStyle(fontSize: 24.0),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/MyHomePage');
            },
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://googleflutter.com/sample_image.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
            Text(
              '$username',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child:
                    Container(height: 1.0, width: 100.0, color: Colors.black)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                initialValue: 'Julham',
                decoration: InputDecoration(labelText: 'Username'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                initialValue: 'efendi.julham@gmail.com',
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            CheckboxListTile(
              title: Text('Available to Mentor'),
              value: _mentor1,
              onChanged: (value) => setState(() => _mentor1 = value),
            ),
            CheckboxListTile(
              title: Text('Needs Mentoring'),
              value: _mentor2,
              onChanged: (value) => setState(() => _mentor2 = value),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                initialValue: 'Julham',
                decoration: InputDecoration(labelText: 'Username'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                initialValue: 'Programmer, Webdesign',
                decoration: InputDecoration(labelText: 'Bio'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                initialValue: 'Julham',
                decoration: InputDecoration(labelText: 'Slack Username'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                initialValue: 'Jl.Danau Belida Binjai, SUMUT',
                decoration: InputDecoration(labelText: 'Location'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                initialValue: 'Programmer',
                decoration: InputDecoration(labelText: 'Occupation'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
        //child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }
}
