import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class ModelsPage extends StatefulWidget {
  const ModelsPage({super.key});

  @override
  State<ModelsPage> createState() => _ModelsPageState();
}

class _ModelsPageState extends State<ModelsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: size.width / 10,
          child: RiveAnimation.asset(
            'assets/rive/succes.riv',
            alignment: Alignment.center,
            useArtboardSize: true,
            isTouchScrollEnabled: true,
          ),
        ),
      ),
    );
  }
}
