import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lyricfy/constants/errors.dart';
import 'package:lyricfy/generated/l10n.dart';
import 'package:lyricfy/src/faces/public/buttons/ok_type_button.dart';
import 'package:lyricfy/src/internal/auth/supa_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  void _handleLoginStates()async {
    SupabaseClient sc = GetIt.I<SupabaseClient>();
    final a = SupaAuth(sc);
    var mux = await a.signInOrSignUpWithSpotify();
    switch (mux){
      case CustomErrors.AUTH_COULDNT_CONNECT_AUTH_PROVIDER :{
        print("Something went wrong with the auth provider");
        break;
      }
      case CustomErrors.AUTH_NO_USER_AFTER_OAuth :{
        print("No user after OAuth");
        break;
      }
      case CustomErrors.NO_ERR :{
         var ie = await a.isUserAlsoExistsInDB();
         if(ie == CustomErrors.DB_MUX_USER_EXISTS){
          //navigate to home
           print("User exists in DB");
         }
         else if(ie == CustomErrors.DB_MUX_USER_DOES_NOT_EXIST){
           //navigate create user screen
            print("User does not exist in DB");
            print(await a.createUserIfNotExists("username1"));
         }
         else{
           print("Something went wrong with the DB");

         }
      }  
    }
  }
 
  @override
  Widget build(BuildContext context) {
    
    final t = S.of(context).loginButton;
   
    final w = OkTypeButton(onPressed: _handleLoginStates, text: t);

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
