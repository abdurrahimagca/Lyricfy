import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:lyricfy/constants/errors.dart';
import 'package:lyricfy/generated/l10n.dart';
import 'package:lyricfy/src/faces/auth/screens/auth_flow_start_screen.dart';
import 'package:lyricfy/src/faces/auth/screens/home_screen.dart';
import 'package:lyricfy/src/faces/public/popups/fail_type_popup.dart';
import 'package:lyricfy/src/faces/styles/public/colors.dart';
import 'package:lyricfy/src/faces/styles/public/design_consts.dart';
import 'package:lyricfy/src/internal/auth/supa_auth.dart';
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
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        designConsts = DesignConsts(context: context);
        if (designConsts != null) {
          GetIt.I.registerSingleton<DesignConsts>(designConsts!);
        } else {
          failPopBuilder(context, "opsi", "opsi");
        }
      });

      // Kullanıcı oturum durumunu kontrol etme
      SupabaseClient supabase = GetIt.I<SupabaseClient>();
      final session = supabase.auth.currentSession;
      SupaAuth supaAuth = SupaAuth(supabase);

      if (session != null &&
          (await supaAuth.isUserAlsoExistsInDB() ==
              CustomErrors.DB_MUX_USER_EXISTS)) {
        // Eğer kullanıcı giriş yapmışsa isLoggedIn'i true yapın
        setState(() {
          isLoggedIn = true;
        });
      }
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
          ? isLoggedIn
              ? HomeScreen() // Kullanıcı giriş yapmışsa ana ekrana yönlendirme
              : const LoginScreen() // Giriş yapmamışsa giriş ekranını gösterme
          : Scaffold(
              body: Center(
                child: Lottie.asset(
                  'assets/animations/loading.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
            ),
    );
  }
}

