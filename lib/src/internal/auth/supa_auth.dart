import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lyricfy/constants/errors.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;
import 'dart:developer' as dev;

class SupaAuth {
  final s.SupabaseClient _client;
  SupaAuth(this._client);

  Future<int> signInOrSignUpWithSpotify() async {
    var a = _client.auth;

    if (a.currentUser == null || a.currentSession == null) {
      bool isSignInOrSignUpSuccess = await a.signInWithOAuth(
          s.OAuthProvider.spotify,
          scopes:
              'user-read-email user-read-private user-follow-read user-read-recently-played user-top-read user-library-read playlist-read-private playlist-read-collaborative');
      if (!isSignInOrSignUpSuccess) {
        return CustomErrors.AUTH_COULDNT_CONNECT_AUTH_PROVIDER;
      }

      final usr = a.currentUser;
      final session = a.currentSession;
      if (usr == null || session == null) {
        return CustomErrors.AUTH_NO_USER_AFTER_OAuth;
      }

      final spotifyToken = session.providerToken;
      final refreshToken = session.providerRefreshToken;

      const storage = FlutterSecureStorage();
      await storage.write(key: "spotifyToken", value: spotifyToken);
      await storage.write(key: "spotifyRefreshToken", value: refreshToken);
    }
    return await createUserIfNotExists();
  }

  Future<int> createUserIfNotExists() async {
    if (await isUserAlsoExistsInDB() == CustomErrors.DB_MUX_USER_EXISTS) {
      return CustomErrors.AUTH_AND_DB_USER_EXISTS;
    }
    var u = _client.auth.currentUser;
    if (u == null) {
      return CustomErrors.DB_CANNOT_ATTEMPT_INSERT_NO_AUTH;
    }
    dev.log(u.userMetadata.toString());
    try {
      await _client.from('users').insert({
        "username": u.userMetadata?['sub'],
        "name": u.userMetadata?['name'],
        "email": u.userMetadata?['email'],
        "profile_picture": u.userMetadata?['avatar_url']
      }).maybeSingle();
    } catch (e) {}
    return CustomErrors.NO_ERR;
  }

  Future<int> isUserAlsoExistsInDB() async {
    String? email;
    email = _client.auth.currentUser?.email;

    if (email == null) {
      return CustomErrors.DB_MUX_USER_DOES_NOT_EXIST;
    }
    var user =
        await _client.from('users').select().eq('email', email).maybeSingle();
    if (user != null) {
      return CustomErrors.DB_MUX_USER_EXISTS;
    }
    return CustomErrors.DB_MUX_USER_DOES_NOT_EXIST;
  }

  Future<bool> signOut() async {
    final sup = _client;
    await sup.auth.signOut();
    return true;
  }
}
