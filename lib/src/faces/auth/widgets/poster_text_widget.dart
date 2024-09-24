import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lyricfy/src/faces/styles/public/colors.dart';

class Poster {
  static const posterTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 60, // Daha büyük yazı boyutu
    fontWeight: FontWeight.w900, // En kalın yazı stili
  );
}

class PosterTextWidget extends StatefulWidget {
  final List<String> posterText;

  const PosterTextWidget({super.key, required this.posterText});

  @override
  _PosterTextWidgetState createState() => _PosterTextWidgetState();
}

class _PosterTextWidgetState extends State<PosterTextWidget>
    with SingleTickerProviderStateMixin {
  int _currentWordIndex = 0; // Mevcut kelimenin indeksi
  String _displayedText = ""; // Gösterilecek metin
  Timer? _timer;
  int _charIndex = 0; // Mevcut harfin indeksi
  bool _isDeleting = false; // Silme işlemi yapılıyor mu

  @override
  void initState() {
    super.initState();
    _startTypingAnimation();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTypingAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      setState(() {
        if (!_isDeleting) {
          if (_charIndex < widget.posterText[_currentWordIndex].length) {
            _displayedText += widget.posterText[_currentWordIndex][_charIndex];
            _charIndex++;
          } else {
            // Bir süre bekle ve sonra silmeye başla
            Future.delayed(const Duration(seconds: 1), () {
              _isDeleting = true;
            });
          }
        } else {
          if (_displayedText.isNotEmpty) {
            _displayedText =
                _displayedText.substring(0, _displayedText.length - 1);
          } else {
            _isDeleting = false;
            _charIndex = 0;
            _currentWordIndex =
                (_currentWordIndex + 1) % widget.posterText.length;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Poster.posterTextStyle.copyWith(
      fontSize: 80,
      fontWeight: FontWeight.w900,
      foreground: Paint()
        ..shader = PublicColors.nopeToYupLinearGradientColorBottomToTopSpin
            .createShader(
          Rect.fromLTWH(0, 0, _getTextWidth(_displayedText), 80),
        ),
    );

    return Center(
      child: Text(
        _displayedText,
        style: textStyle,
        textAlign: TextAlign.center,
      ),
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
