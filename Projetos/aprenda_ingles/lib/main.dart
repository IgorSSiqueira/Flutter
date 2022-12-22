// @dart=2.9

import 'package:aprenda_ingles/telas/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const Home(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xff795548),
        secondary: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xfff5e9b9),
    ),
  ));
}
