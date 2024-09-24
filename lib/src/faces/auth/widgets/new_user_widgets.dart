import 'package:flutter/material.dart';

//TODO fix this code generatred by an ai DO NOT TRUST
class NewUserWidgets extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<String> labels;
  const NewUserWidgets(
      {super.key, required this.controllers, required this.labels});

  @override
  Widget build(BuildContext context) {
    assert(controllers.length == labels.length,
        'Controllers and labels must have the same length');
    return Column(
      children: List<Widget>.generate(controllers.length, (int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            controller: controllers[index],
            decoration: InputDecoration(
              labelText: labels[index],
            ),
          ),
        );
      }),
    );
  }
}
