import 'dart:async';
import 'dart:convert';

import 'package:appmenu/food_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DrinksPage extends StatefulWidget {
  @override
  _DrinksPageState createState() => _DrinksPageState();
}

class _DrinksPageState extends State<DrinksPage> {
  List _data;

  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull(
            "https://my-json-server.typicode.com/Daniss4/letterFood/drink"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      _data = json.decode(response.body);
    });
//  print(_data[1]["name"]);
    return "Success!"; // returns a List type
  }

  @override
  void initState() {
    this.getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Bebidas"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.local_pizza),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new FoodsPage()));
              }),
        ],
      ),
      body: new ListView.builder(
          itemCount: _data == null ? 0 : _data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Column(
              children: <Widget>[
                new Divider(height: 8.0),
                new ListTile(
                    title: Text(
                      ("${_data[index]['name']}"),
                      style: new TextStyle(
                          fontSize: 19.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                        "${_data[index]['price'].toStringAsFixed(2)}€",
                        style: new TextStyle(fontSize: 22.0)),
                    onTap: () {
                      _showOnTapMessage(context, _data[index]['name']);
                      _saved(context, _data[index]['name']);
                    }),
              ],
            );
          }),
//      floatingActionButton: new FloatingActionButton(
//        child: new Icon(Icons.add_shopping_cart),
//        onPressed: (){
//          Navigator.push(
//            context,
//            new MaterialPageRoute(builder: (context) => new ShoppingCart()));
//        },
//        backgroundColor: Colors.lightBlue,
//      ),
    );
  }
}

void _showOnTapMessage(BuildContext context, String _name) {
  var alert = new AlertDialog(
    title: Text("Pedido"),
    content: Text("1x " + _name + " añadido al pedido."),
    actions: <Widget>[
      FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}

List _order = [];

void _saved(BuildContext context, String _name) {
  _order.add(_name);

  print(_order);
}
