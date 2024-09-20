import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lyricfy/src/internal/supa/supa_abs_factory.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

class InitSupa implements SupaFactory {

  static final InitSupa _instance = InitSupa._internal();
  late s.SupabaseClient _client;
  InitSupa._internal();

  factory InitSupa() {
    return _instance;
  }

  Future<void> init() async {
    String? supaUrl = dotenv.env['SUPA_URL'];
    String? supaAnon = dotenv.env['SUPA_ANON'];

    if (supaUrl == null || supaAnon == null) {
      throw Exception('ERR_ENV_VARS: errSet01err01');
    }

    await s.Supabase.initialize(
      url: supaUrl,
      anonKey: supaAnon,
    );

    _client = s.Supabase.instance.client;
  }
  @override
  s.SupabaseClient getClient() {
    return _client;
  }
}
