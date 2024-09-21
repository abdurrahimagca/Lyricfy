import 'package:flutter/material.dart';

class OkTypeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const OkTypeButton({super.key, required this.onPressed, required this.text});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
