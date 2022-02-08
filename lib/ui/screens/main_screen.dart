import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dicta_notes/models/note.dart';
import 'package:dicta_notes/ui/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("MainScreen build()", name: "screenLog");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uncategorised notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: MainScreenGridView(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => log("Pushed 'Add note' button", name: "buttonLog"),
        icon: const Icon(Icons.mic),
        label: const Text("Add note"),
      ),
    );
  }
}

class MainScreenGridView extends StatelessWidget {
  MainScreenGridView({Key key}) : super(key: key);

  List<Note> list = [
    Note(
        date: DateTime.now(),
        content:
            "nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu nagyonhosszu "),
    Note(
        date: DateTime.now(),
        content:
            "kevesbehosszu kevesbehosszu kevesbehosszu kevesbehosszu kevesbehosszu kevesbehosszu kevesbehosszu kevesbehosszu kevesbehosszu kevesbehosszu kevesbehosszu "),
    Note(
        date: DateTime.now(),
        content: "kissebb kissebb kissebb kissebb kissebb kissebb kissebb"),
    Note(date: DateTime.now(), content: "legeskissebb"),
  ];

  @override
  Widget build(BuildContext context) {
    log("MainScreenGridView build()", name: "screenLog");
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) =>
          _gridViewItem(list[index]),
      staggeredTileBuilder: (int index) => _getStaggeredTile(list[index]),
      mainAxisSpacing: 0.5,
      crossAxisSpacing: 0,
    );
  }

  Widget _gridViewItem(Note note) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: getAppCardStyle(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: AutoSizeText(
            note.content,
            style: const TextStyle(fontSize: 12),
            maxLines: _getMaxLines(note.content),
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 1.5,
          ),
        ),
      ),
    );
  }

  StaggeredTile _getStaggeredTile(Note note) {
    int charCount = note.content.length;
    if (charCount > 110) {
      return const StaggeredTile.extent(2, 190.0);
    } else if (charCount > 80) {
      return const StaggeredTile.extent(2, 150.0);
    } else if (charCount > 30) {
      return const StaggeredTile.extent(2, 85.0);
    }
    return const StaggeredTile.extent(2, 60.0);
  }

  int _getMaxLines(String content) {
    int charCount = content.length;
    if (charCount > 130) {
      return 7;
    } else if (charCount > 80) {
      return 5;
    } else if (charCount > 25) {
      return 2;
    }
    return 1;
  }
}
