import 'dart:async';

import 'package:appmenu/index.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new MaterialApp(
    //El método 'runApp' se encarga de ejecutar el widget que se le indica
    home: new Index(), //El atributo 'home:' es el que indica el widget
  ));
}

class Table {
  final int num; //Variable 'num'

  const Table(this.num);
}

class Index extends StatefulWidget {
  //Para crear un widget es necesario crear una clase que extienda de 'StatefulWidget' o de 'StatelessWidget'

  @override //La anotación 'override' indica sobreescritura de una clase superior con el mismo nombre
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  Table selectedTable;
  List<Table> tables = <Table>[
    const Table(1),
    const Table(2),
    const Table(3),
    const Table(4),
    const Table(5),
    const Table(6),
    const Table(7)
  ];

  @override
  Widget build(BuildContext context) {
    // Representa la parte de la interfaz de usuario que será presentada en la vista de la aplicación
    return new Scaffold(
        // Crea una vista para los widget con "material design"
        appBar: new AppBar(
          // Defina la barra superior del widget
          title: Text('Mesa'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: new Container(
          //
          margin: EdgeInsets.only(top: 130.0, left: 10.0, right: 15.0),
          child: new ListView(
            children: <Widget>[
              new ListTile(
                title: new Text("Seleccione una mesa"),
              ),
              new Container(
                margin: EdgeInsets.symmetric(horizontal: 25.5),
                child: new DropdownButton<Table>( //
                    value: selectedTable,
                    items: tables.map((Table table) {
                      return new DropdownMenuItem<Table>(
                        value: table,
                        child: new Text(table.num.toString()),
                      );
                    }).toList(),
                    onChanged: (Table newValue) {
                      setState(() {
                        selectedTable = newValue;
                      });
                    }),
              ),
              new ListTile(
                title: new RaisedButton(
                    child: new Text('Continuar'),
                    onPressed: () {
                      saveNum();
                    }),
              )
            ],
          ),
        ));
  }

  void saveNum() {
    int num = selectedTable.num;
    var router = new MaterialPageRoute(
        builder: (BuildContext context) => new IndexWidget());
    saveNumPreference(num).then((bool) {
      Navigator.of(context).push(router); //
    });
  }
}

Future<bool> saveNumPreference(int num) async {
  SharedPreferences prefs = await SharedPreferences.getInstance(); //
  prefs.setInt("mesa", num);

  return true;
}

Future<int> getNumPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int num = prefs.get("mesa");

  return num;
}
