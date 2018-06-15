import 'package:flutter/material.dart';
import 'package:appmenu/food_view.dart';
import 'package:appmenu/drink_view.dart';

class IndexWidget extends StatefulWidget {
  final String table;

  IndexWidget({ Key key, this.table }) : super(key: key);

  @override
  _IndexWidget createState() => new _IndexWidget();
}

class _IndexWidget extends State<IndexWidget> {


  @override
  Widget build(BuildContext context) {
    String _tab = ('${widget.table}');
    print(_tab);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Carta"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
        body: new Center(
        child:
        new Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            new Container(
              child:
              new RaisedButton(
                child: new Text('Platos'),
                onPressed: _platos
              )
            ),
            new Container(
              margin: const EdgeInsets.only(top: 12.0),
              child:
              new RaisedButton(
                child: new Text('Bebidas'),
                onPressed: _bebidas
              )
            )
          ]
        ),
      )
    );
  }

  void _platos() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context){
          return new Scaffold(
            body: FoodsPage(),
          );
        })
    );
  }

  void _bebidas() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context){
          return new Scaffold(
            body: DrinksPage(),
          );
        })
    );
  }
}