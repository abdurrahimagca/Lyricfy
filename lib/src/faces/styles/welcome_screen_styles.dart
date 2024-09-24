import 'package:flutter/material.dart';
import 'package:lyricfy/src/faces/styles/public/colors.dart';
import 'package:lyricfy/src/faces/styles/public/design_consts.dart';

class ButtonStyles {
  static final Border buttonBorder = Border.all(
    width: DesignConsts.borderWidth,
    color: Colors.transparent,
  );

  static final BoxDecoration borderDecoration = BoxDecoration(
    borderRadius: DesignConsts.buttonBorderRadius,
    border: buttonBorder,
    gradient: PublicColors.nopeToYupLinearGradientColor,
  );

  static const BoxDecoration buttonWrapperContainerDecoration = BoxDecoration(
    borderRadius: DesignConsts.buttonBorderRadius,
    color: PublicColors.primaryBackgroundColor,
  );

  static const ButtonStyle textButtonStyle = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
    foregroundColor: WidgetStatePropertyAll(PublicColors.infoTextColor),
  );
}
