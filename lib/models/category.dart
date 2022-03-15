import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Category {
  String id;
  String name;
  int colorCode;

  Category({@required this.id, @required this.name, @required this.colorCode}) {
    // id = "trxCategory-" + const Uuid().v1(); // TODO UI teszt végén vissza rakni
  }

  Color getColor() {
    return MaterialColor(colorCode, null);
  }
}

getDummyCategories() {
  return [
    Category(id: "1", name: "dummy1", colorCode: Colors.blue.value),
    Category(id: "2", name: "dummy2", colorCode: Colors.red.value),
    Category(id: "3", name: "dummy3", colorCode: Colors.orange.value)
  ];
}
