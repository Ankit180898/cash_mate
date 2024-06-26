import 'package:cash_mate/utils/utils.dart';
import 'package:flutter/material.dart';

class AnimatedCursor extends StatefulWidget {
  final double height;
  const AnimatedCursor({super.key, required this.height});

  @override
  AnimatedCursorState createState() => AnimatedCursorState();
}

class AnimatedCursorState extends State<AnimatedCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: 600.ms);
    animation =
        CurvedAnimation(curve: Curves.easeInOut, parent: animationController);
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, child) {
        return Opacity(
          opacity: animation.value,
          child: child,
        );
      },
      child: Container(
        width: 2.5,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
