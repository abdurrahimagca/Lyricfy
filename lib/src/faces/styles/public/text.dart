import 'package:flutter/material.dart';

import 'package:lyricfy/src/faces/styles/public/colors.dart';

class PublicTextStyles {
  static const TextStyle mostFadedMonoText = TextStyle(
      fontFamily: 'RobotoMono',
      color: PublicColors.fadedTextColor,
      fontSize: 13,
      fontWeight: FontWeight.w400);

  static const TextStyle infoMonoText = TextStyle(
      fontFamily: 'RobotoMono',
      color: PublicColors.infoTextColor,
      fontSize: 13,
      fontWeight: FontWeight.w400);

  static const TextStyle strongMonoText = TextStyle(
      fontFamily: 'RobotoMono',
      color: PublicColors.textColorStrong,
      fontSize: 13,
      fontWeight: FontWeight.w400);

  static const TextStyle uiText = TextStyle(
      fontFamily: 'Inter',
      color: PublicColors.uiTextColor,
      fontSize: 13,
      fontWeight: FontWeight.w400);

  static const TextStyle strongText = TextStyle(
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      color: PublicColors.textColorStrong,
      fontSize: 13,
      fontWeight: FontWeight.bold);
}
