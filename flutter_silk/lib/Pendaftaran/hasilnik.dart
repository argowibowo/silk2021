import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_silk/Farmasi/Detail%20Resep/dbDetailResep.dart';
import 'package:flutter_silk/Pendaftaran/updatepasien.dart';
import 'package:http/http.dart' as http;


class hasilnik extends StatefulWidget {
  List list;
  int index;
  hasilnik({Key key, this.title, this.list, this.index}) : super(key: key);

  final String title;

  TextEditingController conwkwk = new TextEditingController();



  @override
  _hasilnikState createState() => _hasilnikState();
}

class _hasilnikState extends State<hasilnik> {
  Future<List> getData() async{
    final response= await http.get("http://192.168.1.7/silk2020/flutter_silk/lib/Farmasi/crud/getpasien.php");
    return jsonDecode(response.body);
  }


  void deletepasien(){
    var url = "http://192.168.1.7/silk2020/flutter_silk/lib/Farmasi/crud/deletepasien.php";
    http.post(url, body: {
      'no_rm': widget.list[widget.index]['no_rm']
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
                title: new Text("NIK : ${list[i]['nik']}"),
                leading: new Icon(Icons.people_alt),
                subtitle: new Text("Nama Pasien : ${list[i]['nama_lengkap']}"),
                onLongPress: (){
                  showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            FlatButton(
                              child: Text("UBAH DATA"),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => updatepasien(title: "Update Pasien", list: list, index: i,)
                                  ),
                                );
                              },
                            ),
                            Divider(
                              color: Colors.black,
                              height: 5,
                            ),
                            FlatButton(
                              child: Text("HAPUS DATA"),
                              onPressed: () {
                                Navigator.pop(context);

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