import 'dart:ui';

import 'package:flutter/material.dart';

class PublicColors {
  //Text Colors
  static const Color fadedTextColor = Color(0xFF848484);
  static const Color infoTextColor = Color(0xffC9C9C9);
  static const Color textColorStrong = Color(0xffffffff);
  static const Color uiTextColor = Color(0xffe0dfdf);

  //Background Colors
  static const Color primaryBackgroundColor = Color(0xFF101010);

  //Button Colors
  static const Color nopeButtonColor = Color(0xffeb005a);
  static const Color yupButtonColor = Color(0xffffbb00);

  //Linear Gradient Colors
  static const LinearGradient nopeToYupLinearGradientColor = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [nopeButtonColor, yupButtonColor]);

  static const LinearGradient nopeToYupLinearGradientColorBottomToTopSpin =
      LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [nopeButtonColor, yupButtonColor],
  );
}
