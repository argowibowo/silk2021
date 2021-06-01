import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class Pendaftaran1 extends StatefulWidget {
  Pendaftaran1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pendaftaran1State createState() => _Pendaftaran1State(title);
}

class _Pendaftaran1State extends State<Pendaftaran1> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  var url = "http://192.168.1.3/silk2020/slim/public/pasien/";

  _Pendaftaran1State(this.title);

  bool isLoading = false;

  TextEditingController conNik = new TextEditingController();
  TextEditingController conNama = new TextEditingController();
  TextEditingController conTglLahir = new TextEditingController();
  TextEditingController conJk = new TextEditingController();
  TextEditingController conAlamat = new TextEditingController();
  TextEditingController conKel = new TextEditingController();
  TextEditingController conKab = new TextEditingController();
  TextEditingController conProp = new TextEditingController();
  TextEditingController conWn = new TextEditingController();
  TextEditingController conStat = new TextEditingController();
  TextEditingController conNotelp = new TextEditingController();

  void addPasien() {

    http.post(url, body: {
      "nik": conNik.text,
      "nama_lengkap": conNama.text,
      "tgl_lahir": conTglLahir.text,
      "jns_kelamin": conJk.text,
      "alamat": conAlamat.text,
      "kelurahan":conKel.text,
      "kabupaten":conKab.text,
      "provinsi":conProp.text,
      "warga_negara":conWn.text,
      "status_nikah": conStat.text,
      "no_telp": conNotelp.text

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
        ),
        body: Center(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: conNik,
                  decoration: InputDecoration(
                      labelText: "NIK",
                      hintText: "Masukkan NIK",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  controller: conNama,
                  decoration: InputDecoration(
                      labelText: "NAMA_LENGKAP",
                      hintText: "Masukkan Nama Lengkap",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  controller: conTglLahir,
                  decoration: InputDecoration(
                      labelText: "Tanggal Lahir",
                      hintText: "Tanggal Lahir",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  controller: conJk,
                  decoration: InputDecoration(
                      labelText: "Jenis Kelamin",
                      hintText: "JK",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  controller: conAlamat,
                  decoration: InputDecoration(
                      labelText: "Alamat Lengkap",
                      hintText: "Masukkan Alamat",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  controller: conKel,
                  decoration: InputDecoration(
                      labelText: "Kelurahan",
                      hintText: "Masukkan Kelurahan",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  controller: conKab,
                  decoration: InputDecoration(
                      labelText: "Kabupaten",
                      hintText: "Masukkan Kabupaten",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  controller: conProp,
                  decoration: InputDecoration(
                      labelText: "PROVINSI",
                      hintText: "Masukkan Provinsi",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  controller: conWn,
                  decoration: InputDecoration(
                      labelText: "Warga Negara",
                      hintText: "WN",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  controller: conStat,
                  decoration: InputDecoration(
                      labelText: "Status",
                      hintText: "Status",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  controller: conNotelp,
                  decoration: InputDecoration(
                      labelText: "NO TELEPON",
                      hintText: "NO TELP",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
            SizedBox(
              height: 15,
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
                                  addPasien();
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
        )
    );
  }
}