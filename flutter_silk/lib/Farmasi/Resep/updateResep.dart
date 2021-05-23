import 'package:flutter/material.dart';
import 'package:flutter_silk/Farmasi/Resep/dbResep.dart';
import 'package:http/http.dart' as http;

class UpdateResep extends StatefulWidget {
  final List list;
  final int index;
  final String title;

  UpdateResep({Key key, @required this.title, this.list, this.index});

  @override
  _UpdateResepState createState() => _UpdateResepState();
}

class _UpdateResepState extends State<UpdateResep> {

  TextEditingController controllerIdDokter;
  TextEditingController controllerNo;
  TextEditingController controllerTgl;
  TextEditingController controllerTotal;

  void editresep(){
    var url="http://10.0.2.2/silk2021/flutter_silk/lib/Farmasi/crud/editresep.php";
    http.post(url,body: {
      "id_resep": widget.list[widget.index]['id_resep'],
      "id_dokter": controllerIdDokter.text,
      "no_rm": controllerNo.text,
      "tgl_transaksi": controllerTgl.text,
      "total_harga": controllerTotal.text
    });
  }

  @override
  void initState() {
    controllerIdDokter = new TextEditingController(text: widget.list[widget.index]['id_dokter']);
    controllerNo = new TextEditingController(text: widget.list[widget.index]['no_rm']);
    controllerTgl = new TextEditingController(text: widget.list[widget.index]['tgl_transaksi']);
    controllerTotal = new TextEditingController(text: widget.list[widget.index]['total_harga']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Edit Resep"),),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new TextField(
                    controller: controllerIdDokter,
                    decoration: new InputDecoration(
                        hintText: "334455",
                        labelText: "ID Dokter"
                    ),
                  ),
                  new TextField(
                    controller: controllerNo,
                    decoration: new InputDecoration(
                        hintText: "1",
                        labelText: "No RM"
                    ),
                  ),
                  new TextField(
                    controller: controllerTgl,
                    decoration: new InputDecoration(
                        hintText: "01-01-2020",
                        labelText: "Tanggal"
                    ),
                  ),
                  new TextField(
                    controller: controllerTotal,
                    decoration: new InputDecoration(
                        hintText: "Rp. 5000",
                        labelText: "Total Harga"
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(10.0)
                  ),
                  new RaisedButton(
                    child: new Text("Simpan"),
                    color: Colors.blueAccent,
                    onPressed: () {
                      editresep();
                      Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (BuildContext context)=> new dbResep(title: "Resep")
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
