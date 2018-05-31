import 'package:flutter/material.dart';
import 'package:appmenu/food_data.dart';

class FoodsPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Platos principales"),
      ),
      body: new FoodList(kFood),
    );
  }
}

class FoodList extends StatelessWidget{
  final List<Food> _menus;

  FoodList(this._menus);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: new EdgeInsets.symmetric(vertical: 13.0),
      children: _buildFoodList()
    );
  }

  List<_FoodListItem> _buildFoodList(){
    return _menus.map((food) => _FoodListItem(food)).toList();
  }
}

class _FoodListItem extends ListTile {

  _FoodListItem(Food food) :
        super(
          title : new Text(food.name, style: new TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
          subtitle: new Text(food.description.substring(0,70)+'...'),
          trailing: new Text(food.price.toStringAsFixed(2)+'€', style: new TextStyle(fontSize: 22.0))
          );
}
