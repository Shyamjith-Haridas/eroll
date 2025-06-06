import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AnimatedWrapperWidget extends StatelessWidget {
  const AnimatedWrapperWidget({
    super.key,
    required this.child,
    required this.index,
    this.delayPerItem = 150,
    this.duration = 400,
  });

  final Widget child;
  final int index;
  final int delayPerItem;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 30,
      delay: Duration(milliseconds: duration * index),
      duration: Duration(milliseconds: duration),
      child: child,
    );
  }
}
