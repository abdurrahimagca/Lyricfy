import 'package:flutter/material.dart';
import 'package:lyricfy/generated/l10n.dart';
import 'package:lyricfy/src/faces/auth/auth_buttons_widget.dart';


class PreHomeScreen extends StatelessWidget {
  const PreHomeScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
     Widget authWidget = authButtons(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).welcomeHeader),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ok"),
          ],
        ),
      ),
    );
  }
}