import 'package:flutter/material.dart';

class LeftBubbleChat extends StatelessWidget {
  
  final String text;
  
  const LeftBubbleChat(
    this.text, {
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8)
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      )
    );
  }
}