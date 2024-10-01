import 'package:flutter/material.dart';
import 'package:lyricfy/src/faces/styles/public/colors.dart';
import 'package:lyricfy/src/faces/styles/public/design_consts.dart';
import 'package:lyricfy/src/faces/styles/public/text.dart';
import 'package:lyricfy/src/faces/styles/welcome_screen_styles.dart';

class NewUserWidgets extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final DesignConsts designConsts;
  final ValueChanged<String>? onTChanged;

  const NewUserWidgets(
      {super.key,
      required this.controller,
      this.label,
      required this.designConsts,
      this.onTChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onChanged: onTChanged,
              style: PublicTextStyles.strongMonoText,
              cursorColor: PublicColors.nopeButtonColor,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(7.0),
                hintStyle: PublicTextStyles.mostFadedMonoText,
                hintText: label,
                border: InputBorder.none,
              )),
        ),
      ),
    );
  }
}
