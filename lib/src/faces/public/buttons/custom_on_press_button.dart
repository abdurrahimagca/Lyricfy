import 'package:flutter/material.dart';
import 'package:lyricfy/src/faces/styles/public/design_consts.dart';
import 'package:lyricfy/src/faces/styles/public/text.dart';
import 'package:lyricfy/src/faces/styles/welcome_screen_styles.dart';

class CustomOnPressButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomOnPressButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DesignConsts.fullButtonWidth,
      height: DesignConsts.fullButtonHeight,
      decoration: ButtonStyles.borderDecoration,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: ButtonStyles.buttonWrapperContainerDecoration,
        child: Center(
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyles.textButtonStyle,
            child: Text(
              text,
              style: PublicTextStyles.infoMonoText,
            ),
          ),
        ),
      ),
    );
  }
}
