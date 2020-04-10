import 'package:flutter/material.dart';

Widget Button(Function function, IconData icon) {
  return FloatingActionButton(
    onPressed: function,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    backgroundColor: Color.fromRGBO(34,139,34, 50),
    child: Icon(
      icon,
      size: 30.0,
    ),
  );
}