import 'dart:developer';

import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("CategoriesScreen build()", name: "screenLog");
    return const Center(
      child: Text("categories_screen"),
    );
  }
}
