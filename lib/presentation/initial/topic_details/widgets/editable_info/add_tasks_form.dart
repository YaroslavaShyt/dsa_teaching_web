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
  late List<int?> correctAnswers;

  @override
  void initState() {
    super.initState();
    correctAnswers = List.filled(4, null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        4,
        (int index) => _buildForm(
          context,
          number: index + 1,
          controllers: widget.gameControllers[index],
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
          Row(
            spacing: 10,
            children: [
              Text("Правильна відповідь:"),
              DropdownButton(
                iconEnabledColor: Colors.white,
                value: correctAnswers[number - 1],
                items: [
                  DropdownMenuItem(value: 1, child: Text('a)')),
                  DropdownMenuItem(value: 2, child: Text('b)')),
                  DropdownMenuItem(value: 3, child: Text('c)')),
                  DropdownMenuItem(value: 4, child: Text('d)')),
                ],
                onChanged: (value) => _onChanged(number - 1, value as int ?? 0),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _onChanged(int number, int value) {
    setState(() {
      correctAnswers[number] = value;
    });
    widget.gameControllers[number][5] =
        TextEditingController(text: widget.gameControllers[number][value].text);
    print(widget.gameControllers[number][5].text);
  }
}
