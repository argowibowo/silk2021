import 'dart:async';

import 'package:flutter_silk/Farmasi/Resep/addResep.dart';
import 'package:flutter/material.dart';

class Resep extends StatefulWidget {
  Resep({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ResepState createState() => _ResepState();
}

class _ResepState extends State<Resep> {
  final _formKey = GlobalKey<FormState>();

  List<Resep> listResep;

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
          )
        ],
      ),
    );
  }
}