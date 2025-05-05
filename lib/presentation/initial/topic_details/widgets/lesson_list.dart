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
    required this.onDelete,
    super.key,
  });

  final int selectedLesson;
  final ITopic lessons;
  final void Function(int, int, Mode) onLessonSelected;
  final Mode mode;
  final VoidCallback onTap;
  final void Function(String) onDelete;

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
                isSelected: selectedLesson == lesson.id,
                lesson: lesson,
                onEditPressed: () {
                  onTap();
                  onLessonSelected(lesson.id!, lesson.gameId!,
                      mode != Mode.edit ? Mode.edit : Mode.initial);
                },
                onDeletePressed: () {
                  onTap();
                  onLessonSelected(lesson.id!, lesson.gameId!, Mode.initial);
                  onDelete(lesson.id!.toString());
                },
                onTap: () {
                  onLessonSelected(lesson.id!, lesson.gameId!, Mode.read);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
