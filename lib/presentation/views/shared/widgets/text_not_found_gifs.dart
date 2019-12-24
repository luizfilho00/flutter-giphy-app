import 'package:flutter/material.dart';

class TextNotFoundGifs extends StatelessWidget {
  final String text;

  TextNotFoundGifs({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(text ?? "Nenhum GIF encontrado 😭",
            style: TextStyle(color: Colors.white, fontSize: 18.0)));
  }
}
