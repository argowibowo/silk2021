import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddObat extends StatefulWidget {
  AddObat({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _AddObatState createState() => _AddObatState(title);
}

class _AddObatState extends State<AddObat> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddObatState(this.title);
  bool isLoading = false;

  TextEditingController controllerKode = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerJenis = new TextEditingController();
  TextEditingController controllerSatuan = new TextEditingController();
  TextEditingController controllerStok = new TextEditingController();
  TextEditingController controllerHarga = new TextEditingController();

  void addobat(){
    var url ="http://10.0.2.2/silk2021/flutter_silk/lib/Farmasi/crud/addobat.php";

    http.post(url, body: {
      "kode_obat": controllerKode.text,
      "nama_obat": controllerNama.text,
      "jenis_obat": controllerJenis.text,
      "satuan": controllerSatuan.text,
      "stok": controllerStok.text,
      "harga": controllerHarga.text
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
                      controller: controllerKode,
                      decoration: InputDecoration(
                          labelText: "Kode Obat",
                          hintText: "Kode Obat",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      controller: controllerNama,
                      decoration: InputDecoration(
                          labelText: "Nama Obat",
                          hintText: "Nama Obat",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      controller: controllerJenis,
                      decoration: InputDecoration(
                          labelText: "Jenis Obat",
                          hintText: "Jenis Obat",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      controller: controllerSatuan,
                      decoration: InputDecoration(
                          labelText: "Satuan",
                          hintText: "Satuan",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      controller: controllerStok,
                      decoration: InputDecoration(
                          labelText: "Stok",
                          hintText: "Stok Obat",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: controllerHarga,
                      decoration: InputDecoration(
                          labelText: "Harga",
                          hintText: "Harga Obat",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
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
                                    child: Text("Ya"),
                                    onPressed: () {
                                      addobat();
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },

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