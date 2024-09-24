
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget{
  final VoidCallback onPressedAction;
  const NextButton({super.key, required this.onPressedAction});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedAction,
      child: const Icon(Icons.arrow_forward, color: Colors.black, size: 30),
    );
  }
}