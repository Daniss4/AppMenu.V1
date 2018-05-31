import 'package:flutter/material.dart';
import 'package:appmenu/drink_data.dart';

class DrinksPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Bebidas"),
      ),
      body: new DrinkList(kDrink),
    );
  }
}

class DrinkList extends StatelessWidget{
  final List<Drink> _menus;

  DrinkList(this._menus);

  @override
  Widget build(BuildContext context) {
    return new ListView(
        padding: new EdgeInsets.symmetric(vertical: 13.0),
        children: _buildFoodList()
    );
  }

  List<_DrinkListItem> _buildFoodList(){
    return _menus.map((drink) => _DrinkListItem(drink)).toList();
  }
}

class _DrinkListItem extends ListTile {

  _DrinkListItem(Drink drink) :
        super(
          title : new Text(drink.name, style: new TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
          trailing: new Text(drink.price.toStringAsFixed(2)+'€', style: new TextStyle(fontSize: 22.0))
      );
}
