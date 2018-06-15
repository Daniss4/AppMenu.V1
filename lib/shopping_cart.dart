import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShoppingCart extends StatefulWidget {
  final String table;

  ShoppingCart({ Key key, this.table }) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    String _tab = ('${widget.table}');
    print(_tab);
    return new Scaffold(
      appBar: AppBar(
        title: Text("Carrito"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }
}

Future<Map> postData(Map data) async {
  http.Response res = await http.post("https://my-json-server.typicode.com/Daniss4/letterFood/order", body: {}); // post api call
  Map data = json.decode(res.body);
  return data;
}