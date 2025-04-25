import 'package:flutter/material.dart';
import 'package:test_3d_models/pages/models_page.dart';
import 'package:test_3d_models/pages/setting_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Drawer(
          width: size.width / 3,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.all(size.width / 30),
            children: [
              ListTile(
                title: Text(
                  'Models',
                  style: TextStyle(
                    fontSize: size.height / 45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ModelsPage()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: size.height / 45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(width: size.width / 40),

        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, color: Colors.white),
        ),
      ],
    );
  }
}
