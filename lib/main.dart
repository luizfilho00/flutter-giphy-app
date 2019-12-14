import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(accentColor: Colors.white, hintColor: Colors.white),
  ));
}
