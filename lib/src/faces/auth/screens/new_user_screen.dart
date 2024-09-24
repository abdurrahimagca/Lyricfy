import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lyricfy/constants/errors.dart';
import 'package:lyricfy/src/faces/auth/widgets/new_user_widgets.dart';
import 'package:lyricfy/src/faces/public/popups/fail_type_popup.dart';
import 'package:lyricfy/src/faces/public/popups/ok_type_popup.dart';
import 'package:lyricfy/src/faces/public/popups/question_type_popup.dart';
import 'package:lyricfy/src/faces/public/buttons/general_checkbox.dart';
import 'package:lyricfy/src/internal/auth/supa_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewUserScreen extends StatefulWidget {
  @override
  _NewUserScreenState createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  final PageController _pageController = PageController();
  final TextEditingController _userNameInputController =
      TextEditingController();
  final TextEditingController _nameInputController = TextEditingController();
  int _step = 0;
  static const int TOTAL = 3;
  SupabaseClient sc = GetIt.I<SupabaseClient>();
  late final SupaAuth sa;

  @override
  void initState() {
    super.initState();
    sa = SupaAuth(sc);
  }

  void _onFinish(context) async {
    if (_nameInputController.text.isEmpty ||
        _userNameInputController.text.isEmpty) {
      failPopBuilder(context, "HATA", "Boş veya yanlış alan");
      return;
    }

    var username = _userNameInputController.text;
    var name = _nameInputController.text;
    bool? b;

    if (await sa.isUserNameAvailable(username)) {
      b = await showQuestionPop(context, "Kullanıcı mevcut, siz misiniz?");
      if (b ?? false) {
        // handle user confirmation if necessary
      }

      var cu = await sa.createUserIfNotExists(username, name, b ?? false);
      if (cu == CustomErrors.NO_ERR) {
        okPopBuilder(context, "Başarılı", "Kullanıcı oluşturuldu.");
      } else {
        failPopBuilder(context, "HATA", "Kullanıcı oluşturulamadı.");
      }
    }
  }

  void _next(context) {
    if (_step < TOTAL - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {
        _step++;
      });
    } else {
      _onFinish(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> controllers = [
      _userNameInputController,
      _nameInputController
    ];
    List<String> labels = ["Kullanıcı Adı", "Ad"];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          // First page - Input for Username
          Center(
            child: TextField(
              controller: _userNameInputController,
              decoration: InputDecoration(labelText: labels[0]),
            ),
          ),
          // Second page - Input for Name
          Center(
            child: TextField(
              controller: _nameInputController,
              decoration: InputDecoration(labelText: labels[1]),
            ),
          ),
          // Third page - Checkbox
          Center(
            child: GeneralCheckbox(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _next(context),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
