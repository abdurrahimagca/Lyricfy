import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lyricfy/constants/errors.dart';
import 'package:lyricfy/generated/l10n.dart';
import 'package:lyricfy/src/faces/auth/signup_screen.dart';
import 'package:lyricfy/src/faces/public/buttons/custom_on_press_button.dart';
import 'package:lyricfy/src/faces/public/popups/fail_type_popup.dart';
import 'package:lyricfy/src/faces/public/popups/ok_type_popup.dart';
import 'package:lyricfy/src/faces/public/popups/question_type_popup.dart';
import 'package:lyricfy/src/internal/auth/supa_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer' as dev;



class LoginScreen extends StatelessWidget {
   @override
 
  const LoginScreen({super.key});
  void _handleLoginStates(context)async {
    SupabaseClient sc = GetIt.I<SupabaseClient>();
    final a = SupaAuth(sc);
    var mux = await a.signInOrSignUpWithSpotify();
    switch (mux){
      case CustomErrors.AUTH_COULDNT_CONNECT_AUTH_PROVIDER :{
        failPopBuilder(context, "SOMETHING WENT WRONG", "Unfortunatly we couldn't connect to the auth provider");
        break;
      }
      case CustomErrors.AUTH_NO_USER_AFTER_OAuth :{
        failPopBuilder(context, "SOMETHING WENT WRONG", "Unfortunatly we couldn't connect to the auth provider");
        break;
      }
      case CustomErrors.NO_ERR :{
         var ie = await a.isUserAlsoExistsInDB();
         if(ie == CustomErrors.DB_MUX_USER_EXISTS){
          okPopBuilder(context, "ok", "ok");
         }
         else if(ie == CustomErrors.DB_MUX_USER_DOES_NOT_EXIST){
            Navigator.push(context, MaterialPageRoute(builder:(context)=> SignupScreen()));
         }
         else{
           dev.log("STH_SRSLY_WRONG err:atfssx41");

         }
      }  
    }
  }
 
  @override
  Widget build(BuildContext context) {
    
    final t = S.of(context).loginButton;
   
    final w = CustomOnPressButton(onPressed: () => _handleLoginStates(context), text: t);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).welcomeHeader),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [w],
        ),
      ),
    );
  }
  
 
}
