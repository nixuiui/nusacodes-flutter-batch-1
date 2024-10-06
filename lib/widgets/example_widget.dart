import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget {

  final String text;
  final int number;
  
  // positional parameter
  // named parameter
  const ExampleWidget(
    this.text, {
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text),
        Text("$number"),
      ],
    );
  }
}