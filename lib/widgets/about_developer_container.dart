import 'package:flutter/material.dart';

class AboutDeveloperContainer extends StatefulWidget {
  const AboutDeveloperContainer({super.key});

  @override
  State<AboutDeveloperContainer> createState() =>
      _AboutDeveloperContainerState();
}

class _AboutDeveloperContainerState extends State<AboutDeveloperContainer> {
  bool onHovered = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'About the Developer',
          style: TextStyle(
            fontSize: size.height / 40,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Developer profile row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Developer image
            MouseRegion(
              onEnter: (event) {
                setState(() {
                  onHovered = true;
                });
              },
              onExit: (event) {
                setState(() {
                  onHovered = false;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: !onHovered ? size.height / 6 : size.height / 5.5,
                height: !onHovered ? size.height / 6 : size.height / 5.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 2),
                  image: const DecorationImage(
                    image: AssetImage('assets/image/profile.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: size.width / 40),

            // Developer info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aung Khant Kyaw',
                    style: TextStyle(
                      fontSize: size.height / 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height / 40),

                  Text(
                    'Flutter Developer & Web Designer',
                    style: TextStyle(
                      fontSize: size.height / 50,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    maxLines: 2,
                    'aungkhantkyaw8918@gmail.com',
                    style: TextStyle(fontSize: size.height / 60),
                  ),
                  SizedBox(height: size.height / 20),
                  Text(
                    'Passionate about creating beautiful, functional applications with Flutter. '
                    'I specialize in cross-platform development with a focus on clean UI/UX design.',
                    style: TextStyle(fontSize: size.height / 60),
                  ),
                ],
              ),
            ),
          ],
        ),

        Text(
          '© 2023 Aung Khant Kyaw. All rights reserved.',
          style: TextStyle(fontSize: size.height / 70, color: Colors.grey),
        ),
      ],
    );
  }
}
