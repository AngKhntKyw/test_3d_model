import 'package:flutter/material.dart';
import 'package:test_3d_models/screens/desktop_layout.dart';
import 'package:test_3d_models/screens/mobile_layout.dart';
import 'package:test_3d_models/screens/tablet_layout.dart';
import 'package:test_3d_models/widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      drawerScrimColor: Colors.black.withValues(alpha: 0.8),
      backgroundColor: Colors.white,
      drawer: DrawerWidget(),

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
