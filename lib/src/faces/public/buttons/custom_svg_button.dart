import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgButton {
  String name;
  double width;
  double height;
  final VoidCallback onPressed;

  CustomSvgButton(this.name,
      {required this.width, required this.height, required this.onPressed});

  RawMaterialButton buildSvgButton() {
    return RawMaterialButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(0.0),
      elevation: 0.0,
      fillColor: Colors.transparent,
      child: SizedBox(
        width: width, // Use the provided width
        height: height, // Use the provided height
        child: SvgPicture.asset(name,
            fit: BoxFit.contain,
            alignment: Alignment.center), // Load SVG using the provided name
      ),
    );
  }
}
