import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:lyricfy/generated/l10n.dart';
import 'package:lyricfy/src/faces/auth/screens/auth_flow_start_screen.dart';
import 'package:lyricfy/src/faces/public/popups/fail_type_popup.dart';
import 'package:lyricfy/src/faces/styles/public/colors.dart';
import 'package:lyricfy/src/faces/styles/public/design_consts.dart';
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

class LyricfyApp extends StatefulWidget {
  const LyricfyApp({super.key});

  @override
  State<LyricfyApp> createState() => _LyricfyAppState();
}

class _LyricfyAppState extends State<LyricfyApp> {
  DesignConsts? designConsts;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        designConsts = DesignConsts(context: context);
        if (designConsts != null) {
          GetIt.I.registerSingleton<DesignConsts>(designConsts!);
        } else {
          failPopBuilder(context, "opsi", "opsi");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: PublicColors.primaryBackgroundColor,
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: designConsts != null
            ? const LoginScreen()
            : Scaffold(
                body: Center(
                  child: Lottie.asset(
                    'assets/animations/loading.json', // Buraya animasyon dosyanın yolu
                    width: 200, // Genişlik ve yükseklik ayarı
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
              ));
  }
}
