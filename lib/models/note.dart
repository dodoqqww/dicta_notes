import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Note {
  String id;
  String categoryId;
  DateTime date;
  String content;

  Note(
      {this.categoryId = "uncategorized",
      @required this.date,
      @required this.content}) {
    id = "note-" + const Uuid().v1();
  }

  @override
  String toString() {
    return 'Transaction(id: $id, categoryId: $categoryId, date: $date, desc: $content)';
  }
}
