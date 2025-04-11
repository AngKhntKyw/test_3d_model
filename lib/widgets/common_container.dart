import 'package:flutter/material.dart';

class CommonContainer extends StatefulWidget {
  final Color color;
  final Widget? child;

  const CommonContainer({super.key, required this.color, this.child});

  @override
  State<CommonContainer> createState() => _CommonContainerState();
}

class _CommonContainerState extends State<CommonContainer> {
  bool onHovered = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return MouseRegion(
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
        height: size.height - (size.height / 20),
        width: size.width,
        decoration: BoxDecoration(
          border: Border.all(color: widget.color, width: 2),
          color: widget.color.withValues(alpha: !onHovered ? 0.3 : 0),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(MediaQuery.sizeOf(context).width / 80),
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width / 80),
        child: widget.child,
      ),
    );
  }
}
