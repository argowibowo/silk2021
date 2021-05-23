import 'package:flutter/material.dart';
//import 'package:flutter_silk/Farmasi/Detail%20Resep/dbDetailResep.dart';
import 'package:flutter_silk/Farmasi/Obat/dbObat.dart';
import 'package:flutter_silk/Farmasi/Resep/dbResep.dart';

class dbFarmasi extends StatefulWidget {  //<~~~
  dbFarmasi({Key key, this.title}) : super(key: key);  //<~~~~

  final String title;

  @override
  _dbFarmasiState createState() => _dbFarmasiState();  //<~~~~
}

class _dbFarmasiState extends State<dbFarmasi> {    //<~~


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(""), //<~~~~~/<~~~~
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.lightBlueAccent,
                child: Text(
                  " ", //<~ ~~~~~
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Obat"),    //<~~~~
              trailing: Icon(Icons.add_circle_outline),   //<~~~
              subtitle: Text("Data Obat"),  //<~~
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dbObat(title: "Obat")),  //<~~~
                );
              },
            ),
            ListTile(
              title: Text("Resep"),   //<~~~
              trailing: Icon(Icons.book),   //<~~
              subtitle: Text("Data Resep"),   //<~~~
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dbResep(title: "Resep")),  //<~~~
                );
              },
            ),
            Divider(
              color: Colors.blue,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
      ),
      body: Container(
          child: Center(
            child: Text("Farmasi",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
          )
      ),
    );
  }
}
