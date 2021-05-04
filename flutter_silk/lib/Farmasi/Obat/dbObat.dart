import 'dart:async';

import 'package:flutter_silk/Farmasi/Obat/addObat.dart';
import 'package:flutter/material.dart';

class Obat extends StatefulWidget {
  Obat({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ObatState createState() => _ObatState();
}

class _ObatState extends State<Obat> {
  final _formKey = GlobalKey<FormState>();

  List<Obat> listObat;

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
          )
        ],
      ),
    );
  }
}