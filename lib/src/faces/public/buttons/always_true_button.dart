import 'package:flutter/material.dart';

class AlwaysFalseButton extends StatelessWidget {
  final String text;

  const AlwaysFalseButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop(true); // Always return true when pressed
      },
      child: Text(text),
    );
  }
}
