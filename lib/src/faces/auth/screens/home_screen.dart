import 'dart:convert';
import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:grpc/grpc.dart' as grpc;
import 'package:lyricfy/src/internal/services/generated/lyricFetch.pb.dart';
import 'package:lyricfy/src/internal/services/generated/lyricFetch.pbenum.dart';
import 'package:lyricfy/src/internal/services/generated/lyricFetch.pbgrpc.dart';
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
          options: Options(
              headers: {'Authorization': 'Bearer $tkn'}) // İstek verileri
          );
      dev.log('Response: ${response.data}');
      tops = (response.data as List)
          .map((e) => Tops.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      dev.log('home screen Request failed: ${e.message}');
      return;
    }
    final channel = grpc.ClientChannel("10.0.2.2",
        port: 50051,
        options: const grpc.ChannelOptions(
            credentials: grpc.ChannelCredentials.insecure()));
    final stub = lyricFetchServiceClient(channel);
    List<Future<void>> lyricReq = tops.take(10).map((song) async {
      // Your async code here
      try {
        final response = await stub.getLyric(LyricFetchRequest(
          title: song.name,
          artist: song.artist,
        ));
        dev.log(
            '********* ${song.name} Lyric************************\n: ${response.lyrics}');
      } catch (e) {
        dev.log('Lyric Request failed: ${e}');
      }
    }).toList();
    await Future.wait(lyricReq);
    await channel.shutdown();
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

class Tops {
  final String isrc;
  final String name;
  final String artist;
  final String albumName;
  final String image;
  Tops(this.name, this.artist, this.albumName, this.image, this.isrc);
  factory Tops.fromJson(Map<dynamic, dynamic> json) {
    return Tops(
      json['isrc'] as String,
      json['name'] as String,
      json['artist'] as String,
      json['albumName'] as String,
      json['image'] as String,
    );
  }
}
