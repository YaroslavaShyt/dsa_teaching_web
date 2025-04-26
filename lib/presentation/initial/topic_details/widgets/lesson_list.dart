import 'package:dsa_teaching_web/domain/topic/itopic.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/lesson_name_widget.dart';
import 'package:flutter/material.dart';

class LessonList extends StatelessWidget {
  const LessonList({
    required this.selectedLesson,
    required this.lessons,
    required this.onLessonSelected,
    super.key,
  });

  final int selectedLesson;
  final ITopic lessons;
  final void Function(int) onLessonSelected;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...lessons.lessons.map(
            (lesson) {
              return LessonNameWidget(
                isSelected: selectedLesson == lesson.id,
                lesson: lesson,
                onTap: () => onLessonSelected(lesson.id),
              );
            },
          )
        ],
      ),
    );
  }
}
