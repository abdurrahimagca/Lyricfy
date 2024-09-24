
import 'package:flutter/material.dart';

class TextInput  extends StatelessWidget{
  final TextEditingController controller;
  final String label;
  final String placeholder;
  const TextInput({super.key,  required this.controller,required this.label,required this.placeholder});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(label),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: placeholder
          ),
        ),
    ],
  );
}
}