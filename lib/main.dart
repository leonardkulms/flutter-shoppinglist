import 'package:flutter/material.dart';
import 'components/ShoppingList.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Shopping app',
    home: ShoppingList(),
  ));
}
