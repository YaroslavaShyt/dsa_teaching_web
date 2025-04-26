import 'package:dsa_teaching_web/presentation/initial/widgets/input/main_text_field.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('План'),
          ...List.generate(4, (index) {
            return Row(
              children: [
                Text('${index + 1}'),
                const SizedBox(width: 10),
                Expanded(
                  // додаємо щоб розширити текстове поле
                  child: MainTextField(
                    labelText: '',
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
