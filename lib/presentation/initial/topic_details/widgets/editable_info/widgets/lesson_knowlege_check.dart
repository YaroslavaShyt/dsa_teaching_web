import 'package:dsa_teaching_web/core/utils/theme/text_theme.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/edit_info_tab_bar.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/save_button.dart';
import 'package:flutter/material.dart';

class LessonKnowledgeCheck extends StatelessWidget {
  const LessonKnowledgeCheck({
    required this.timeLimitController,
    required this.gameControllersEasy,
    required this.gameControllersMedium,
    required this.gameControllersHard,
    required this.onSaveButtonPressed,
    super.key,
  });

  final TextEditingController timeLimitController;
  final List<List<TextEditingController>> gameControllersEasy;
  final List<List<TextEditingController>> gameControllersMedium;
  final List<List<TextEditingController>> gameControllersHard;
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
        SizedBox(
          height: 500,
          child: EditInfoTabBar(
            gameControllersEasy: gameControllersEasy,
            gameControllersMedium: gameControllersMedium,
            gameControllersHard: gameControllersHard,
          ),
        ),
        SaveButton(
          onPressed: onSaveButtonPressed,
        ),
      ],
    );
  }
}
