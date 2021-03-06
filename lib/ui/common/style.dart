import 'package:flutter/material.dart';

// app divider
class AppListItemDivider extends StatelessWidget {
  final Color color;

  const AppListItemDivider({Key key, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 5,
      color: color,
    );
  }
}

// textfield decoration
InputDecoration getAppTextFieldDecoration(
    {String labelText = "",
    String hintText = "",
    @required BuildContext context}) {
  return InputDecoration(
    labelStyle: Theme.of(context).textTheme.bodyText1,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Colors.blue, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Colors.blue, width: 1.0),
    ),
    filled: true,
    contentPadding: const EdgeInsets.all(10),
    labelText: labelText,
    hintText: hintText,
  );
}

// card shape
Card getAppCardStyle({@required Widget child, Color color = Colors.white}) {
  return Card(
    elevation: 20,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    child: child,
  );
}
