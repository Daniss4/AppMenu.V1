import 'dart:async';
import 'dart:convert';
import 'package:flutter/http.dart' as http;

class Menu {
  final String name;
  final String description;
  final double price;

  Menu({this.name, this.description, this.price});

  factory Menu.fromJson(Map<String, dynamic> json){
    return new Menu(
        name: json['name'],
        description: json['description'],
        price: json['price']
    );
  }
}

Future<Menu> fetchPost() async {
  // ignore: undefined_function
  final response = await http.get('https://my-json-server.typicode.com/Daniss4/letterFood/food');
  final responseJson = json.decode(response.name);

  return new Menu.fromJson(responseJson);
}

/*
class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}*/
