import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primarySwatch: Colors.blue,
  secondaryHeaderColor: Colors.blue[300],
  shadowColor: Colors.lightBlue,
  iconTheme: const IconThemeData(size: 40),
  textTheme: const TextTheme(
    // screen titles
    headline1: TextStyle(
        fontSize: 32, fontWeight: FontWeight.w400, color: Colors.black),
    //
    headline2: TextStyle(fontSize: 26, color: Colors.black),
    // FAB title
    headline3: TextStyle(fontSize: 22, color: Colors.black),
    //
    bodyText1: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.black),
    //
    bodyText2: TextStyle(fontSize: 16.0),
  ),
);
