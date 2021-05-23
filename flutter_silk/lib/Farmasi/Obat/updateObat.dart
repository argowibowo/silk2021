import 'package:flutter/material.dart';
import 'package:flutter_silk/Farmasi/Obat/dbObat.dart';
import 'package:flutter_silk/Farmasi/Resep/dbResep.dart';
import 'package:http/http.dart' as http;

class UpdateObat extends StatefulWidget {
  final List list;
  final int index;
  final String title;

  UpdateObat({Key key, @required this.title, this.list, this.index});

  @override
  _UpdateObatState createState() => _UpdateObatState();
}

class _UpdateObatState extends State<UpdateObat> {

  TextEditingController controllerKode;
  TextEditingController controllerNama;
  TextEditingController controllerJenis;
  TextEditingController controllerStok;
  TextEditingController controllerSatuan;
  TextEditingController controllerHarga;

  void editobat(){
    var url="http://10.0.2.2/silk2021/flutter_silk/lib/Farmasi/crud/editobat.php";
    http.post(url,body: {
      "kode_obat": widget.list[widget.index]['kode_obat'],
      "nama_obat": controllerNama.text,
      "jenis_obat": controllerJenis.text,
      "stok": controllerStok.text,
      "satuan": controllerSatuan.text,
      "harga": controllerHarga.text
    });
  }

  @override
  void initState() {
    controllerNama = new TextEditingController(text: widget.list[widget.index]['nama_obat']);
    controllerJenis = new TextEditingController(text: widget.list[widget.index]['jenis_obat']);
    controllerStok = new TextEditingController(text: widget.list[widget.index]['stok']);
    controllerSatuan = new TextEditingController(text: widget.list[widget.index]['satuan']);
    controllerHarga = new TextEditingController(text: widget.list[widget.index]['harga']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Edit Obat"),),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new TextField(
                    controller: controllerNama,
                    decoration: new InputDecoration(
                        hintText: "OBT123",
                        labelText: "Nama Obat"
                    ),
                  ),
                  new TextField(
                    controller: controllerJenis,
                    decoration: new InputDecoration(
                        hintText: "Tablet",
                        labelText: "Jenis Obat"
                    ),
                  ),
                  new TextField(
                    controller: controllerSatuan,
                    decoration: new InputDecoration(
                        hintText: "Kapsul",
                        labelText: "Satuan"
                    ),
                  ),
                  new TextField(
                    controller: controllerStok,
                    decoration: new InputDecoration(
                        hintText: "5",
                        labelText: "Stok"
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(10.0)
                  ),
                  new TextField(
                    controller: controllerHarga,
                    decoration: new InputDecoration(
                        hintText: "Rp. 5.000",
                        labelText: "Harga"
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(10.0)
                  ),
                  new RaisedButton(
                    child: new Text("Simpan"),
                    color: Colors.blueAccent,
                    onPressed: () {
                      editobat();
                      Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (BuildContext context)=> new dbObat(title: "Obat")
                          )
                      );
                    },
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}
