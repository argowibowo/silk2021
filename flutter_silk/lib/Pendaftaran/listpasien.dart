import 'dart:async';
import 'dart:convert';

import 'package:flutter_silk/Farmasi/Detail%20Resep/addDetailResep.dart';
import 'package:flutter_silk/Farmasi/Detail%20Resep/updateDetailResep.dart';
import 'package:flutter_silk/Farmasi/Obat/addObat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_silk/Farmasi/Obat/updateObat.dart';
import 'package:http/http.dart' as http;

class listpasien extends StatefulWidget {
  List list;
  int index;
  listpasien({Key key, this.title, this.list, this.index}) : super(key: key);

  final String title;

  @override
  _listpasienState createState() => _listpasienState();
}

class _listpasienState extends State<listpasien> {
  final _formKey = GlobalKey<FormState>();

  Future<List> getData() async{
    final response= await http.get("http://192.168.1.3/silk2020/slim/public/pasien/");
    return jsonDecode(response.body);
  }

  void deleteobat(){
    var url="http://10.0.2.2/silk2021/flutter_silk/lib/Farmasi/crud/deleteobat.php";
    http.post(url, body: {
      'kode_obat': widget.list[widget.index]['kode_obat']
    });
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddDetailResep(title: "Input Detail Resep"))
                ).then(onGoBack);
              }
          ),
        ],
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(list: snapshot.data)
              : new Center( child: new CircularProgressIndicator(),);
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget{

  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list==null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            child: new Card(
              child: new ListTile(
                title: new Text("ID Detail Resep : ${list[i]['nik'] + " || ID Resep : ${list[i]['nama_lengkap']}"}"),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Kode Obat : ${list[i]['tgl_lahir'] + " || Harga : ${list[i]['jns_kelamin'] + " || Jumlah Beli : ${list[i]['alamat']}"}"}"),
                onLongPress: (){
                  showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            FlatButton(
                              child: Text("Update"),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => UpdateDetail(title: "Update Detail Resep", list: list, index: i,)
                                  ),
                                );//.then(onGoBack);
                              },
                            ),
                            Divider(
                              color: Colors.black,
                              height: 20,
                            ),
                            FlatButton(
                              child: Text("Delete"),
                              onPressed: () {
                                //deleteo
                                //delData();
                                // ApiServices().deleteObt(listObat[position].kode_obat);
                                // Navigator.pop(context);
                                // setState(() {});
                              },
                            )
                          ],
                        ),
                      )
                  );
                },
              ),
            ),
          );
        }
    );
  }
}