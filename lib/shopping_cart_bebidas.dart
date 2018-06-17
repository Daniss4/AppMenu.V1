import 'dart:async';
import 'dart:convert';

import 'package:appmenu/index.dart';
import 'package:appmenu/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCartBebidas extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCartBebidas> {
  int _num;
  List _orderName;
  double _orderPrice;

  @override
  void initState() {
    getNumPreference().then(updateNum);
    getMenuNamePreference().then(updateMenuName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nameItems = _orderName;
    print(nameItems);

    return new Scaffold(
        appBar: AppBar(
          title: Text("Pedido mesa $_num"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: new ListView.builder(
            itemCount: nameItems == null ? 0 : nameItems.length,
            itemBuilder: (context, int index) {
              return new Column(
                children: <Widget>[
                  new Divider(height: 8.0),
                  new ListTile(
                    title: Text(
                      ("${nameItems[index]}"),
                      style: new TextStyle(
                          fontSize: 19.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: new IconButton(
                        onPressed: () {
                          removeItem();
                        },
                        icon: new Icon(Icons.delete_forever),
                        color: Colors.black54),
                  ),
                ],
              );
            }),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.done_all),
          onPressed: () {
            _showOnTapMessage(context);
            removeMenuPreference();
          },
          backgroundColor: Colors.lightBlue,
        ));
  }

  void updateNum(int num) {
    setState(() {
      this._num = num;
    });
  }

  void updateMenuName(List _orderName) {
    setState(() {
      this._orderName = _orderName;
    });
  }
}

void _showOnTapMessage(BuildContext context) {
  var alert = new AlertDialog(
    title: Text("¡Pedido realizado!"),
    actions: <Widget>[
      FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new IndexWidget()));
        },
      )
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}

Future<List> getMenuNamePreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List _orderName = prefs.get("orderBebidas");

  return _orderName;
}

Future removeMenuPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("orderBebidas");

  return true;
}

void removeItem() {}

Future<Map> postData(Map data) async {
  http.Response response = await http.post(
      "https://my-json-server.typicode.com/Daniss4/letterFood/order",
      body: {}); // post api call
  Map data = json.decode(response.body);
  return data;
}
