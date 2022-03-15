import 'dart:developer';

import 'package:audio_wave/audio_wave.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dicta_notes/models/note.dart';
import 'package:dicta_notes/ui/common/animations.dart';
import 'package:dicta_notes/ui/common/style.dart';
import 'package:dicta_notes/ui/common/widgets/add_category_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("MainScreen build()", name: "screenLog");
    return Scaffold(
      appBar: AppBar(
        title: Text("Uncategorised notes",
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: _MainScreenGridView(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {
          log("Pushed 'Add note' button", name: "buttonLog"),
          openDialog(context, const _AddNoteDialog())
        },
        icon: const Icon(Icons.mic),
        label: Text("Add note",
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(color: Colors.white)),
      ),
    );
  }
}

class _MainScreenGridView extends StatelessWidget {
  _MainScreenGridView({Key key}) : super(key: key);

  final List<Note> list = [
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
    log("_MainScreenGridView build()", name: "screenLog");
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) =>
          _gridViewItem(list[index], context),
      staggeredTileBuilder: (int index) => _getStaggeredTile(list[index]),
      mainAxisSpacing: 0.5,
      crossAxisSpacing: 0,
    );
  }

  Widget _gridViewItem(Note note, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: getAppCardStyle(
        child: InkWell(
          onTap: () {
            log("Pushed 'Note' item", name: "buttonLog");
            openDialog(context, const _CategorizeNoteDialog());
          },
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

class _AddNoteDialog extends StatelessWidget {
  const _AddNoteDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("_AddNoteDialog build()", name: "screenLog");
    return Material(
        type: MaterialType.transparency,
        // make sure that the overlay content is not cut off
        child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 25),
            child: getAppCardStyle(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back)),
                            const Spacer(),
                            Text("New note",
                                style: Theme.of(context).textTheme.headline2),
                            const Spacer(),
                            const FloatingActionButton(
                              child: Icon(Icons.save),
                              backgroundColor: Colors.green,
                              // onPressed: () {
                              //  //TODO implement save note
                              // },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        //Text("asd"),
                        TextField(
                            decoration:
                                getAppTextFieldDecoration(context: context),
                            keyboardType: TextInputType.multiline,
                            maxLines: 25),
                        const SizedBox(
                          height: 25,
                        ),
                        _voiceAnimation(false)
                      ],
                    )))));
  }

  Widget _voiceAnimation(bool isRecord) {
    return InkWell(
      onTap: () {
        log("Pushed 'Add note Start/Stop' button", name: "buttonLog");
        //TODO implement voice record
      },
      child: Container(
        width: 120,
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xAA6EB1E6),
              offset: Offset(9, 9),
              blurRadius: 6,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: isRecord
            ? AudioWave(
                height: 50,
                width: 100,
                spacing: 2.5,
                animationLoop: 0,
                beatRate: const Duration(milliseconds: 100),
                bars: [
                  AudioWaveBar(height: 10, color: Colors.black),
                  AudioWaveBar(height: 30, color: Colors.black),
                  AudioWaveBar(height: 70, color: Colors.black),
                  AudioWaveBar(height: 40, color: Colors.black),
                  AudioWaveBar(height: 20, color: Colors.black),
                  AudioWaveBar(height: 10, color: Colors.black),
                  AudioWaveBar(height: 30, color: Colors.black),
                  AudioWaveBar(height: 70, color: Colors.black),
                  AudioWaveBar(height: 40, color: Colors.black),
                  AudioWaveBar(height: 20, color: Colors.black),
                  AudioWaveBar(height: 10, color: Colors.black),
                  AudioWaveBar(height: 30, color: Colors.black),
                  AudioWaveBar(height: 70, color: Colors.black),
                  AudioWaveBar(height: 40, color: Colors.black),
                  AudioWaveBar(height: 20, color: Colors.black),
                  AudioWaveBar(height: 10, color: Colors.black),
                  AudioWaveBar(height: 30, color: Colors.black),
                  AudioWaveBar(height: 70, color: Colors.black),
                  AudioWaveBar(height: 40, color: Colors.black),
                  AudioWaveBar(height: 20, color: Colors.black),
                ],
              )
            : const SizedBox(
                height: 50,
                width: 100,
                child: Icon(
                  Icons.mic,
                  color: Colors.white,
                )),
      ),
    );
  }
}

class _CategorizeNoteDialog extends StatelessWidget {
  const _CategorizeNoteDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("_CategorizeNoteDialog() build()", name: "screenLog");
    return Material(
        type: MaterialType.transparency,
        // make sure that the overlay content is not cut off
        child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 25),
            child: getAppCardStyle(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back)),
                            const Spacer(),
                            Text("Categorization",
                                style: Theme.of(context).textTheme.headline2),
                            const Spacer(),
                            const FloatingActionButton(
                              child: Icon(Icons.save),
                              backgroundColor: Colors.green,
                              // onPressed: () {
                              //  //TODO implement save note
                              // },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //Text("asd"),
                        TextField(
                            decoration: getAppTextFieldDecoration(
                                context: context, labelText: "Title"),
                            keyboardType: TextInputType.multiline,
                            maxLines: 1),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 305,
                              child: InputDecorator(
                                decoration: getAppTextFieldDecoration(
                                    labelText: "Category", context: context),
                                child: DropdownButtonHideUnderline(
                                  child: SizedBox(
                                    height: 25,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: DropdownButton<String>(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        value: "asd",
                                        items: const [
                                          DropdownMenuItem<String>(
                                            child: Text("asd"),
                                            value: "asd",
                                          ),
                                          DropdownMenuItem<String>(
                                            child: Text("dsa"),
                                            value: "dsa",
                                          )
                                        ],
                                        //onChanged:
                                        //    (TrxCategory newValue) {
                                        //  addEditTrxScreenProvider
                                        //      .changeSelectedAddCategory(
                                        //          newValue);
                                        //},
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                openAddCategoryDialog(context);
                              },
                              child: const Icon(
                                Icons.add_rounded,
                                color: Colors.blue,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                            decoration:
                                getAppTextFieldDecoration(context: context),
                            keyboardType: TextInputType.multiline,
                            maxLines: 25),
                      ],
                    )))));
  }
}
