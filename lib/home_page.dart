import 'package:flutter/material.dart';
import 'package:test_3d_models/screens/desktop_layout.dart';
import 'package:test_3d_models/screens/mobile_layout.dart';
import 'package:test_3d_models/screens/tablet_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 950) {
            return DesktopLayout();
          } else if (constraints.maxWidth > 600) {
            return TabletLayout();
          } else {
            return MobileLayout();
          }
        },
      ),
    );
  }
}
