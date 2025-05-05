import 'package:dsa_teaching_web/presentation/initial/widgets/lottie_animations/robot_animation.dart';
import 'package:flutter/material.dart';

class SelectLessonPlaceholder extends StatelessWidget {
  const SelectLessonPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              width: 2,
              color: Colors.white.withValues(alpha: 0.4),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RobotAnimation(
              height: 200,
              width: 180,
            ),
            Text("Оберіть лекцію, аби побачити деталі"),
          ],
        ),
      ),
    );
  }
}
