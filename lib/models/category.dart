import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Category {
  String id;
  String name;
  //int colorCode;

  Category({@required this.name}) {
    id = "trxCategory-" + const Uuid().v1();
  }
}
