import 'dart:developer';

import 'package:dicta_notes/providers/bottom_nav_provider.dart';
import 'package:dicta_notes/ui/screens/categories_screen.dart';
import 'package:dicta_notes/ui/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/main_screen.dart';

class BottomNavigation extends StatelessWidget {
  final currentTab = [
    const MainScreen(),
    const CategoriesScreen(),
    const SettingsScreen(),
  ];

  BottomNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("AppNavigations build()", name: "screenLog");
    var provider = Provider.of<NavigationProvider>(context);

    return SafeArea(
        child: Scaffold(
            body: Container(child: currentTab[provider.currentIndex]),
            bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: "Main"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), label: "Categories"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "Settings"),
                ],
                currentIndex: provider.currentIndex,
                onTap: (int i) => {provider.changeIndex(i)})));
  }
}
