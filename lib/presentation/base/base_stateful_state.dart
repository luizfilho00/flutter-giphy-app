import 'package:flutter/material.dart';
import 'package:mymovies/presentation/base/base_bloc.dart';

class BaseState<T> extends State<StatefulWidget> {
  List<BaseBloc> blocs;

  BaseState({this.blocs});

  @override
  Widget build(BuildContext context) {
    return Text("You have to override this (:");
  }

  @override
  void dispose() {
    super.dispose();
    blocs.forEach((bloc) => bloc.dispose());
  }
}
