import 'package:flutter/material.dart';

class Rekam_Medis extends StatefulWidget {
  Rekam_Medis({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Rekam_MedisState createState() => _Rekam_MedisState();
}

class _Rekam_MedisState extends State<Rekam_Medis> {
  int _counter = 0;
  String valueChoose;
  List id_dokter = [
    "DA01", "DE02", "DU03", "DO04"
  ];

  TextEditingController controllerNo_RM= new TextEditingController();
  TextEditingController controllerKel= new TextEditingController();
  TextEditingController controllerDiag= new TextEditingController();
  TextEditingController controllerId_unit= new TextEditingController();
  TextEditingController controllerId_TaglPeriksa= new TextEditingController();
  TextEditingController controllerId_IdRes= new TextEditingController();



  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void kirimdata(){
    AlertDialog alertDialog = new AlertDialog(
      content: Container(
        height: 200.0,
        child: Column(
          children: <Widget>[
             Text("No_RM : ${controllerNo_RM.text}"),
             Text("keluhan: ${controllerKel.text}"),
             Text("Diagnosa: ${controllerDiag.text}"),
            Text("Id_Unit: ${controllerId_unit.text}"),
            Text("Tanggal_Peringsa: ${controllerId_TaglPeriksa.text}"),
            Text("Id_Resep: ${controllerId_IdRes.text}"),

          ],
        ),
      ),
    );
    showDialog(context: context,child:alertDialog );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "list view Builder",
            style:  TextStyle(fontSize: 19.0),
          ),
          backgroundColor: Colors.deepPurple,

          actions: <Widget>[
            IconButton(
                icon:  Icon(Icons.add),
                onPressed: ()=>debugPrint("Add")
            ),
            IconButton(
                icon:  Icon(Icons.search),
                onPressed: ()=>debugPrint("Search")
            )
          ],

        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child:  Column(
                  children: <Widget>[
                     TextField(
                       controller: controllerNo_RM,
                      decoration: InputDecoration(
                        hintText: "No_RM",
                        labelText: "No_RM",
                        border: OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(20.0)
                        )
                      ) ,
                    ),

                    Padding(padding: new EdgeInsets.only(top: 5.0),),
                    TextField(
                      maxLines: 3,
                      controller: controllerKel,
                      decoration: InputDecoration(
                          hintText: "keluhan",
                          labelText: "keluhan",
                          border: OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(20.0)
                          )
                      ) ,
                    ),
                    Padding(padding: new EdgeInsets.only(top: 5.0),),
                    TextField(
                      maxLines: 3,
                      controller: controllerDiag,
                      decoration: InputDecoration(
                          hintText: "Diagnosa",
                          labelText: "Diagnosa",
                          border: OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(20.0)
                          )
                      ) ,
                    ),

                    Padding(padding: new EdgeInsets.only(top: 5.0),),
                    TextField(
                      controller: controllerId_unit,
                      decoration: InputDecoration(
                          hintText: "Id_Unit",
                          labelText: "Id_Unit",
                          border: OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(20.0)
                          )
                      ) ,
                    ),
                    Padding(padding: new EdgeInsets.only(top: 5.0),),
                    TextField(
                      controller: controllerId_TaglPeriksa,
                      decoration: InputDecoration(
                          hintText: "Tanggal_Perigsa",
                          labelText: "Tanggal_perigsa",
                          border: OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(20.0)
                          )
                      ) ,
                    ),
                    Padding(padding: new EdgeInsets.only(top: 5.0),),
                    TextField(
                      controller: controllerId_IdRes,
                      decoration: InputDecoration(
                          hintText: "Id_Resep",
                          labelText: "Id_Resep",
                          border: OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(20.0)
                          )
                      ) ,
                    ),
                    Padding(padding: new EdgeInsets.only(top: 20.0),),

                    DropdownButton(
                      hint: Text("Pilih id_dokter: "),
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                      ),
                      value: valueChoose,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose = newValue;
                        });
                      },
                      items: id_dokter.map((valueItem){
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),

                    )

                  ],

                ),
      ),
            ),
              new RaisedButton(
              child: new Text("OK"),
              color: Colors.red,
              onPressed:(){kirimdata();},
    ),
  ]
        ),

    );

  }
}
