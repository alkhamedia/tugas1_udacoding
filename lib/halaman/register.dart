import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String username, email, namalengkap, nohp, password;

  bool _secureText = true;
  bool _setuju = false;
  bool _wajibpajak = false;
  bool dinas = false;

  final _key = new GlobalKey<FormState>();

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      save();
    }
  }

  save() async {
    final response =
        await http.post("http://api.alkhaniaga.com/register.php", body: {
      "username": username,
      "namalengkap": namalengkap,
      "nohp": nohp,
      "email": email,
      "password": password,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    if (value == 1) {
      setState(() {
        Navigator.pop(context);
      });
    } else {
      print(pesan);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Daftar User Baru'),
      ),
      // appBar: AppBar(),
      body: Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(15),
          children: <Widget>[
            //awal
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Form Pendaftaran",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            TextFormField(
              decoration: new InputDecoration(
                hintText: "cth: Julham efendi",
                labelText: "Nama Lengkap",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
              ),
              validator: (nama) {
                if (nama.isEmpty) {
                  return 'Nama tidak boleh kosong';
                }
                return null;
              },
              onSaved: (nama) => namalengkap = nama,
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: new InputDecoration(
                hintText: "cth: efendi.julham",
                labelText: "Username",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
              ),
              validator: (username) {
                if (username.isEmpty) {
                  return 'Username tidak boleh kosong';
                }
                return null;
              },
              onSaved: (username) => username = username,
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: new InputDecoration(
                hintText: "cth: 081111XXXXXX",
                labelText: "NO HP",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
              ),
              validator: (nohp) {
                if (nohp.isEmpty) {
                  return 'No HP tidak boleh kosong';
                }
                return null;
              },
              onSaved: (nohp) => nohp = nohp,
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: new InputDecoration(
                hintText: "cth: efendi.julham@gmail.com",
                labelText: "Email",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
              ),
              validator: (email) {
                if (email.isEmpty) {
                  return 'Email tidak boleh kosong';
                }
                return null;
              },
              onSaved: (email) => email = email,
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _secureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: showHide,
                  )),
              validator: (password) {
                if (password.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                return null;
              },
              onSaved: (password) => password = password,
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Konfirm Password",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _secureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: showHide,
                  )),
              validator: (k_password) {
                if (k_password.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                return null;
              },
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Available to be a :",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: new Stack(
                      children: <Widget>[
                        Checkbox(
                          value: _wajibpajak,
                          onChanged: (bool value) {
                            setState(() {
                              _wajibpajak = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Center(child: Text('Wajib Pajak')),
                  ),
                  Container(
                    child: new Stack(
                      children: <Widget>[
                        Checkbox(
                          value: dinas,
                          onChanged: (bool value) {
                            setState(() {
                              dinas = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Center(child: Text('OPD')),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: new Stack(
                      children: <Widget>[
                        Checkbox(
                          value: _setuju,
                          onChanged: (bool value) {
                            setState(() {
                              _setuju = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Text(
                      'Saya menegaskan bahwa saya telah membaca dan menerima untuk terikat oleh kode etik BPPRDD Kabupaten Batu Bara.syarat dan kebijakan privasi, Selanjutnya, Saya setuju untuk menggunakan informasi saya untuk tujuan yang telah ditentukan sebelumnya',
                      style: TextStyle(
                        fontSize: 10,
                        height: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //akhir

            //awal ke database oke
            // TextFormField(
            //   validator: (e) {
            //     if (e.isEmpty) {
            //       return "Mohon username di isi ";
            //     }
            //   },
            //   onSaved: (e) => username = e,
            //   decoration: InputDecoration(labelText: "Username"),
            // ),
            // TextFormField(
            //   validator: (e) {
            //     if (e.isEmpty) {
            //       return "Mohon Email di isi ";
            //     }
            //   },
            //   onSaved: (e) => email = e,
            //   decoration: InputDecoration(labelText: "Email"),
            // ),
            // TextFormField(
            //   obscureText: _secureText,
            //   onSaved: (e) => password = e,
            //   decoration: InputDecoration(
            //       labelText: "Password",
            //       suffixIcon: IconButton(
            //         icon: Icon(
            //             _secureText ? Icons.visibility_off : Icons.visibility),
            //         onPressed: showHide,
            //       )),
            // ),
            SizedBox(
              height: 25.0,
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.all(15.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                check();
              },
              child: Text(
                "Daftar",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setOK(bool newValue) {
    setState(() {
      _setuju = newValue;
    });
  }
}
