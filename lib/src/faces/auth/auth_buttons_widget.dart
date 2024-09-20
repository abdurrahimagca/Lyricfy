import 'package:flutter/material.dart';
import 'package:lyricfy/src/faces/auth/login_spotify_button.dart';
@override
Widget authButtons(BuildContext context) {
  final loginOrSignup = loginWithSpotify(context); // Get the widget here
  return Column(
    children: [
      loginOrSignup, // Use the widget directly here, no need to call it again
    ],
  );
}
