import 'package:flutter/material.dart';
import 'package:flutter_silk/Pendaftaran/listpasien.dart';
import 'package:http/http.dart' as http;

class updatepasien extends StatefulWidget {
  final List list;
  final int index;

  updatepasien({Key key, this.title, this.list, this.index}) : super(key: key);

  final String title;

  @override
  _updatepasienState createState() => _updatepasienState();
}

class _updatepasienState extends State<updatepasien> {

  TextEditingController conNik;
  TextEditingController conNama;
  TextEditingController conTglLahir;
  TextEditingController conJk;
  TextEditingController conAlamat;
  TextEditingController conKel;
  TextEditingController conKab;
  TextEditingController conProp;
  TextEditingController conWn;
  TextEditingController conStat;
  TextEditingController conNotelp;
  TextEditingController conTglDaf;


  void editpasien() {
    var url="http://192.168.1.7/silk2021/flutter_silk/lib/Farmasi/crud/editpasien.php";
    http.post(url, body: {
      "no_rm": widget.list[widget.index]['no_rm'],
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
      "no_telp": conNotelp.text,
      "tgl_daftar": widget.list[widget.index]['no_rm']

    });
  }

  @override
  void initState(){
    conNik = new TextEditingController(text: widget.list[widget.index]['nik']);
    conNama = new TextEditingController(text: widget.list[widget.index]['nama_lengkap']);
    conTglLahir = new TextEditingController(text: widget.list[widget.index]['tgl_lahir']);
    conJk = new TextEditingController(text: widget.list[widget.index]['jns_kelamin']);
    conAlamat = new TextEditingController(text: widget.list[widget.index]['alamat']);
    conKel = new TextEditingController(text: widget.list[widget.index]['kelurahan']);
    conKab = new TextEditingController(text: widget.list[widget.index]['kabupaten']);
    conProp = new TextEditingController(text: widget.list[widget.index]['provinsi']);
    conWn = new TextEditingController(text: widget.list[widget.index]['warga_negara']);
    conStat = new TextEditingController(text: widget.list[widget.index]['status_nikah']);
    conNotelp = new TextEditingController(text: widget.list[widget.index]['no_telp']);
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
                SizedBox(height: 10,
                ),
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
                                  editpasien();
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context)=> listpasien(title: "List Pasien")
                                      )
                                  );
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
