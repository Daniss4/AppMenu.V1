import 'dart:async';
import 'dart:convert';

import 'package:appmenu/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Order {
  final int idMesa;
  final List platos;
  final List bebidas;
  final double finalPrice;

  const Order(this.idMesa, this.platos, this.bebidas, this.finalPrice);
}

class ShoppingCart extends StatefulWidget {
  final String table;

  ShoppingCart({Key key, this.table}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int _num;

  @override
  void initState() {
    getNumPreference().then(updateNum);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    String _table = ('${widget.table}');
//    print(_table);
    return new Scaffold(
      appBar: AppBar(
        title: Text("Pedido mesa $_num"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
//      bottomNavigationBar: new BottomNavigationBar(items: [
//        new BottomNavigationBarItem(icon: new Icon(Icons.build), title: new Text("€")),
//        new BottomNavigationBarItem(icon: new Icon(Icons.add), title: new Text("Pedir"))
//      ]),
    );
  }

  void updateNum(int num) {
    setState(() {
      this._num = num;
    });
  }
}

Future<Map> postData(Map data) async {
  http.Response response = await http.post(
      "https://my-json-server.typicode.com/Daniss4/letterFood/order",
      body: {}); // post api call
  Map data = json.decode(response.body);
  return data;
}
