import 'dart:convert';
import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:lyricfy/src/faces/auth/screens/auth_flow_start_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatelessWidget {
  final SupabaseClient _sc = GetIt.I<SupabaseClient>();

  HomeScreen({Key? key}) : super(key: key);

  Future<void> loadContent() async {
    final session = _sc.auth.currentUser;
    dev.log(session != null ? "true" : "false");
    FlutterSecureStorage storage = new FlutterSecureStorage();

    final token = await storage.read(key: "spotifyToken");

    final res = await http.post(
        Uri.parse(
            "https://zyvhvgkqnnpqwmyagnzd.supabase.co/functions/v1/getSpotifyTopAll"),
        headers: {
          'Authorization': 'Bearer ${_sc.auth.currentSession?.accessToken}',
        },
        body: jsonEncode({'accessToken': token}));

    dev.log(res.body);
  }

  void _sout(context) async {
    await _sc.auth.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    loadContent();
    return Scaffold(
      body: FloatingActionButton(onPressed: () => _sout(context)),
    );
  }
}
