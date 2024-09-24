import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lyricfy/constants/errors.dart';
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
    final DesignConsts designConsts = GetIt.I<DesignConsts>();
    if (designConsts.screenHeight <= 0 || designConsts.screenWidth <= 0) {
      throw Exception(
          "DEVICE_VISUAL_COULDNT_GET${CustomErrors.DEVICE_VISUAL_COULDNT_GET}");
    }
    return Container(
      width: designConsts.fullButtonWidth,
      height: designConsts.fullButtonHeight,
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
