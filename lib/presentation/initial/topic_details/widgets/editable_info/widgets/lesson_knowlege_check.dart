import 'package:dsa_teaching_web/core/utils/theme/text_theme.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/add_tasks_form.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/save_button.dart';
import 'package:flutter/material.dart';

class LessonKnowledgeCheck extends StatelessWidget {
  const LessonKnowledgeCheck({
    required this.timeLimitController,
    required this.gameControllers,
    required this.onSaveButtonPressed,
    super.key,
  });

  final TextEditingController timeLimitController;
  final List<List<TextEditingController>> gameControllers;
  final VoidCallback onSaveButtonPressed;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);

    return Column(
      children: [
        Text(
          "Перевірка знань",
          style: textTheme.bodyMedium?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 30),
        TextFormField(
          controller: timeLimitController,
          decoration: InputDecoration(labelText: "Час (хв)"),
        ),
        const SizedBox(height: 30),
        AddTasksForm(
          gameControllers: gameControllers,
        ),
        SaveButton(
          onPressed: onSaveButtonPressed,
        ),
      ],
    );
  }
}
