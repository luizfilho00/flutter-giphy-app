import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:mymovies/view/home/bloc/home_bloc.dart';
import 'package:mymovies/view/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => HomeBloc())],
      child: MaterialApp(
        home: HomePage(),
        theme: ThemeData(hintColor: Colors.white),
      ),
    );
  }
}
