import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

class TopicRowWidget extends StatelessWidget {
  const TopicRowWidget({
    required this.title,
    required this.onDeletePressed,
    required this.onBackPressed,
    super.key,
  });

  final String title;
  final VoidCallback onDeletePressed;
  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        // MainContainer(
        //   padding: const EdgeInsetsDirectional.all(4),
        //   content: IconButton(
        //     onPressed: onDeletePressed,
        //     icon: Icon(
        //       Icons.delete,
        //     ),
        //   ),
        // )
      ],
    );
  }
}
