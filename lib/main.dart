import 'package:flutter/material.dart';
import 'package:appmenu/index.dart';

void main() {
  runApp(new MaterialApp(
    home: new Index(),
  ));
}

class Table{
  final String num;

  const Table(this.num);
}

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  Table selectedTable;
  List<Table> tables = <Table>[const Table('1'), const Table('2'), const Table('3'), const Table('4'), const Table('5')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text ('Mesa'),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
        ),
        body: new Container(
          margin: EdgeInsets.only(top: 130.0, left: 10.0, right: 15.0),
          child: new ListView(
            children: <Widget>[
              new ListTile(
                title: new Text("Seleccione una mesa"),
              ),
              new Container(
                margin: EdgeInsets.symmetric(horizontal: 25.5),
                child: new DropdownButton<Table>(
                  value: selectedTable,
                  items: tables.map((Table table){
                    return new DropdownMenuItem<Table>(
                      value: table,
                      child: new Text(
                        table.num
                      ),
                    );
                  }).toList(),
                  onChanged: (Table newValue){
                    setState(() {
                      selectedTable = newValue;
                    });
                  }
                ),
              ),
              new ListTile(
                title: new RaisedButton(
                  child: new Text('Continuar'),
                  onPressed: () {
                    var router = new MaterialPageRoute(
                      builder: (BuildContext context) => new IndexWidget(table: selectedTable.num,)
                    );
                    if(selectedTable.num == ''){
                      null;
                    }else {
                      Navigator.of(context).push(router);
                    }
                  }
                ),
              )
            ],
          ),
        )
    );
  }
}

