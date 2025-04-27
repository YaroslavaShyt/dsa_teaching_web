import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

class TopicRowWidget extends StatelessWidget {
  const TopicRowWidget({
    required this.title,
    required this.onAddPressed,
    super.key,
  });

  final String title;
  final VoidCallback onAddPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Text(
          "Тема: $title",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        MainContainer(
          padding: const EdgeInsetsDirectional.all(4),
          content: IconButton(
            onPressed: onAddPressed,
            icon: Icon(
              Icons.add,
            ),
          ),
        )
      ],
    );
  }
}
