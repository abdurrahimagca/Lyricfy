

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lyricfy/src/faces/public/popups/fail_type_popup.dart';
import 'package:lyricfy/src/faces/public/popups/ok_type_popup.dart';
import 'package:lyricfy/src/internal/auth/supa_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
} 

 class _SignupScreenState extends State<SignupScreen>{
    final PageController _pageController = PageController();
    final TextEditingController _userNameInputController = TextEditingController();
    final TextEditingController _userInputController = TextEditingController();
    int _step = 0;
    static const finalStep = 3;
  
    SupabaseClient sc = GetIt.I<SupabaseClient>();
    late final SupaAuth a;
    
    @override
    void initState(){
      super.initState();
      a = SupaAuth(sc);
    }

   void _flowComplete() async{
      if(_userNameInputController.text.isNotEmpty
      && await a.isUserNameAvailable(_userNameInputController.text) 
      && _userInputController.text.isNotEmpty){
        
         okPopBuilder(context, "created account", "welcome");
      }
      else{
        failPopBuilder(context, "sth went wrong", "pls make sure you have entered valid data");
      }
      
   }
  void _next() {
    if (_step < finalStep) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {
        _step++;
      });
    } else {
      _flowComplete();
    }
  } 
   
    @override
    Widget build(BuildContext context){
      return Scaffold(
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            _buildPageContent(context, "username", TextField(controller: _userNameInputController)),
            _buildPageContent(context, "name", TextField(controller: _userInputController)),
            _buildPageContent(context, "submit", ElevatedButton(onPressed: _next, child: const Text("submit"))),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _next,
          child: Icon(Icons.arrow_forward),
        ),
      );

    }
     Widget _buildPageContent(BuildContext context, String label, Widget child) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(label, style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          child,
        ],
      ),
      
    );
  }
}
  