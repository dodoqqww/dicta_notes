import 'dart:developer';

import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("MainScreen build()", name: "screenLog");
    return const Center(
      child: Text("main_screen"),
    );
  }
}
