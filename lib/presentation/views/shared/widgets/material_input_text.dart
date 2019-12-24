import 'package:flutter/material.dart';
import 'package:mymovies/presentation/views/shared/styles/input_text_styles.dart';

class MaterialInputText extends StatelessWidget {
  final String hint;
  final Function(String text) onSubmitted;
  final Function(String text) onChanged;
  final Style style;

  MaterialInputText(
      {this.hint,
      this.onSubmitted,
      this.onChanged,
      this.style});

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            labelText: hint,
            labelStyle: TextStyle(color: style.borderColor),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: style.borderColor)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: style.borderColor)),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: style.borderColor))),
        style: TextStyle(color: style.textColor, fontSize: style.fontSize),
        cursorColor: style.textColor,
        onSubmitted: (text) => onSubmitted(text),
        onChanged: (text) => onChanged(text));
  }
}
