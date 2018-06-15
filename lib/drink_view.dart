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
        Uri.encodeFull("https://my-json-server.typicode.com/Daniss4/letterFood/drink"),
        headers: {
          "Accept": "application/json"
        }
    );

    this.setState((){
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
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.local_pizza),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new FoodsPage())
              );
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
                  style: new TextStyle(fontSize: 19.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
                trailing: Text("${_data[index]['price'].toStringAsFixed(2)}€",
                    style: new TextStyle(
                        fontSize: 22.0)),
                onTap: () {
                  _showOnTapMessage(context, _data[index]['name']);
                  _saved(context, _data[index]['name']);
                }
              ),
            ],
          );
        }
      ),
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
        },)
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}

List _order = [];

void _saved (BuildContext context, String _name){
  _order.add(_name);

  print(_order);
}


//class DrinksPage extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Bebidas"),
//        centerTitle: true,
//        backgroundColor: Colors.lightBlueAccent,
//        actions: <Widget>[
//          new IconButton(
//              icon: new Icon(Icons.local_pizza),
//              onPressed: () {
//                Navigator.push(context, new MaterialPageRoute(builder: (context) => new FoodsPage())
//                );
//              }),
//        ],
//      ),
//      body: new DrinkList(kDrink),
//      floatingActionButton: new FloatingActionButton(
//          child: new Icon(Icons.add_shopping_cart, color: Colors.white,),
//          onPressed: (){
//            Navigator.push(
//                context,
//                new MaterialPageRoute(builder: (context) => new FoodsPage()));
//          }),
//    );
//  }
//}
//
//class DrinkList extends StatelessWidget{
//  final List<Drink> _menus;
//
//  DrinkList(this._menus);
//
//  @override
//  Widget build(BuildContext context) {
//    return new ListView(
//        padding: new EdgeInsets.symmetric(vertical: 13.0),
//        children: _buildFoodList()
//    );
//  }
//
//  List<_DrinkListItem> _buildFoodList(){
//    return _menus.map((drink) => _DrinkListItem(drink)).toList();
//  }
//}
//
//class _DrinkListItem extends ListTile {
//
//  _DrinkListItem(Drink drink) :
//        super(
//          title : new Text(drink.name, style: new TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
//          trailing: new Text(drink.price.toStringAsFixed(2)+'€', style: new TextStyle(fontSize: 22.0))
//      );
//}

//Future<List> getJson() async {
//  String apiUrl = 'https://my-json-server.typicode.com/Daniss4/letterFood/drink';
//
//  http.Response response = await http.get(apiUrl);
//
//  return json.decode(response.body); // returns a List type
//}