import 'dart:async';

import 'package:flutter_silk/Farmasi/Detail Resep/addDetailResep.dart';
import 'package:flutter/material.dart';

class DetailResep extends StatefulWidget {
  DetailResep({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DetailResepState createState() => _DetailResepState();
}

class _DetailResepState extends State<DetailResep> {
  final _formKey = GlobalKey<FormState>();

  List<DetailResep> listDetailResep;

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
                    MaterialPageRoute(builder: (context) => AddDetailResep(title: "Input Data Detail Resep"))
                ).then(onGoBack);
              }
          )
        ],
      ),
    );
  }
}