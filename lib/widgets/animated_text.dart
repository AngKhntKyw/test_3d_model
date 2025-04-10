import 'dart:developer';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedText extends StatefulWidget {
  final String text;

  const AnimatedText({super.key, required this.text});

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  double visibleFraction = 0;
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        visibleFraction = info.visibleFraction;
      },

      child: SizedBox(
        width: 250.0,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 30.0, fontFamily: 'Agne'),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('Discipline is the best tool'),
              TypewriterAnimatedText('Design first, then code'),
              TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
              TypewriterAnimatedText('Do not test bugs out, design them out'),
            ],
            onTap: () {
              log("Tap Event");
            },
          ),
        ),
      ),
    );
  }
}
