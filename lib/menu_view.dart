import 'package:flutter/material.dart';
import 'package:appmenu/menu_data.dart';

class MenusPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Menus"),
      ),
      body: new MenuList(kMenu),
    );
  }
}

class MenuList extends StatelessWidget{
  final List<Menu> _menus;

  MenuList(this._menus);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: new EdgeInsets.symmetric(vertical: 7.0),
      children: _buildMenuList()
    );
  }

  List<_MenuListItem> _buildMenuList(){
    return _menus.map((menu) => _MenuListItem(menu)).toList();
  }

}

class _MenuListItem extends ListTile {

  _MenuListItem(Menu menu) :
        super(
          title : new Text(menu.name),
          subtitle: new Text(menu.description.substring(0,45)+'...'),
          leading: new CircleAvatar(
              child: new Text(menu.price,style: new TextStyle(fontSize: 11.5)),
          )
        );
}
