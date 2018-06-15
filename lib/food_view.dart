import 'dart:async';
import 'dart:convert';

import 'package:appmenu/drink_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FoodsPage extends StatefulWidget {
  @override
  _FoodsPageState createState() => _FoodsPageState();
}

class _FoodsPageState extends State<FoodsPage> {

  List _data;

  Future<String> getData() async {
  http.Response response = await http.get(
    Uri.encodeFull("https://my-json-server.typicode.com/Daniss4/letterFood/food"),
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
        title: Text("Platos"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.local_bar),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new DrinksPage())
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
//      floatingActionButton: new FloatingActionButton(
//        child: new Icon(Icons.add_shopping_cart),
//        onPressed: (){
//          Navigator.push(
//              context,
//              new MaterialPageRoute(builder: (context) => new ShoppingCart()));
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


//class FoodsPage extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Platos principales"),
//        centerTitle: true,
//        backgroundColor: Colors.orangeAccent,
//        actions: <Widget>[
//          new IconButton(
//              icon: new Icon(Icons.local_bar),
//              onPressed: () {
//                Navigator.push(context, new MaterialPageRoute(builder: (context) => new DrinksPage())
//                );
//          }),
//        ],
//      ),
//      body: new FoodList(kFood),
//      floatingActionButton: new FloatingActionButton(
//          child: new Icon(Icons.add_shopping_cart, color: Colors.white,),
//          onPressed: (){
//            Navigator.push(
//                context,
//                new MaterialPageRoute(builder: (context) => new DrinksPage()));
//          }),
//    );
//  }
//}
//
//class FoodList extends StatelessWidget{
//  final List<Food> _menus;
//
//  FoodList(this._menus);
//
//  @override
//  Widget build(BuildContext context) {
//    return new ListView(
//        padding: new EdgeInsets.symmetric(vertical: 13.0),
//        children: _buildFoodList(),
//    );
//  }
//
//  List<_FoodListItem> _buildFoodList(){
//    return _menus.map((food) => _FoodListItem(food)).toList();
//  }
//}
//
//class _FoodListItem extends ListTile {
//
//  _FoodListItem(Food food) :
//        super(
//          title : new Text(food.name, style: new TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
//          trailing: new Text(food.price.toStringAsFixed(2)+'€', style: new TextStyle(fontSize: 22.0)),
//        );
//}
//
//void _showOnTapMessage(BuildContext context, String _name) {
//  var alert = new AlertDialog(
//    title: Text("Pedido"),
//    content: Text("1x " + _name + " añadido al pedido."),
//    actions: <Widget>[
//      FlatButton(
//        child: Text("OK"),
//        onPressed: () {
//          Navigator.pop(context);
//        },)
//    ],
//  );
//  showDialog(context: context, builder: (context) => alert);
//}

//Future<List> getJson() async {
//  String apiUrl = 'https://my-json-server.typicode.com/Daniss4/letterFood/food';
//
//  http.Response response = await http.get(apiUrl);
//
//  return json.decode(response.body); // returns a List type
//}

//class Platos extends StatefulWidget {
//  final String numTable;
//
//  Platos({Key key, this.numTable}) : super(key: key);
//
//  @override
//  _PlatosState createState() => _PlatosState();
//}
//
//class _PlatosState extends State<Platos> {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        backgroundColor: Colors.greenAccent,
//        actions: <Widget>[
//          new IconButton(icon: new Icon(Icons.local_bar), onPressed: null),
//        ],
//        title: new Text('Platos'),
//        centerTitle: true,
//      ),
//      body: new ListTile(
//        title: new Text('${widget.key}'),
//      ),
//    );
//  }
//}

/*
class foodPage extends StatelessWidget {
  final String title;

  foodPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new FutureBuilder<List>(
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new FoodsList(foods: snapshot.data)
              : new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }
}

class FoodsList extends StatelessWidget {
  final List<Food> foods;

  FoodsList({Key key, this.foods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            new Divider(height: 8.0),
            new ListTile(
                title: Text(
                  ("${foods[index].name}"),
                  style: new TextStyle(fontSize: 19.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
                trailing: Text("${foods[index].price.toStringAsFixed(2)}€",
                    style: new TextStyle(
                        fontSize: 22.0)),

            ),
          ],
        );
      },
    );
  }
}
*/

