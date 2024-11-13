import 'dart:convert';
import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:grpc/grpc.dart' as grpc;
import 'package:lyricfy/src/faces/auth/screens/auth_flow_start_screen.dart';
import 'package:lyricfy/src/internal/apis/middles/tokenValidate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:lyricfy/src/internal/models/spotify_tops.dart';
class HomeScreen extends StatelessWidget {
  final SupabaseClient _sc = GetIt.I<SupabaseClient>();

  HomeScreen({Key? key}) : super(key: key);

  Future<void> loadContent() async {
    final tkn = _sc.auth.currentSession?.accessToken;

    const FlutterSecureStorage storage = FlutterSecureStorage();

    final dio = Dio()..interceptors.add(TokenValidateInterceptor());
    Response response;
    List<SpotifyTops> tops = [];
    try {
      // API isteği
      final token = await storage.read(key: "spotifyToken");
      response = await dio.post(
          'https://zyvhvgkqnnpqwmyagnzd.supabase.co/functions/v1/getSpotifyTops',
          data: {'accessToken': token},
          options: Options(
              headers: {'Authorization': 'Bearer $tkn'}) // İstek verileri
          );
      dev.log('Response: ${response.data}');
      tops = (response.data as List)
          .map((e) => SpotifyTops.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      dev.log('home screen Request failed: ${e.message}');
      return;
    }
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
