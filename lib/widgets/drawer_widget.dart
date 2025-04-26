import 'package:flutter/material.dart';
import 'package:test_3d_models/widgets/car_container.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String selectedCategory = 'Car Models';

  // Sample data for each category
  final Map<String, List<String>> categoryItems = {
    'Car Models': ['Sedan', 'SUV', 'Coupe', 'Hatchback', 'Convertible'],
    'Settings': ['Profile', 'Notifications', 'Privacy', 'Account', 'Theme'],
    'Service': [
      'Oil Change',
      'Tire Rotation',
      'Brake Check',
      'Battery Replacement',
      'Car Wash',
    ],
  };
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Drawer(
          width: size.width / 2,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          backgroundColor: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(size.width / 30),
                  children: [
                    ...categoryItems.keys.map((category) {
                      return ListTile(
                        splashColor: Colors.grey.withValues(alpha: 0.6),
                        tileColor: Colors.transparent,
                        selectedTileColor: Colors.grey.withValues(alpha: 0.2),
                        selectedColor: Colors.black,
                        title: Text(
                          category,
                          style: TextStyle(
                            fontSize: size.height / 45,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        selected: selectedCategory == category,
                        onTap: () {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                        trailing: Icon(Icons.keyboard_arrow_right),
                      );
                    }),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ...categoryItems[selectedCategory]!.map((item) {
                      return CarContainer(
                        color: Colors.black,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Positioned.fill(
                                child: Image.asset(
                                  'assets/image/showcase_car.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: size.height / 45,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
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
