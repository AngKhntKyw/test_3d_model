import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  double posX = 200;
  double posY = 200;

  @override
  void initState() {
    super.initState();
    // Listen to keyboard events
    RawKeyboard.instance.addListener(_handleKey);
  }

  @override
  void dispose() {
    RawKeyboard.instance.removeListener(_handleKey);
    super.dispose();
  }

  void _handleKey(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      setState(() {
        if (event.logicalKey == LogicalKeyboardKey.keyW) posY -= 10;
        if (event.logicalKey == LogicalKeyboardKey.arrowUp) posY -= 10;

        if (event.logicalKey == LogicalKeyboardKey.keyS) posY += 10;
        if (event.logicalKey == LogicalKeyboardKey.arrowDown) posY += 10;

        if (event.logicalKey == LogicalKeyboardKey.keyA) posX -= 10;
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) posX -= 10;

        if (event.logicalKey == LogicalKeyboardKey.keyD) posX += 10;
        if (event.logicalKey == LogicalKeyboardKey.arrowRight) posX += 10;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(left: posX, top: posY, child: Icon(Icons.local_taxi)),
        ],
      ),
    );
  }
}
