import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddDetailResep extends StatefulWidget {
  AddDetailResep({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _AddDetailResepState createState() => _AddDetailResepState(title);
}

class _AddDetailResepState extends State<AddDetailResep> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;

  _AddDetailResepState(this.title);

  bool isLoading = false;

  TextEditingController controllerIdResep = new TextEditingController();
  TextEditingController controllerKode = new TextEditingController();
  TextEditingController controllerHarga = new TextEditingController();
  TextEditingController controllerJumlah = new TextEditingController();

  void adddetail() {
    var url = "http://10.0.2.2/silk2021/flutter_silk/lib/Farmasi/crud/adddetail.php";

    http.post(url, body: {
      "id_resep": controllerIdResep.text,
      "kode_obat": controllerKode.text,
      "harga": controllerHarga.text,
      "jumlah_beli": controllerJumlah.text
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
                      controller: controllerIdResep,
                      decoration: InputDecoration(
                          labelText: "ID RESEP",
                          hintText: "5555",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0,
                              20.0, 15.0)
                      ),
                      onSaved: (String value) {},
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      controller: controllerKode,
                      decoration: InputDecoration(
                          labelText: "Kode Obat",
                          hintText: "1234",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0,
                              20.0, 15.0)
                      ),
                      onSaved: (String value) {},
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      controller: controllerHarga,
                      decoration: InputDecoration(
                          labelText: "Harga",
                          hintText: "Rp. 5000",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0,
                              20.0, 15.0)
                      ),
                      onSaved: (String value) {},
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Jumlah Beli",
                          hintText: "3",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0,
                              20.0, 15.0)
                      ),
                      onSaved: (String value) {},
                    ),
                    SizedBox(height: 15,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.blue,
                      onPressed: () {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Simpan Data"),
                              content: Text(
                                  "Apakah Anda akan menyimpan data ini?"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      adddetail();
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