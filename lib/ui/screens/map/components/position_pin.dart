import 'package:flutter/material.dart';

class PositionPin extends StatelessWidget {
  final double size;

  const PositionPin({
    this.size = 24,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.my_location,
      color: Colors.green,
      size: size,
    );
  }
}
