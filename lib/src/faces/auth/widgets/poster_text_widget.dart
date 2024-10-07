import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lyricfy/src/faces/styles/public/colors.dart';

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
// Make sure to import your PublicColors class or define the gradients accordingly.

class Poster {
  static const posterTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 60,
    fontWeight: FontWeight.w900,
  );
}

class PosterTextWidget extends StatefulWidget {
  final List<String> posterText;

  const PosterTextWidget({super.key, required this.posterText});

  @override
  _PosterTextWidgetState createState() => _PosterTextWidgetState();
}

enum AnimationPhase { typing, animatingColor, deleting }

class _PosterTextWidgetState extends State<PosterTextWidget>
    with SingleTickerProviderStateMixin {
  int _currentWordIndex = 0;
  String _displayedText = "";
  Timer? _timer;
  int _charIndex = 0;
  AnimationPhase _phase = AnimationPhase.typing;

  late AnimationController _overlayAnimationController;
  late Animation<double> _overlayOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _overlayAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // Wait for 1 second before starting deletion
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _phase = AnimationPhase.deleting;
              _startTypingAnimation(); // Start deletion
            });
          });
        }
      });

    _overlayOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(_overlayAnimationController);

    _startTypingAnimation();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _overlayAnimationController.dispose();
    super.dispose();
  }

  void _startTypingAnimation() {
    if (_phase == AnimationPhase.typing) {
      if (_charIndex < widget.posterText[_currentWordIndex].length) {
        setState(() {
          _displayedText += widget.posterText[_currentWordIndex][_charIndex];
          _charIndex++;
        });
        int nextCharDelay = 100 + Random().nextInt(100); // 100ms to 200ms
        _timer =
            Timer(Duration(milliseconds: nextCharDelay), _startTypingAnimation);
      } else {
        // Text fully displayed, start color animation
        _phase = AnimationPhase.animatingColor;
        _overlayAnimationController.forward();
      }
    } else if (_phase == AnimationPhase.deleting) {
      if (_displayedText.isNotEmpty) {
        setState(() {
          _displayedText =
              _displayedText.substring(0, _displayedText.length - 1);
        });
        _timer = Timer(const Duration(milliseconds: 50), _startTypingAnimation);
      } else {
        // Reset for the next word
        _phase = AnimationPhase.typing;
        _charIndex = 0;
        _currentWordIndex = (_currentWordIndex + 1) % widget.posterText.length;
        _overlayAnimationController.reset();
        _startTypingAnimation();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _overlayAnimationController,
      builder: (context, child) {
        TextStyle textStyle = Poster.posterTextStyle.copyWith(
          fontSize: 50,
          fontWeight: FontWeight.w900,
          foreground: Paint()
            ..style = PaintingStyle.fill
            ..shader = PublicColors.nopeToYupLinearGradientColorBottomToTopSpin
                .createShader(
              Rect.fromLTWH(0, 0, _getTextWidth(_displayedText), 80),
            ),
        );

        // Reverse the gradient colors for the overlay
        LinearGradient reversedGradient = LinearGradient(
          colors: PublicColors
              .nopeToYupLinearGradientColorBottomToTopSpin.colors.reversed
              .toList(),
          begin: PublicColors.nopeToYupLinearGradientColorBottomToTopSpin.begin,
          end: PublicColors.nopeToYupLinearGradientColorBottomToTopSpin.end,
          stops: PublicColors.nopeToYupLinearGradientColorBottomToTopSpin.stops,
        );

        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                _displayedText,
                style: textStyle,
                textAlign: TextAlign.center,
              ),
              Opacity(
                opacity: _overlayOpacityAnimation.value,
                child: Text(
                  _displayedText,
                  style: textStyle.copyWith(
                    foreground: Paint()
                      ..shader = reversedGradient.createShader(
                        Rect.fromLTWH(0, 0, _getTextWidth(_displayedText), 80),
                      ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  double _getTextWidth(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: Poster.posterTextStyle.copyWith(fontSize: 80),
      ),
      maxLines: 2,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.width;
  }
}
