import 'dart:async';
import 'dart:convert';

import 'package:flutter_silk/Farmasi/Obat/addObat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_silk/Farmasi/Obat/updateObat.dart';
import 'package:http/http.dart' as http;

class dbObat extends StatefulWidget {
  List list;
  int index;
  dbObat({Key key, this.title, this.list, this.index}) : super(key: key);

  final String title;

  @override
  _dbObatState createState() => _dbObatState();
}

class _dbObatState extends State<dbObat> {
  final _formKey = GlobalKey<FormState>();

  Future<List> getData() async{
    final response= await http.get("http://10.0.2.2/silk2021/flutter_silk/lib/Farmasi/crud/getobat.php");
    return jsonDecode(response.body);
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
                    MaterialPageRoute(builder: (context) => AddObat(title: "Input Data Obat"))
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

  //final List list;
  var list;
  int index;
  ItemList({this.list});
  var widget;

  void deleteobat(){
    var url="http://10.0.2.2/silk2021/flutter_silk/lib/Farmasi/crud/deleteobat.php";
    http.post(url, body: {
      'kode_obat': widget.list[widget.index]['kode_obat']
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list==null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['kode_obat'] + " || Nama Obat : ${list[i]['nama_obat']}"),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Jenis Obat : ${list[i]['jenis_obat'] + " || Stok : ${list[i]['stok'] + " || Satuan : ${list[i]['satuan'] + " || Harga : ${list[i]['harga']}"}"}"}"),
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
                                  MaterialPageRoute(builder: (context) => UpdateObat(title: "Update Obat", list: list, index: i,)
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