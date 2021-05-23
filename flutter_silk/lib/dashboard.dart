import 'package:flutter/material.dart';
import 'package:flutter_silk/Farmasi/dbFarmasi.dart';
//import 'file:///D:/ProgWeb/xaamp/htdocs/SILK2020/flutter_silk/lib/Pendaftaran/pendaftaran.dart';
import 'package:flutter_silk/Pendaftaran/pendaftaran2.dart';


class dashboard extends StatefulWidget {  //<~~~
  dashboard({Key key, this.title}) : super(key: key);  //<~~~~

  final String title;

  @override
  _dashboardState createState() => _dashboardState();  //<~~~~
}

class _dashboardState extends State<dashboard> {    //<~~


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Account"), //<~~~~~
              accountEmail: Text("Account@si.ukdw.ac.id"), //<~~~~
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.lightBlueAccent,
                child: Text(
                  "DP", //<~ ~~~~~
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Pendaftaran"),    //<~~~~
              trailing: Icon(Icons.add_box),   //<~~~
              subtitle: Text("Menu Pendaftaran"),  //<~~
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pendaftaran2(title: "PENDAFTARAN")),  //<~~
                );
              },
            ),
            ListTile(
              title: Text("Rawat Jalan"),   //<~~~
              trailing: Icon(Icons.medical_services),   //<~~
              subtitle: Text("Menu Rawat Jalan"),   //<~~~


            ),
            ListTile(
              title: Text("Farmasi"),  //<~~~
              trailing: Icon(Icons.format_align_center_rounded),  //<~~~
              subtitle: Text("Menu Farmasi"),  //<~~~
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dbFarmasi(title: "DASHBOARD Farmasi")),  //<~~~
                );
              },
            ),
            ListTile(
              title: Text("Rekam Medis"),    //<~~~
              trailing: Icon(Icons.format_align_center_outlined),  //<~~~~
              subtitle: Text("Menu Rekam Medis"),   //<~~~

            ),
            Divider(
              color: Colors.black,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
      ),
      body: Container(
          child: Center(
            child: Text("HOME",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
          )
      ),
    );
  }
}