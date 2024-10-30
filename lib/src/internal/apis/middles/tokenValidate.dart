import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer' as dev;
import 'package:http/http.dart' as http;

class TokenValidateInterceptor extends Interceptor {
  final Dio _dio = Dio();
  final _storage = FlutterSecureStorage();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    dev.log("TokenValidateInterceptor onRequest");

    // Mevcut tokeni oku
    final token = await _storage.read(key: "spotifyToken");

    // Spotify API'ye istek yaparak token geçerliliğini kontrol et
    try {
      final res = await _dio.post("https://api.spotify.com/v1/me",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (res.statusCode == 200) {
        // Token geçerliyse istek devam etsin
        return handler.next(options);
      }
    } on DioException {
      dev.log("token expired; refreshing token");
      var clientId =  dotenv.env['SPOTIFY_CLIENT_ID'];
      var  clientSecret = dotenv.env['SPOTIFY_CLIENT_SECRET'];
      final refreshToken = await _storage.read(key: "spotifyRefreshToken");
      dev.log(refreshToken ?? "line 35 refresh token is null");

      try {
/*
        final params = {
          'grant_type': 'refresh_token',
          'refresh_token': refreshToken,
          'client_id': clientId,
        };
         final credentials =
            base64Encode(utf8.encode('$clientId:$clientSecret'));
        final uri = Uri.https("accounts.spotify.com", "/api/token", params);
        final response = await http.post(
          uri,
          headers: {
           HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
            HttpHeaders.authorizationHeader: 'Basic $credentials',
          },
        );
        dev.log(response.statusCode.toString());
        dev.log(response.body.toString());*/
        const url = "https://accounts.spotify.com/api/token";
        final response = await _dio.post(
          url,
          data: {
            'grant_type': 'refresh_token',
            'refresh_token': refreshToken,
           'client_id': clientId,
          },
          options: Options(
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
              'Authorization': 'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}',
            },
          ),
        );

        if (response.statusCode == 200) {
          // Yeni token başarıyla alındı, secure storage'e kaydediyoruz
          final newAccessToken = response.data['access_token'];
          await _storage.write(key: "spotifyToken", value: newAccessToken);

          return handler.next(options);
        }
     
      } on DioException catch (e) {
        dev.log('line81 Token refresh failed:${e.message} ${e.response}  $e.statusCode');
      }
    }

    return handler.reject(DioException(
      requestOptions: options,
      error: 'line 79Token validation failed and refresh token request failed',
    )); // Bu satır sadece token yenilenemediğinde çalışır
  }
}
