import 'package:dsa_teaching_web/domain/topic/itopic.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/bloc/topic_details_state.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/lesson_name_widget.dart';
import 'package:flutter/material.dart';

class LessonList extends StatelessWidget {
  const LessonList({
    required this.selectedLesson,
    required this.lessons,
    required this.onLessonSelected,
    required this.onTap,
    required this.mode,
    super.key,
  });

  final int selectedLesson;
  final ITopic lessons;
  final void Function(int, Mode) onLessonSelected;
  final Mode mode;
  final VoidCallback onTap;

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
                mode: mode,
                onEditPressed: () {
                  onTap();
                  onLessonSelected(lesson.id, Mode.edit);
                },
                isSelected: selectedLesson == lesson.id,
                lesson: lesson,
                onTap: () => onLessonSelected(lesson.id, Mode.read),
              );
            },
          )
        ],
      ),
    );
  }
}
