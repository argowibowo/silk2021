import 'package:flutter/material.dart';
import 'package:flutter_silk/Farmasi/Detail%20Resep/dbDetailResep.dart';
import 'package:http/http.dart' as http;

class UpdateDetail extends StatefulWidget {
  final List list;
  final int index;

  UpdateDetail({Key key, this.title, this.list, this.index}) : super(key: key);

  final String title;

  @override
  _UpdateDetailState createState() => _UpdateDetailState();
}

class _UpdateDetailState extends State<UpdateDetail> {

  TextEditingController controllerIdResep;
  TextEditingController controllerKode;
  TextEditingController controllerHarga;
  TextEditingController controllerJumlah;

  void editdetail(){
    var url="http://10.0.2.2/silk2021/flutter_silk/lib/Farmasi/crud/editdetail.php";
    http.post(url, body: {

      "id_detil_resep": widget.list[widget.index]['id_detil_resep'],
      "id_resep": controllerIdResep.text,
      "kode_obat": controllerKode.text,
      "harga": controllerHarga.text,
      "jumlah_beli": controllerJumlah.text
    });
  }

  @override
  void initState(){
    controllerIdResep = new TextEditingController(text: widget.list[widget.index]['id_resep']);
    controllerKode = new TextEditingController(text: widget.list[widget.index]['kode_obat']);
    controllerHarga = new TextEditingController(text: widget.list[widget.index]['harga']);
    controllerJumlah = new TextEditingController(text: widget.list[widget.index]['jumlah_beli']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Edit Detail Resep"),),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new TextField(
                    controller: controllerIdResep,
                    decoration: new InputDecoration(
                        hintText: "12345",
                        labelText: "ID Resep"
                    ),
                  ),
                  new TextField(
                    controller: controllerKode,
                    decoration: new InputDecoration(
                        hintText: "12345",
                        labelText: "Kode Obat"
                    ),
                  ),
                  new TextField(
                    controller: controllerHarga,
                    decoration: new InputDecoration(
                        hintText: "Rp. 5.000",
                        labelText: "Harga"
                    ),
                  ),
                  new TextField(
                    controller: controllerJumlah,
                    decoration: new InputDecoration(
                        hintText: "1",
                        labelText: "Jumlah"
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(10.0)
                  ),
                  new RaisedButton(
                    child: new Text("Simpan"),
                    color: Colors.blueAccent,
                    onPressed: () {
                      editdetail();
                      Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (BuildContext context)=> new dbDetailResep(title: "Detail Resep")
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
