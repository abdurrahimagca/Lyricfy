import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:lyricfy/constants/errors.dart';
import 'package:lyricfy/generated/l10n.dart';
import 'package:lyricfy/src/faces/auth/widgets/new_user_widgets.dart';
import 'package:lyricfy/src/faces/public/popups/fail_type_popup.dart';
import 'package:lyricfy/src/faces/public/popups/ok_type_popup.dart';
import 'package:lyricfy/src/faces/public/popups/question_type_popup.dart';
import 'package:lyricfy/src/faces/public/buttons/general_checkbox.dart';
import 'package:lyricfy/src/faces/styles/public/design_consts.dart';
import 'package:lyricfy/src/faces/styles/public/text.dart';
import 'package:lyricfy/src/internal/auth/supa_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewUserScreen extends StatefulWidget {
  const NewUserScreen({super.key});

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
      failPopBuilder(context, "Error", S.of(context).emptyFieldErr);
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
        okPopBuilder(context, "Success", S.of(context).userCreated);
      } else {
        failPopBuilder(context, "HATA", S.of(context).userCouldNotBeCreated);
      }
    }
  }

  void _back(context) {
    if (_step > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {
        _step--;
      });
    } else {
      //
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
    List<String> labels = [
      S.of(context).usernameLabel,
      S.of(context).nameLabel
    ];

    final designConsts = GetIt.I<DesignConsts>();
    final w = NewUserWidgets(
      controller: controllers[_step],
      label: labels[_step],
      designConsts: designConsts,
    );

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          // First page - Input for Username
          Center(
            child: w.build(context),
          ),
          // Second page - Input for Name
          Center(
            child: w.build(context),
          ),
          // Third page - Checkbox
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).isAccountPublicLabel,
                  style: PublicTextStyles.uiText,
                ),
                const GeneralCheckbox(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back button
          if (_step > 0)
            FloatingActionButton(
              onPressed: () => _back(context),
              child: const Icon(Icons.arrow_back),
            ),
          const Spacer(),
          // Next button
          FloatingActionButton(
            onPressed: () => _next(context),
            child: _step == TOTAL - 1
                ? const Icon(Icons.check)
                : const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
