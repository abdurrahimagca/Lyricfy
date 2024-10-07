import 'package:flutter/material.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:lyricfy/constants/errors.dart';
import 'package:lyricfy/generated/l10n.dart';
import 'package:lyricfy/src/faces/auth/screens/home_screen.dart';
import 'package:lyricfy/src/faces/auth/widgets/poster_text_widget.dart';
import 'package:lyricfy/src/faces/public/popups/fail_type_popup.dart';
import 'package:lyricfy/src/faces/public/popups/ok_type_popup.dart';
import 'package:lyricfy/src/faces/public/popups/question_type_popup.dart';
import 'package:lyricfy/src/faces/public/switch.dart';
import 'package:lyricfy/src/faces/styles/public/colors.dart';
import 'package:lyricfy/src/faces/styles/public/design_consts.dart';
import 'package:lyricfy/src/faces/styles/public/text.dart';
import 'package:lyricfy/src/faces/styles/welcome_screen_styles.dart';
import 'package:lyricfy/src/internal/auth/supa_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpFlowScreen extends StatefulWidget {
  const SignUpFlowScreen({super.key});

  @override
  _SignUpFlowScreenState createState() => _SignUpFlowScreenState();
}

class _SignUpFlowScreenState extends State<SignUpFlowScreen> {
  final PageController _pageController = PageController();
  DesignConsts designConsts = GetIt.I<DesignConsts>();
  int totalField = 3;
  int _step = 0;
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _userNameInputController =
      TextEditingController();
  bool isPrivate = false, isUsernameValid = false, isNextButtonEnabled = false;
  SupabaseClient supabaseClient = GetIt.I<SupabaseClient>();
  late SupaAuth supabaseAuth;

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    supabaseAuth = SupaAuth(supabaseClient);
    _userNameInputController.addListener(() {
      _onUsernameChanged(_userNameInputController.text);
    });
  }

  void _onUsernameChanged(String username) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 100), () async {
      bool isAvaliable = await supabaseAuth.isUserNameAvailable(username);
      setState(() {
        isUsernameValid = isAvaliable && username.isNotEmpty;
      });
    });
  }

  void _onFinish(context) async {
    if (_nameInputController.text.isEmpty ||
        _userNameInputController.text.isEmpty) {
      failPopBuilder(context, "Error", S.of(context).emptyFieldErr);
      setState(() {
        _step = 0;
      });
      _pageController.animateToPage(0,
          duration: const Duration(microseconds: 400),
          curve: Curves.bounceInOut);
      return;
    }

    var username = _userNameInputController.text;
    var name = _nameInputController.text;

    if (await supabaseAuth.isUserNameAvailable(username)) {
      var cu =
          await supabaseAuth.createUserIfNotExists(username, name, isPrivate);
      if (cu == CustomErrors.NO_ERR) {
        okPopBuilder(context, "Success", S.of(context).userCreated);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false);
      } else {
        failPopBuilder(context, "HATA", S.of(context).userCouldNotBeCreated);
      }
    }
  }

  void _next(context) {
    if (_step < totalField - 1) {
      setState(() {
        _step++;
      });
      _pageController.animateToPage(_step,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else {
      _onFinish(context);
    }
  }

  void _back(context) {
    if (_step > 0) {
      setState(() {
        _step--;
      });
    }
    _pageController.animateToPage(_step,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutBack);
  }

  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      S.of(context).usernameLabel,
      S.of(context).nameLabel
    ];
    const contentAlignment = Alignment(0, 0.3);
    List<String> welcomeText = [
      "Welcome", // English
      "Hoş geldiniz", // Turkish
      "Καλώς ήρθατε", // Greek
      "Xoş gəldiniz", // Azerbaijani
      "Bienvenido", // Spanish
      "Bienvenue", // French
      "Benvenuto", // Italian
      "ようこそ", // Japanese
      "환영합니다", // Korean
      "欢迎", // Chinese
      "Bem-vindo", // Portuguese
      "Добро пожаловать", // Russian
      "أهلا وسهلا", // Arabic
      "Chào mừng", // Vietnamese
      "ยินดีต้อนรับ", // Thai
      "Bonvenon", // Esperanto
      "Välkommen", // Swedish
      "Willkommen", // German
      "Welkom", // Dutch
      "Tervetuloa", // Finnish
      "Velkommen" // Norwegian
    ];
    final poster = PosterTextWidget(posterText: welcomeText);

    final designConsts = GetIt.I<DesignConsts>();
    return Scaffold(
        backgroundColor: PublicColors.primaryBackgroundColor,
        body: Stack(
          children: [
            Positioned(
              top: designConsts.screenHeight * 0.2,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [poster],
              ),
            ),
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _step = index;
                });
              },
              children: [
                Align(
                  alignment: contentAlignment,
                  child: Container(
                    width: designConsts.fulScreenFieldWidth,
                    height: designConsts.fullButtonHeight,
                    decoration: ButtonStyles.borderDecoration,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: ButtonStyles.buttonWrapperContainerDecoration,
                      child: Stack(
                        children: [
                          // TextField'i Stack içinde tutuyoruz
                          TextField(
                            style: PublicTextStyles.strongMonoText,
                            cursorColor: PublicColors.nopeButtonColor,
                            controller: _userNameInputController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(7.0),
                              hintStyle: PublicTextStyles.mostFadedMonoText,
                              hintText: labels[0],
                              border: InputBorder.none,
                            ),
                          ),

                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: isUsernameValid
                                ? const FaIcon(FontAwesomeIcons.check,
                                    color: PublicColors.yupButtonColor)
                                : const FaIcon(
                                    FontAwesomeIcons.xmark,
                                    color: PublicColors.nopeButtonColor,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: contentAlignment,
                  child: Container(
                    width: designConsts.fulScreenFieldWidth,
                    height: designConsts.fullButtonHeight,
                    decoration: ButtonStyles.borderDecoration,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: ButtonStyles.buttonWrapperContainerDecoration,
                      child: Center(
                        child: TextField(
                            style: PublicTextStyles.strongMonoText,
                            cursorColor: PublicColors.nopeButtonColor,
                            controller: _nameInputController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(7.0),
                              hintStyle: PublicTextStyles.mostFadedMonoText,
                              hintText: labels[1],
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: contentAlignment,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text(
                            style: PublicTextStyles.infoMonoText,
                            "Make my account private"),
                      ),
                      CustomSwitch(onChanged: (value) {
                        setState(() {
                          isPrivate = value;
                        });
                      }),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: designConsts.screenHeight * 0.6,
              left: -10,
              child: IconButton(
                onPressed: () => _back(context),
                icon: const FaIcon(
                  FontAwesomeIcons.caretLeft,
                  color: PublicColors.nopeButtonColor,
                ),
                iconSize: 50, // İkonun boyutunu burada ayarlayabilirsiniz
              ),
            ),
            Positioned(
              top: designConsts.screenHeight * 0.6,
              right: -10,
              child: IconButton(
                onPressed: () => _next(context),
                icon: const FaIcon(
                  FontAwesomeIcons.caretRight,
                  color: PublicColors.yupButtonColor,
                ),
                iconSize: 50,
              ),
            ),
          ],
        ));
  }
}
