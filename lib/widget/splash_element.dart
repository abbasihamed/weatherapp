import 'package:flutter/material.dart';

class SplashElements extends StatelessWidget {
  final Size? size;
  final BorderRadius? borderRadius;
  final Alignment alignment;

  SplashElements({this.size, this.borderRadius, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        height: size!.height * 0.22,
        width: size!.width * 0.35,
        decoration:
            BoxDecoration(color: Colors.blue, borderRadius: borderRadius),
      ),
    );
  }
}
