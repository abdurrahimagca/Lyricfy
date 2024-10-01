import 'package:flutter/material.dart';

class DesignConsts {
  final BuildContext context;
  DesignConsts({required this.context});

  //CONSTS
  static const BorderRadiusGeometry buttonBorderRadius =
      BorderRadius.all(Radius.circular(10));
  static const double borderWidth = 2;

  //relative to screen
  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;
  double get fullButtonWidth => screenWidth * 0.7;
  double get fullButtonHeight => screenHeight * 0.05;
  double get bottomButtonPosition => screenHeight * 0.75;

  double get authScreensPosterTextTopPosition => screenHeight * 0.3;

  double get authScreensIconLeftPosition => screenHeight * (-0.1);
  double get authScreensIconTopPosition => screenHeight * 0.0463;

  double get loginButtonBottomPosition => screenHeight * 0.15;

  double get fulScreenFieldWidth => screenWidth * 0.8;
  double get fulScreenFieldHeight => screenHeight * 0.05; 
}
