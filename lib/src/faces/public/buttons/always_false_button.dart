import 'package:flutter/material.dart';

class AlwaysFalseButton extends StatelessWidget {
  final String text;

  const AlwaysFalseButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop(false); // Always return false when pressed
      },
      child: Text(text),
    );
  }
}
