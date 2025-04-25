import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MainAnimationWidget extends StatelessWidget {
  const MainAnimationWidget({
    required this.name,
    required this.height,
    required this.width,
    super.key,
  });

  final double height;
  final double width;
  final String name;

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      height: height,
      width: width,
      name,
    );
  }
}
