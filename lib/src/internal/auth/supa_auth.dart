import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lyricfy/constants/errors.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

class SupaAuth {
  final s.SupabaseClient _client;
  SupaAuth(this._client);

  Future<int> signInOrSignUpWithSpotify() async {
    if (!await _client.auth.signInWithOAuth(
      s.OAuthProvider.spotify,
      scopes:
          'user-read-email user-read-private user-follow-read user-read-recently-played user-top-read user-library-read playlist-read-private playlist-read-collaborative',
    )) {
      return CustomErrors.AUTH_COULDNT_CONNECT_AUTH_PROVIDER;
    }
    final usr = _client.auth.currentUser;
    final session = _client.auth.currentSession;
    if (usr == null || session == null) {
      return CustomErrors.AUTH_NO_USER_AFTER_OAuth;
    }
    usr.appMetadata.addEntries([
      MapEntry("spotifyToken", session.providerToken),
      MapEntry("spotifyRefreshToken", session.providerRefreshToken)
    ]);
    final spotifyToken = session.providerToken;
    final refreshToken = session.providerRefreshToken;

    const storage = FlutterSecureStorage();
    await storage.write(key: "spotifyToken", value: spotifyToken);
    await storage.write(key: "spotifyRefreshToken", value: refreshToken);
    return CustomErrors.NO_ERR;
  }

  Future<bool> isUserNameAvailable(String prename) async {
    if (await _client
            .from('users')
            .select()
            .eq('username', prename)
            .maybeSingle() ==
        null) {
      return true;
    }
    return false;
  }

  Future<int> isUserAlsoExistsInDB() async {
    String uid;
    try {
      uid = _client.auth.currentUser!.id;
    } catch (e) {
      return CustomErrors.DB_CANNOT_ATTEMPT_INSERT_NO_AUTH;
    }
    var user = await _client.from('users').select().eq('id', uid).maybeSingle();
    if (user != null) {
      return CustomErrors.DB_MUX_USER_EXISTS;
    }
    return CustomErrors.DB_MUX_USER_DOES_NOT_EXIST;
  }

  Future<int> createUserIfNotExists(
      String username, String name, bool isPrivate) async {
    var u = _client.auth.currentUser;
    if (u == null) {
      return CustomErrors.DB_CANNOT_ATTEMPT_INSERT_NO_AUTH;
    }
    try {
      await _client.from('users').insert({
        'id': u.id,
        'username': username,
        'name': name,
        'isPublic': !isPrivate
      }).maybeSingle();
    } catch (e) {
      return CustomErrors.DB_INSERT_USER_DID_NOT_WORKED;
    }
    return CustomErrors.NO_ERR;
  }

  Future<bool> signOut() async {
    final sup = _client;
    await sup.auth.signOut();
    return true;
  }
}
