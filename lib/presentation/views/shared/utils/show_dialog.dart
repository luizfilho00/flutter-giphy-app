import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context,
    {String message, Function retryAction}) {
  Future.microtask(() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Text(message ??
                "Parece que estamos com algum problema, por favor tente novamente mais tarde. 🤒"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  retryAction ?? retryAction();
                },
                child: Text("Ok"),
              )
            ],
          )));
}
