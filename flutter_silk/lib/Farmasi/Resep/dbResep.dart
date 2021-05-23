import 'dart:async';
import 'dart:convert';

import 'package:flutter_silk/Farmasi/Detail%20Resep/dbDetailResep.dart';
import 'package:flutter_silk/Farmasi/Obat/addObat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_silk/Farmasi/Obat/updateObat.dart';
import 'package:flutter_silk/Farmasi/Resep/addResep.dart';
import 'package:flutter_silk/Farmasi/Resep/updateResep.dart';
import 'package:http/http.dart' as http;

class dbResep extends StatefulWidget {
  List list;
  int index;
  dbResep({Key key, this.title, this.list, this.index}) : super(key: key);

  final String title;

  @override
  _dbResepState createState() => _dbResepState();
}

class _dbResepState extends State<dbResep> {
  final _formKey = GlobalKey<FormState>();

  Future<List> getData() async{
    final response= await http.get("http://10.0.2.2/silk2021/flutter_silk/lib/Farmasi/crud/getresep.php");
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
                    MaterialPageRoute(builder: (context) => AddResep(title: "Input Data Resep"))
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
  var widget;

  void deleteresep(){
    var url="http://10.0.2.2/silk2021/flutter_silk/lib/Farmasi/crud/deleteresep.php";

    http.post(url, body: {
      'id_resep': widget.list[widget.index]['id_resep']
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
                title: new Text(list[i]['id_dokter'] + " || No RM : ${list[i]['no_rm']}"),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Tanggal Transaksi : ${list[i]['tgl_transaksi'] + " || Total Harga : ${list[i]['total_harga']}"}"),
                onLongPress: (){
                  showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            FlatButton(
                              child: Text("Lihat Detail Resep"),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => dbDetailResep(title: "Detail Resep", list: list, index: i,)
                                  ),
                                );//.then(onGoBack);
                              },
                            ),
                            Divider(
                              color: Colors.black,
                              height: 20,
                            ),
                            FlatButton(
                              child: Text("Update"),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => UpdateResep(title: "Update Resep", list: list, index: i,)
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
                                deleteresep();
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