import 'package:dsa_teaching_web/core/utils/theme/app_color_theme.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/input/main_text_field.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

class AddTasksForm extends StatefulWidget {
  const AddTasksForm({
    required this.gameControllers,
    super.key,
  });

  final List<List<TextEditingController>> gameControllers;

  @override
  State<AddTasksForm> createState() => _AddTasksFormState();
}

class _AddTasksFormState extends State<AddTasksForm> {
  late List<String?> correctAnswers;

  @override
  void initState() {
    super.initState();

    correctAnswers = List.generate(4, (index) {
      final text = widget.gameControllers[index][5].text;
      for (int i = 1; i <= 4; i++) {
        if (widget.gameControllers[index][i].text == text) {
          return ['a', 'b', 'c', 'd'][i - 1];
        }
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        4,
        (index) => _buildForm(
          context,
          number: index + 1,
          controllers: widget.gameControllers[index],
          index: index,
        ),
      ),
    );
  }

  Widget _buildForm(
    BuildContext context, {
    required int number,
    required int index,
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
              labelText: 'Питання $number', controller: controllers[0]),
          MainTextField(labelText: 'a)', controller: controllers[1]),
          MainTextField(labelText: 'b)', controller: controllers[2]),
          MainTextField(labelText: 'c)', controller: controllers[3]),
          MainTextField(labelText: 'd)', controller: controllers[4]),
          Row(
            spacing: 10,
            children: [
              const Text("Правильна відповідь:"),
              DropdownButton<String>(
                value: correctAnswers[index],
                iconEnabledColor: Colors.white,
                items: const [
                  DropdownMenuItem(value: 'a', child: Text('a)')),
                  DropdownMenuItem(value: 'b', child: Text('b)')),
                  DropdownMenuItem(value: 'c', child: Text('c)')),
                  DropdownMenuItem(value: 'd', child: Text('d)')),
                ],
                onChanged: (value) => _onChanged(index, value),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _onChanged(int questionIndex, String? selectedKey) {
    setState(() {
      correctAnswers[questionIndex] = selectedKey;

      final index = switch (selectedKey) {
        'a' => 1,
        'b' => 2,
        'c' => 3,
        'd' => 4,
        _ => 1,
      };

      widget.gameControllers[questionIndex][5].text =
          widget.gameControllers[questionIndex][index].text;
    });
  }
}
