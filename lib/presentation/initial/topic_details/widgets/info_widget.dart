import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/theory/ilesson_theory.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    required this.theory,
    required this.game,
    // required this.lesson,
    super.key,
  });

  // final ILesson lesson;
  final ILessonTheory theory;
  final IGame game;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(theory.lessonTitle),
        Text(
          theory.lessonTheory.theoryStep1,
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
        Text(
          theory.lessonTheory.theoryStep2,
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
        Text(
          theory.lessonTheory.theoryStep3,
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }
}
