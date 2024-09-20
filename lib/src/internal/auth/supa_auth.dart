import 'package:supabase_flutter/supabase_flutter.dart' as s;

class SupaAuth {
  final s.SupabaseClient _client;
  SupaAuth(this._client);

    Future<bool> signInOrSignUpWithSpotify() async {
    await _client.auth.signInWithOAuth(s.OAuthProvider.spotify );
    var usr = _client.auth.currentUser;
    if(usr == null){
      throw Exception('erst01err01: ERR_AUTH_COULDNT_CONNECT_TO_SPOTIFY');
    }
    if(await isUserAlsoExistsInDB(usr.id)){
      return true;
    }
    final un = usr.userMetadata?['username'];
    if (un == null) {
      throw Exception('erst01err02: ERR_AUTH_COULDNT_CONNECT_TO_SPOTIFY');
    }   
    return createUserIfNotExists(usr.id, un);
 }
  Future<bool> isUserAlsoExistsInDB(String id) async {
    var user = await _client.from('Users').select().eq('id', id).maybeSingle();
    return user != null;
  }

  Future<bool>createUserIfNotExists(String id,String un) async{
    var u = _client.auth.currentUser;
    if(u == null){
      throw Exception('erst01err02: ERR_AUTH_NO_USR');
    }
    
    final insertRes = await _client
    .from('Users')
    .insert({'id': id,
    'username': un})
    .maybeSingle();

    return insertRes != null;

  }

  Future<bool> signOut() async {
    final sup = _client;
    await sup.auth.signOut();
    return true;
  }
}








