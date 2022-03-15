import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Note {
  String id;
  String categoryId;
  DateTime date;
  String title;
  String content;

  Note(
      {this.categoryId = "uncategorized",
      @required this.date,
      @required this.content,
      @required this.title}) {
    id = "note-" + const Uuid().v1();
  }

  @override
  String toString() {
    return 'Transaction(id: $id, categoryId: $categoryId, date: $date, desc: $content)';
  }
}

getDummyNotes() {
  return [
    Note(
        categoryId: "1",
        date: DateTime.now(),
        title: "testtitle1",
        content: "testnote1"),
    Note(
        categoryId: "2",
        date: DateTime.now(),
        title: "testtitle2",
        content: "testnote2"),
    Note(
        categoryId: "3",
        date: DateTime.now(),
        title: "testtitle3",
        content: "testnote3")
  ];
}
