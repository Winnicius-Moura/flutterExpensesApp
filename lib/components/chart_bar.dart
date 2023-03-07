import 'dart:ffi';

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.label, required this.value, required this.percentega});

  final String label;
  final double value;
  final double percentega;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('R\$${value.toStringAsFixed(2)}'),
        const SizedBox(height: 5,),
        const SizedBox(
          height: 60,
          width: 10,
          child: null,
        ),
        const SizedBox(height: 5,),
        Text(label)
      ],
    );
  }
}
