import 'package:flutter/material.dart';

Future<bool?> showQuestionPop(BuildContext context, String question) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false, // User must tap a button
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Question'),
        content: Text(question),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop(false); // Return 'false' when No is pressed
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(true); // Return 'true' when Yes is pressed
            },
          ),
        ],
      );
    },
  );
}
