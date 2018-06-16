//import 'dart:async';

import 'package:appmenu/drink_view.dart';
import 'package:appmenu/food_view.dart';
import 'package:appmenu/shopping_cart.dart';
import 'package:flutter/material.dart';

class IndexWidget extends StatefulWidget {
  IndexWidget({Key key}) : super(key: key);

  @override
  _IndexWidget createState() => new _IndexWidget();
}

class _IndexWidget extends State<IndexWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Carta"),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ShoppingCart()));
                }),
          ],
        ),
        body: new Center(
          child: new Column(mainAxisSize: MainAxisSize.min, children: [
            new Container(
                child: new RaisedButton(
                    child: new Text('Platos'), onPressed: _platos)),
            new Container(
                margin: const EdgeInsets.only(top: 12.0),
                child: new RaisedButton(
                    child: new Text('Bebidas'), onPressed: _bebidas)),
          ]),
        ));
  }

  void _platos() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
        body: FoodsPage(),
      );
    }));
  }

  void _bebidas() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
        body: DrinksPage(),
      );
    }));
  }
}
