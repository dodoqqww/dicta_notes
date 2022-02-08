import 'dart:developer';

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("SettingsScreen build()", name: "screenLog");
    return const Center(
      child: Text("settings_screen"),
    );
  }
}
