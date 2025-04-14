import 'package:flutter/material.dart';

class PorscheLogo extends StatefulWidget {
  final double theta;
  final double logoTheta;
  const PorscheLogo({super.key, required this.theta, required this.logoTheta});

  @override
  State<PorscheLogo> createState() => _PorscheLogoState();
}

class _PorscheLogoState extends State<PorscheLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.repeat(reverse: true);
  }

  @override
  void didUpdateWidget(PorscheLogo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.theta >= widget.logoTheta && oldWidget.theta < widget.logoTheta) {
      _controller.stop();
      _controller.animateTo(0.0, duration: Duration(milliseconds: 300));
    } else if (widget.theta < widget.logoTheta && oldWidget.theta >= widget.logoTheta) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height / 30,
      ),
      child: FadeTransition(
        opacity: _animation,
        child: Transform.scale(
          scaleX: 1.2,
          scaleY: 1.1,
          child: AnimatedCrossFade(
            crossFadeState: CrossFadeState.showFirst,
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 5000),
            firstCurve: Curves.linear,
            secondCurve: Curves.linear,
            firstChild: Image.asset(
              'assets/image/text_logo.jpeg',
              height: MediaQuery.sizeOf(context).height / 6,
              width: MediaQuery.sizeOf(context).width / 1.5,
              filterQuality: FilterQuality.high,
            ),
            secondChild: Text(""),
          ),
        ),
      ),
    );
  }
}
