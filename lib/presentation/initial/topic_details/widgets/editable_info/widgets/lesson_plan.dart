import 'package:dsa_teaching_web/core/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';

class LessonPlan extends StatelessWidget {
  const LessonPlan({
    super.key,
    required this.step1Controller,
    required this.step2Controller,
    required this.step3Controller,
    required this.step4Controller,
  });

  final TextEditingController step1Controller;
  final TextEditingController step2Controller;
  final TextEditingController step3Controller;
  final TextEditingController step4Controller;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          "План",
          style: textTheme.bodyMedium?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextFormField(
          controller: step1Controller,
          decoration: InputDecoration(labelText: "Крок 1"),
        ),
        TextFormField(
          controller: step2Controller,
          decoration: InputDecoration(labelText: "Крок 2"),
        ),
        TextFormField(
          controller: step3Controller,
          decoration: InputDecoration(labelText: "Крок 3"),
        ),
        TextFormField(
          controller: step4Controller,
          decoration: InputDecoration(labelText: "Крок 4"),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
