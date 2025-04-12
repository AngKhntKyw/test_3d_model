import 'package:flutter/material.dart';

class MarqueeContainer extends StatefulWidget {
  final Color color;
  final Widget? child;
  const MarqueeContainer({super.key, required this.color, this.child});

  @override
  State<MarqueeContainer> createState() => _MarqueeContainerState();
}

class _MarqueeContainerState extends State<MarqueeContainer> {
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
        height: !onHovered ? size.width / 4 : size.width / 3.5,
        width: !onHovered ? size.width / 4 : size.width / 3.5,
        decoration: BoxDecoration(
          border: Border.all(color: widget.color, width: 2),
          color: widget.color.withValues(alpha: !onHovered ? 0.3 : 0.4),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(MediaQuery.sizeOf(context).width / 80),
        // padding: EdgeInsets.all(MediaQuery.sizeOf(context).width / 80),
        child: widget.child,
      ),
    );
  }
}
