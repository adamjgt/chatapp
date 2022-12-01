import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    this.child,
    this.color,
    this.height,
    this.width,
    this.alignment,
    Key? key,
  }) : super(key: key);
  final color;
  final child;
  final height;
  final width;
  final alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      height: height,
      width: width,
      child: child,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black),
          boxShadow: const [
            BoxShadow(
              offset: Offset(2, 2),
            )
          ]),
    );
  }
}
