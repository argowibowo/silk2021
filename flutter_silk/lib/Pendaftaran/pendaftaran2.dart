import 'package:flutter/material.dart';
import 'package:flutter_silk/Pendaftaran/pendaftaran.dart';

class Pendaftaran2 extends StatefulWidget {
  Pendaftaran2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pendaftaran2State createState() => _Pendaftaran2State();
}

class _Pendaftaran2State extends State<Pendaftaran2> {
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
                      labelText: "Cari NIK Pasien",
                      hintText: "Masukkan NIK",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  color: Colors.blue,
                  onPressed: () {

                  },
                  child: Text(
                    "CARI",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),

                  ),

                ),
                SizedBox(height: 400,
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  color: Colors.blueGrey,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pendaftaran1(title: "PENDAFTARAN")),  //<~~
                    );


                  },
                  child: Text(
                    "TAMBAH DATA BARU",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),

                  ),

                ),

              ],
            ),
          ),
        )
    );
  }
}