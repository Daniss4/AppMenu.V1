import 'dart:async';
import 'dart:convert';

import 'package:appmenu/drink_view.dart';
import 'package:appmenu/shopping_cart_platos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FoodsPage extends StatefulWidget {
  @override
  _FoodsPageState createState() => _FoodsPageState();
}

class _FoodsPageState extends State<FoodsPage> {
  List _data;
  List<String> _orderName = [];
//  double _orderPrice;

  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull(
            "https://my-json-server.typicode.com/Daniss4/letterFood/food"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      _data = json.decode(response.body);
      print(_data);
    });
    return "Success!"; // Devuelve un tipo Lista
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
        title: Text("Platos"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.local_bar),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new DrinksPage()));
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
                      saveMenu(_data[index]['name']);
                    }),
              ],
            );
          }),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add_shopping_cart),
        onPressed: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new ShoppingCartPlatos()));
        },
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }

  void saveMenu(String _name) {
    _orderName.add(_name);
    List _menuName = _orderName;
    saveMenuNamePreference(_menuName);

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

Future<bool> saveMenuNamePreference(List _orderName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList("orderPlatos", _orderName);

  return true;
}
