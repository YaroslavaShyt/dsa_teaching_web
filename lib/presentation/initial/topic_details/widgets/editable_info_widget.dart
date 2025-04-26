import 'package:dsa_teaching_web/core/utils/theme/text_theme.dart';
import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/theory/ilesson_theory.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/buttons/main_outlined_button.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

import 'info_widget.dart';

class EditableInfoWidget extends StatefulWidget {
  const EditableInfoWidget({
    required this.theory,
    required this.game,
    super.key,
  });

  final ILessonTheory theory;
  final IGame game;

  @override
  State<EditableInfoWidget> createState() => _EditableInfoWidgetState();
}

class _EditableInfoWidgetState extends State<EditableInfoWidget> {
  late TextEditingController titleController;
  late TextEditingController step1Controller;
  late TextEditingController step2Controller;
  late TextEditingController step3Controller;
  late TextEditingController step4Controller;
  late TextEditingController theory1Controller;
  late TextEditingController theory2Controller;
  late TextEditingController theory3Controller;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.theory.lessonTitle);
    step1Controller =
        TextEditingController(text: widget.theory.lessonPlan.step1);
    step2Controller =
        TextEditingController(text: widget.theory.lessonPlan.step2);
    step3Controller =
        TextEditingController(text: widget.theory.lessonPlan.step3);
    step4Controller =
        TextEditingController(text: widget.theory.lessonPlan.step4);
    theory1Controller =
        TextEditingController(text: widget.theory.lessonTheory.theoryStep1);
    theory2Controller =
        TextEditingController(text: widget.theory.lessonTheory.theoryStep2);
    theory3Controller =
        TextEditingController(text: widget.theory.lessonTheory.theoryStep3);
  }

  @override
  void dispose() {
    titleController.dispose();
    step1Controller.dispose();
    step2Controller.dispose();
    step3Controller.dispose();
    step4Controller.dispose();
    theory1Controller.dispose();
    theory2Controller.dispose();
    theory3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);

    return Flexible(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height - 100,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainContainer(
                  padding: const EdgeInsetsDirectional.all(10),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Назва уроку",
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextFormField(controller: titleController),
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
                          decoration: InputDecoration(labelText: "Крок 1")),
                      TextFormField(
                          controller: step2Controller,
                          decoration: InputDecoration(labelText: "Крок 2")),
                      TextFormField(
                          controller: step3Controller,
                          decoration: InputDecoration(labelText: "Крок 3")),
                      TextFormField(
                          controller: step4Controller,
                          decoration: InputDecoration(labelText: "Крок 4")),
                      const SizedBox(height: 20),
                      Text(
                        "Теорія",
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextFormField(
                          controller: theory1Controller, maxLines: null),
                      TextFormField(
                          controller: theory2Controller, maxLines: null),
                      TextFormField(
                          controller: theory3Controller, maxLines: null),
                      const SizedBox(height: 20),
                      Text(
                        "Перевірка знань",
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      ...widget.game.tasks.map(
                        (task) {
                          return Padding(
                            padding:
                                const EdgeInsetsDirectional.only(bottom: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(task.question),
                                ...task.answerOptions.map(
                                  (option) {
                                    final index =
                                        task.answerOptions.indexOf(option);
                                    return Row(
                                      children: [
                                        Radio<String>(
                                          value: option,
                                          groupValue: task.correctAnswer,
                                          onChanged: (_) {
                                            setState(() {
                                              task.correctAnswer = option;
                                            });
                                          },
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            initialValue: option,
                                            decoration: InputDecoration(
                                              labelText: "${letters[index]})",
                                            ),
                                            onChanged: (newText) {
                                              setState(
                                                () {
                                                  task.answerOptions[index] =
                                                      newText;
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: MediaQuery.sizeOf(context).width * 0.1,
                          ),
                          child: MainOutlinedButton(
                            onPressed: () {
                              // TODO: handle save
                              print("Save tapped");
                            },
                            child: Text(
                              "Зберегти",
                              style: TextStyle(
                                color: Colors.yellow,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
