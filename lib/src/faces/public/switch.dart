import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lyricfy/src/faces/styles/public/colors.dart';
import 'package:lyricfy/src/faces/styles/public/design_consts.dart';

class CustomSwitch extends StatefulWidget {
  final activeColor = PublicColors.nopeButtonColor;
  final inactiveColor = PublicColors.yupButtonColor;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.onChanged});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isOn = false;

  @override
  void initState() {
    super.initState();
  }

  void _toggle() {
    setState(() {
      isOn = !isOn;
    });
    widget.onChanged(isOn);
  }

  @override
  Widget build(BuildContext context) {
    DesignConsts designConsts = GetIt.I<DesignConsts>();
    final width = 0.09 * designConsts.screenWidth;
    final height = 0.025 * designConsts.screenHeight;
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(microseconds: 300),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isOn ? widget.activeColor : widget.inactiveColor,
          borderRadius: BorderRadius.circular(width / 2),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: isOn ? width - height : 0,
              right: isOn ? 0 : width - height,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: height - 5,
                height: height - 5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
