import 'package:flutter/material.dart';

class RightBubbleChat extends StatelessWidget {
  
  final String text;
  
  const RightBubbleChat(
    this.text, {
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8)
      ),
      child: Text(
        text,
        textAlign: TextAlign.right,
      )
    );
  }
}