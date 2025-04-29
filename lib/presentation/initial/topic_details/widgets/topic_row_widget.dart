import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

import 'add_lesson_button.dart';

class TopicRowWidget extends StatelessWidget {
  const TopicRowWidget({
    required this.title,
    required this.onAddPressed,
    required this.onBackPressed,
    required this.isAdding,
    super.key,
  });

  final String title;
  final VoidCallback onAddPressed;
  final VoidCallback onBackPressed;
  final bool isAdding;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10,
          children: [
            MainContainer(
              padding: const EdgeInsetsDirectional.all(4),
              content: IconButton(
                onPressed: onBackPressed,
                icon: Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
            Text(
              "Тема: $title",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        AddLessonButton(
          onTap: onAddPressed,
          isAdding: isAdding,
        ),
      ],
    );
  }
}
