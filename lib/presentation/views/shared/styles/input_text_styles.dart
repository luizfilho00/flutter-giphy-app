import 'package:flutter/material.dart';

abstract class Style {
  Color borderColor;
  Color textColor;
  double fontSize;

  Style(this.borderColor, this.textColor, this.fontSize);
}

class WhiteTextSize18 extends Style {
  WhiteTextSize18() : super(Colors.white, Colors.white, 18.0);
}
