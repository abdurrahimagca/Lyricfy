

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lyricfy/generated/l10n.dart';
import 'package:lyricfy/src/faces/auth/pre_home_screen.dart';
import 'package:lyricfy/src/internal/auth/supa_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
loginWithSpotify(BuildContext context) 
{
    GetIt getIt = GetIt.I;
    SupabaseClient supabaseClient = getIt<SupabaseClient>();
    SupaAuth authSupa = SupaAuth(supabaseClient);

    return ElevatedButton(
    onPressed: () async {
     if( await authSupa.signInOrSignUpWithSpotify()){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const PreHomeScreen()));
     }
    },
    child: Row(
      children: [
        Text(S.of(context).loginButton),
      ],
    ),
  );
}