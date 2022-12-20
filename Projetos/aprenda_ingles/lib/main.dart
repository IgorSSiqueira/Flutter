import 'package:aprenda_ingles/telas/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.purple,
      //accentColor:
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green),
    ),
  ));
}
