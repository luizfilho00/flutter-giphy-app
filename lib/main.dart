import 'package:flutter/material.dart';
import 'package:mymovies/presentation/graph/injector.dart';
import 'package:mymovies/presentation/views/home/home.dart';

void main() {
  Injector.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.white,
        hintColor: Colors.white,
      ),
    );
  }
}
