import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:lyricfy/constants/errors.dart';
import 'package:lyricfy/generated/l10n.dart';
import 'package:lyricfy/src/faces/auth/screens/home_screen.dart';
import 'package:lyricfy/src/faces/auth/widgets/poster_text_widget.dart';
import 'package:lyricfy/src/faces/public/buttons/custom_on_press_button.dart';
import 'package:lyricfy/src/faces/public/popups/fail_type_popup.dart';
import 'package:lyricfy/src/faces/public/popups/ok_type_popup.dart';
import 'package:lyricfy/src/faces/styles/public/design_consts.dart';
import 'package:lyricfy/src/internal/auth/supa_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer' as dev;

class LoginScreen extends StatelessWidget {
  @override
  const LoginScreen({super.key});
  void _handleLoginStates(context) async {
    SupabaseClient sc = GetIt.I<SupabaseClient>();
    final a = SupaAuth(sc);
    var mux = await a.signInOrSignUpWithSpotify();
    switch (mux) {
  
      case CustomErrors.NO_ERR:
        {
          okPopBuilder(context, "ok", "created");    
          break; 
        }
        case CustomErrors.AUTH_AND_DB_USER_EXISTS:
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
          break;
        }
        case CustomErrors.DB_INSERT_USER_DID_NOT_WORKED:
        {
          failPopBuilder(context, "SOMETHING WENT WRONG",
              "Unfortunatly we couldn't make you a user");
          break;
        }
        default:
        {
          failPopBuilder(context, "SOMETHING WENT WRONG",
              "Unfortunatly we couldn't make you a user");
          break;
        }
  }
  }

  @override
  Widget build(BuildContext context) {
    final loginButtonWidget = CustomOnPressButton(
        onPressed: () => _handleLoginStates(context),
        text: S.of(context).loginButton);
    DesignConsts designConsts = GetIt.I<DesignConsts>();
    List<String> posterText = [
      "hello",
      "merhaba",
      "Ողջույն",
      "Γειά σου",
      "salam",
      "hola",
      "bonjour",
      "ciao",
      "こんにちは",
      "안녕하세요",
      "你好",
      "olá",
      "Привет",
      "مرحبا",
      "chào bạn",
      "สวัสดี",
      "halo",
      "saluton",
      "hej",
      "hallo",
      "hoi",
      "hei"
    ];
    final posterTextWidget = PosterTextWidget(posterText: posterText);
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: designConsts.screenHeight * 0.5,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [posterTextWidget],
              ),
            ),
            Positioned(
                top: designConsts.screenHeight * 0.15,
                left: designConsts.authScreensIconLeftPosition,
                right: 0,
                child: SvgPicture.asset('assets/icon-svg/icon.svg')),
            Positioned(
              bottom: designConsts.loginButtonBottomPosition,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [loginButtonWidget],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
