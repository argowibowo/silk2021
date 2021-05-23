import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddResep extends StatefulWidget {
  AddResep({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _AddResepState createState() => _AddResepState(title);
}

class _AddResepState extends State<AddResep> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddResepState(this.title);
  bool isLoading = false;

  TextEditingController controllerIdDokter = new TextEditingController();
  TextEditingController controllerNo = new TextEditingController();
  TextEditingController controllerTgl = new TextEditingController();
  TextEditingController controllerTotal = new TextEditingController();

  void addresep(){
    var url ="http://10.0.2.2/silk2021/flutter_silk/lib/Farmasi/crud/addresep.php";

    http.post(url, body: {
      "id_dokter": controllerIdDokter.text,
      "no_rm": controllerNo.text,
      "tgl_transaksi": controllerTgl.text,
      "total_harga": controllerTotal.text
    });

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,

      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Form(
                key: _formState,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      controller: controllerIdDokter,
                      decoration: InputDecoration(
                          labelText: "ID Dokter",
                          hintText: "334455",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      onSaved: (String value) {
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      controller: controllerNo,
                      decoration: InputDecoration(
                          labelText: "No RM",
                          hintText: "123",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      onSaved: (String value) {
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      controller: controllerTgl,
                      decoration: InputDecoration(
                          labelText: "Tanggal Transaksi",
                          hintText: "01-01-2021",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      onSaved: (String value) {
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      controller: controllerTotal,
                      decoration: InputDecoration(
                          labelText: "Total Harga",
                          hintText: "Rp. 10.000",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      onSaved: (String value) {
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.blue,
                      onPressed: () {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Simpan Data"),
                              content: Text("Apakah Anda akan menyimpan data ini?"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      addresep();
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: Text("Ya")
                                ),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Tidak")
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        "Simpan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Center(
              //   child: CircularProgressIndicator(),
              // )
              isLoading
                  ? Stack(
                children: <Widget>[
                  // Opacity(
                  //   opacity: 0.3,
                  //   child: ModalBarrier(
                  //     dismissible: false,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              )
                  : Container(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}