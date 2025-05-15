import 'package:dsa_teaching_web/core/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';

class LessonTitle extends StatelessWidget {
  const LessonTitle({
    required this.titleController,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Назва лекції",
          style: textTheme.bodyMedium?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextFormField(controller: titleController),
      ],
    );
  }
}
