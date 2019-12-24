import 'package:flutter/material.dart';

class LoadingPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  final Alignment alignment;
  final double strokeWidth;
  final Color color;

  LoadingPlaceholder(
      {this.width, this.height, this.alignment, this.strokeWidth, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 200.0,
      height: height ?? 200.0,
      alignment: alignment ?? Alignment.center,
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.white),
          strokeWidth: strokeWidth ?? 5.0),
    );
  }
}
