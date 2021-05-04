import 'package:flutter/material.dart';

class Rekam_Medis extends StatefulWidget {
  Rekam_Medis({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Rekam_MedisState createState() => _Rekam_MedisState();
}

class _Rekam_MedisState extends State<Rekam_Medis> {
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
                      labelText: "No_Rm",
                      hintText: "No_RM",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Keluhan",
                      hintText: "Masukkan Keluhan",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Id_Dokter",
                      hintText: "Masukkan Id_Dokter",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Diagnosa",
                      hintText: "Masukkan Diagnosa",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "id_Unit",
                      hintText: "Masukkan id_Unit",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Tanggal_Periksa",
                      hintText: "Masukkan Tanggal_Periksa",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Id_Resep",
                      hintText: "Masukkan Id_Resep",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),

                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  color: Colors.purple,
                  onPressed: () {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Save Data"),
                          content: Text("Apakah Anda Yakin untuk menyimpan data ini?"),
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
                    "Save",
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