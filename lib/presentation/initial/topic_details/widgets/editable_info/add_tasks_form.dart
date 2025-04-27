import 'package:dsa_teaching_web/core/utils/theme/app_color_theme.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/input/main_text_field.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

class AddTasksForm extends StatelessWidget {
  const AddTasksForm({
    required this.gameControllers,
    super.key,
  });

  final List<List<TextEditingController>> gameControllers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        4,
        (int index) => _buildForm(
          context,
          number: index + 1,
          controllers: gameControllers[index],
        ),
      ),
    );
  }

  Widget _buildForm(
    BuildContext context, {
    required int number,
    required List<TextEditingController> controllers,
  }) {
    return MainContainer(
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      padding: const EdgeInsetsDirectional.all(10),
      color: getColorScheme(context).surface,
      content: Column(
        spacing: 6,
        children: [
          MainTextField(
            labelText: 'Питання $number',
            controller: controllers[0],
          ),
          MainTextField(
            labelText: 'a)',
            controller: controllers[1],
          ),
          MainTextField(
            labelText: 'b)',
            controller: controllers[2],
          ),
          MainTextField(
            labelText: 'c)',
            controller: controllers[3],
          ),
          MainTextField(
            labelText: 'd)',
            controller: controllers[4],
          ),
        ],
      ),
    );
  }
}
