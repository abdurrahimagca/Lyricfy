import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgButton {
  String name;
  double width;
  double height;

  CustomSvgButton(this.name, {this.width = 64.0, this.height = 64.0});

  RawMaterialButton buildSvgButton() {
    return RawMaterialButton(
      onPressed: () {},
      padding: const EdgeInsets.all(0.0),
      elevation: 0.0,
      fillColor: Colors.transparent,
      child: SizedBox(
        width: width, // Use the provided width
        height: height, // Use the provided height
        child: SvgPicture.asset(name), // Load SVG using the provided name
      ),
    );
  }
}
