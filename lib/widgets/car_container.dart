import 'package:flutter/material.dart';

class CarContainer extends StatefulWidget {
  final Color color;
  final Widget? child;

  const CarContainer({super.key, required this.color, this.child});

  @override
  State<CarContainer> createState() => _CarContainerState();
}

class _CarContainerState extends State<CarContainer> {
  bool onHovered = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return MouseRegion(
      onEnter: (_) => setState(() => onHovered = true),
      onExit: (_) => setState(() => onHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: !onHovered ? size.height / 3 : size.height / 2.8,
        decoration: BoxDecoration(
          border: Border.all(color: widget.color, width: 0.5),
          color: widget.color.withValues(alpha: onHovered ? 0.3 : 0),
          borderRadius: BorderRadius.circular(10),
        ),
        width: size.width,
        margin: EdgeInsets.all(MediaQuery.sizeOf(context).width / 80),
        // padding: EdgeInsets.all(MediaQuery.sizeOf(context).width / 100),
        child: widget.child,
      ),
    );
  }
}
