import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:lyricfy/constants/errors.dart';
import 'package:lyricfy/generated/l10n.dart';
import 'package:lyricfy/src/faces/auth/screens/home_screen.dart';
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
  PageController _pageController = PageController();
  DesignConsts designConsts = GetIt.I<DesignConsts>();
  int totalField = 3;
  int _step = 0;
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _userNameInputController =
      TextEditingController();
  bool isPrivate = false;
  SupabaseClient supabaseClient = GetIt.I<SupabaseClient>();
  late SupaAuth supabaseAuth;

  @override
  void initState() {
    super.initState();
    supabaseAuth = SupaAuth(supabaseClient);
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
    bool? dummy;

    if (await supabaseAuth.isUserNameAvailable(username)) {
      dummy = await showQuestionPop(context, "Kullanıcı mevcut, siz misiniz?");
      if (dummy ?? false) {
        // handle user confirmation if necessary
      }

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

    final designConsts = GetIt.I<DesignConsts>();
    return Scaffold(
        backgroundColor: PublicColors.primaryBackgroundColor,
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _step = index;
                });
              },
              children: [
                Center(
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
                          controller: _userNameInputController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(7.0),
                            hintStyle: PublicTextStyles.mostFadedMonoText,
                            hintText: labels[0],
                            border: InputBorder.none,
                          )),
                    ),
                  ),
                )),
                Center(
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
                Center(
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
              left: 0,
              top: designConsts.screenHeight / 2 - 25,
              child: RawMaterialButton(
                onPressed: () => _back(context),
                padding: const EdgeInsets.all(0.0),
                elevation: 0.0,
                fillColor: Colors.transparent,
                child: SizedBox(
                  width: 32, // Use the provided width
                  height: 32, // Use the provided height
                  child: SvgPicture.asset("assets/icon-svg/back.svg",
                      fit: BoxFit.contain,
                      alignment:
                          Alignment.center), // Load SVG using the provided name
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: designConsts.screenHeight / 2 - 25,
              child: RawMaterialButton(
                onPressed: () => _next(context),
                padding: const EdgeInsets.all(0.0),
                elevation: 0.0,
                fillColor: Colors.transparent,
                child: SizedBox(
                  width: 32, // Use the provided width
                  height: 32, // Use the provided height
                  child: SvgPicture.asset("assets/icon-svg/next.svg",
                      fit: BoxFit.contain,
                      alignment:
                          Alignment.center), // Load SVG using the provided name
                ),
              ),
            ),
          ],
        ));
  }
}
