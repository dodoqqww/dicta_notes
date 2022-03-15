import 'dart:developer';

import 'package:dicta_notes/models/category.dart';
import 'package:dicta_notes/models/note.dart';
import 'package:dicta_notes/ui/common/style.dart';
import 'package:dicta_notes/ui/common/widgets/add_category_dialog.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key key}) : super(key: key);

  final List<Category> dummyCategories = getDummyCategories();

  @override
  Widget build(BuildContext context) {
    log("CategoriesScreen build()", name: "screenLog");
    return Scaffold(
      appBar: AppBar(
          title: Text("Categories",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(color: Colors.white)),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                size: Theme.of(context).iconTheme.size,
              ),
              tooltip: 'Add category',
              onPressed: () {
                log("Pushed 'Add category' button", name: "buttonLog");
                openAddCategoryDialog(context);
              },
            ),
          ]),
      body: _GetCategoriesList(
        categories: dummyCategories,
      ),
    );
  }
}

class _GetCategoriesList extends StatelessWidget {
  const _GetCategoriesList({@required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _getCategorieItem(categories[index], context);
        });
  }

  Widget _getCategorieItem(Category category, BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                      color: category.getColor(),
                      width: 20,
                    ),
                    bottom: BorderSide(
                      color: category.getColor(),
                      width: 2,
                    ))),
            child: Row(
              children: [
                Text(
                  " " + category.name,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const Spacer(),
                InkWell(
                  child: Icon(
                    Icons.edit,
                    color: category.getColor(),
                  ),
                  onTap: () {
                    log("Pushed 'Edit category' button; id: ${category.id}",
                        name: "buttonLog");
                    // TODO implement edit category dialog
                  },
                )
              ],
            ),
          ),
          Expandable(
            collapsed: ExpandableButton(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  "Show notes",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: category.getColor()),
                ),
              ),
            ),
            expanded: Column(
              children: [
                _getNotesOfCategorie(getDummyNotes(), category),
                ExpandableButton(
                  child: Icon(Icons.arrow_upward, color: category.getColor()),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _getNotesOfCategorie(List<Note> notes, Category category) {
    return SizedBox(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return _getNoteItem(notes[index], category.getColor(), context);
          }),
    );
  }

  Widget _getNoteItem(Note note, Color categoryColor, BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 20),
      trailing: InkWell(
        child: Icon(Icons.info_outline, color: categoryColor),
        onTap: () {
          log("Pushed 'Note info' button; id: ${note.id}", name: "buttonLog");
          // TODO implement open note info
        },
      ),
      title: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
                  color: categoryColor,
                  width: 10,
                ),
                bottom: BorderSide(
                  color: categoryColor,
                  width: 2,
                ))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " " + note.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              " " + note.content,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
