import 'package:lyricfy/constants/errors.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

class SupaAuth {
  final s.SupabaseClient _client;
  SupaAuth(this._client);

  Future<int> signInOrSignUpWithSpotify() async {
    if (!await _client.auth.signInWithOAuth(s.OAuthProvider.spotify)) {
      return CustomErrors.AUTH_COULDNT_CONNECT_AUTH_PROVIDER;
    }
    if (_client.auth.currentUser != null) {
      return CustomErrors.NO_ERR;
    }
    return CustomErrors.AUTH_NO_USER_AFTER_OAuth;
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
