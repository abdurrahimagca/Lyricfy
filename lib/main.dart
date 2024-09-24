import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lyricfy/generated/l10n.dart';
import 'package:lyricfy/src/faces/auth/screens/auth_flow_start_screen.dart';
import 'package:lyricfy/src/internal/supa/init_supa.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  await dotenv.load();

  InitSupa initSupa = InitSupa();
  await initSupa.init();
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<SupabaseClient>(initSupa.getClient());
  runApp(const LyricfyApp());
}

class LyricfyApp extends StatelessWidget {
  const LyricfyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: const Color(101010),
        ),
        scaffoldBackgroundColor: const Color(101010),
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const LoginScreen(),
    );
  }
}

final supabase = Supabase.instance.client;
