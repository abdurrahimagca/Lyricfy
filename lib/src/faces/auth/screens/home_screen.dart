import 'dart:convert';
import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:lyricfy/src/faces/auth/screens/auth_flow_start_screen.dart';
import 'package:lyricfy/src/internal/apis/middles/tokenValidate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatelessWidget {
  final SupabaseClient _sc = GetIt.I<SupabaseClient>();

  HomeScreen({Key? key}) : super(key: key);

  Future<void> loadContent() async {
    final tkn = _sc.auth.currentSession?.accessToken;

    const FlutterSecureStorage storage = FlutterSecureStorage();

    final dio = Dio()..interceptors.add(TokenValidateInterceptor());
    Response response;
    List<Tops> tops = [];
    try {
      // API isteği
      final token = await storage.read(key: "spotifyToken");
      response = await dio.post(
        'https://zyvhvgkqnnpqwmyagnzd.supabase.co/functions/v1/getSpotifyFypContent',
        data: {'accessToken': token}, 
        options: Options(headers: {
          'Authorization': 'Bearer $tkn'
        })// İstek verileri
      );
     //dev.log('Response: ${response.data}');
 List<Tops> tops = (response.data as List)
          .map((e) => Tops.fromJson(e as Map<String, dynamic>))
          .toList();
      dev.log(tops[0].name + tops[0].artist + tops[0].albumName + tops[1].name + tops[1].artist + tops[1].albumName  + tops[2].name + tops[2].artist + tops[2].albumName + tops[2].image + tops[3].name + tops[3].artist + tops[3].albumName + tops[4].name + tops[4].artist + tops[4].albumName);
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
class Tops{
  final String name;
  final String artist;
  final String albumName;
  final String image;
  Tops(this.name, this.artist, this.albumName, this.image);
  factory Tops.fromJson(Map<dynamic, dynamic> json) {
    return Tops(
      json['name'] as String,
      json['artist'] as String,
      json['albumName'] as String,
      json['image'] as String,
    );
  }
}