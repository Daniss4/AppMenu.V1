import 'package:flutter/material.dart';
import 'package:appmenu/menu_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MenusPage(),
    );
  }
}

/* //Widget Mutable
class StatelessWidgetExample extends StatelessWidget {
  final String _appBarTitle;

  StatelessWidgetExample(this._appBarTitle) : super() ;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text(_appBarTitle)
        ),
        body: new Center(
            child: new Text('Demo')
        )
    );
  }
}
*/

//Widget Inmutable
class StatefulWidgetExample extends StatefulWidget {
  final String _appBarTitle;

  StatefulWidgetExample(this._appBarTitle, { Key key }) : super(key: key);

  @override
  _StatefulWidgetExampleState createState() => new _StatefulWidgetExampleState(_appBarTitle);
}

class _StatefulWidgetExampleState extends State<StatefulWidgetExample> {
  final String _appBarTitle;

  int _counter = 0;

  _StatefulWidgetExampleState(this._appBarTitle);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text(this._appBarTitle)
        ),
        body: new Center(
            child: new Text('Botón pulsado $_counter ve${ _counter == 1 ? 'z' : 'ces' }.')
        ),
        floatingActionButton: new FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: new Icon(Icons.favorite)
        )
    );
  }
}
