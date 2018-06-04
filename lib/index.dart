import 'package:flutter/material.dart';
import 'package:appmenu/drink_view.dart';
import 'package:appmenu/food_view.dart';

class IndexWidget extends StatefulWidget {
  final String _appBarTitle;

  IndexWidget(this._appBarTitle, { Key key }) : super(key: key);

  @override
  _IndexWidget createState() => new _IndexWidget(_appBarTitle);
}

class _IndexWidget extends State<IndexWidget> {
  final String _appBarTitle;


  _IndexWidget(this._appBarTitle);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(this._appBarTitle)
      ),
      body: new Center(
        child:
        new Column(
          children: [
            new Container(
              margin: const EdgeInsets.only(top: 250.0),
              child:
              new MaterialButton(
                child: new Text('Platos'),
                onPressed: _platos
              )
            ),
            new Container(
              margin: const EdgeInsets.only(top: 15.0),
              child:
              new MaterialButton(
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