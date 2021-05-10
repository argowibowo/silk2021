import 'package:flutter/material.dart';

class Pendaftaran1 extends StatefulWidget {
  Pendaftaran1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pendaftaran1State createState() => _Pendaftaran1State();
}

class _Pendaftaran1State extends State<Pendaftaran1> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "NIK",
                      hintText: "Masukkan NIK",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "NAMA LENGKAP",
                      hintText: "Masukkan Nama Lengkap",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Tanggal Lahir",
                      hintText: "Tanggal Lahir",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Jenis Kelamin",
                      hintText: "JK",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Alamat Lengkap",
                      hintText: "Masukkan Alamat",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Kelurahan",
                      hintText: "Masukkan Kelurahan",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Kabupaten",
                      hintText: "Masukkan Kabupaten",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "PROVINSI",
                      hintText: "Masukkan Provinsi",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Warga Negara",
                      hintText: "WN",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Status",
                      hintText: "Status",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "NO TELEPON",
                      hintText: "NO TELP",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              color: Colors.blue,
              onPressed: () {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Simpan Data"),
                      content: Text("Apakah Anda akan menyimpan data ini?"),
                      actions: <Widget>[
                        FlatButton(
                            child: Text("Ya")
                        ),
                        FlatButton(
                            child: Text("Tidak")
                        )
                      ],
                    );
                  },
                );
              },
              child: Text(
                "Simpan",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
              ],
            ),
          ),
        )
    );
  }
}