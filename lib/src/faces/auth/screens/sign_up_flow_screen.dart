import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:lyricfy/src/faces/public/buttons/custom_svg_button.dart';
import 'package:lyricfy/src/faces/styles/public/colors.dart';
import 'package:lyricfy/src/faces/styles/public/design_consts.dart';

class SignUpFlowScreen extends StatefulWidget {
  const SignUpFlowScreen({super.key});

  @override
  _SignUpFlowScreenState createState() => _SignUpFlowScreenState();
}

class _SignUpFlowScreenState extends State<SignUpFlowScreen> {
  DesignConsts designConsts = GetIt.I<DesignConsts>();
  CustomSvgButton nextButton =
      CustomSvgButton("assets/icon-svg/next.svg", width: 64.0, height: 64.0);
  CustomSvgButton backButton =
      CustomSvgButton("assets/icon-svg/back.svg", width: 64.0, height: 64.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PublicColors.primaryBackgroundColor,
      body: Stack(
        children: [
          //back button
          Positioned(
              left: 0,
              top: designConsts.screenHeight / 2 - 25,
              child: backButton.buildSvgButton()),

          //next buttton
          Positioned(
              right: 0,
              top: designConsts.screenHeight / 2 - 25,
              child: nextButton.buildSvgButton())
        ],
      ),
    );
  }
}
