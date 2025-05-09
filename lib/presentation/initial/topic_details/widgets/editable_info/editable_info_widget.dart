import 'dart:async';
import 'dart:html' as html;

import 'package:dsa_teaching_web/core/utils/logger/logger.dart';
import 'package:dsa_teaching_web/core/utils/theme/text_theme.dart';
import 'package:dsa_teaching_web/data/game/task.dart';
import 'package:dsa_teaching_web/domain/game/game_answers_type.dart';
import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/game/itask.dart';
import 'package:dsa_teaching_web/domain/theory/ilesson_theory.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/add_image_button.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/add_tasks_form.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/save_button.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

class EditableInfoWidget extends StatefulWidget {
  const EditableInfoWidget({
    required this.saveInfo,
    this.theory,
    this.game,
    super.key,
  });

  final ILessonTheory? theory;
  final IGame? game;
  final Future<void> Function({
    required String title,
    required String step1,
    required String step2,
    required String step3,
    required String step4,
    required String theoryStep1,
    required String theoryStep2,
    required String theoryStep3,
    required String theoryStep4,
    required html.File? theoryImageStep1,
    required html.File? theoryImageStep2,
    required html.File? theoryImageStep3,
    required html.File? theoryImageStep4,
    required int timeLimit,
    required List<ITask> tasks,
    required bool isNewLesson,
    required int theoryId,
  }) saveInfo;

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
  late TextEditingController theory4Controller;
  late TextEditingController timeLimitController;

  List<List<TextEditingController>> gameControllers = List.generate(
    4,
    (int index) => List.generate(6, (int index) => TextEditingController()),
  );

  html.File? theoryImage1File;
  html.File? theoryImage2File;
  html.File? theoryImage3File;
  html.File? theoryImage4File;
  String? theoryImage1Url;
  String? theoryImage2Url;
  String? theoryImage3Url;
  String? theoryImage4Url;

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);

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
                        "Назва лекції",
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
                      Text(
                        "Теорія",
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextFormField(
                        controller: theory1Controller,
                        maxLines: null,
                      ),
                      AddImageButton(
                        onTap: () => _pickImage(1),
                        currentFile: theoryImage1Url,
                        remove: () => _remove(1),
                      ),
                      TextFormField(
                        controller: theory2Controller,
                        maxLines: null,
                      ),
                      AddImageButton(
                        onTap: () => _pickImage(2),
                        currentFile: theoryImage2Url,
                        remove: () => _remove(2),
                      ),
                      TextFormField(
                        controller: theory3Controller,
                        maxLines: null,
                      ),
                      AddImageButton(
                        onTap: () => _pickImage(3),
                        currentFile: theoryImage3Url,
                        remove: () => _remove(3),
                      ),
                      TextFormField(
                        controller: theory4Controller,
                        maxLines: null,
                      ),
                      AddImageButton(
                        onTap: () => _pickImage(4),
                        currentFile: theoryImage4Url,
                        remove: () => _remove(4),
                      ),
                      const SizedBox(height: 20),
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
                      AddTasksForm(
                        gameControllers: gameControllers,
                      ),
                      SaveButton(
                        onPressed: _onSaveButtonPressed,
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

  void _onSaveButtonPressed() {
    if (widget.theory?.lessonTheory.id == null) return;
    widget.saveInfo(
      theoryId: widget.theory!.lessonTheory.id!,
      title: titleController.text,
      step1: step1Controller.text,
      step2: step2Controller.text,
      step3: step3Controller.text,
      step4: step4Controller.text,
      theoryStep1: theory1Controller.text,
      theoryStep2: theory2Controller.text,
      theoryStep3: theory3Controller.text,
      theoryStep4: theory4Controller.text,
      timeLimit: int.parse(timeLimitController.text) * 60,
      tasks: _fetchTasks(),
      isNewLesson: widget.theory == null,
      theoryImageStep1: theoryImage1File,
      theoryImageStep2: theoryImage2File,
      theoryImageStep3: theoryImage3File,
      theoryImageStep4: theoryImage4File,
    );
    _initControllers();
  }

  List<ITask> _fetchTasks() {
    return gameControllers.map(
      (controllersList) {
        return Task(
          questionNumber: gameControllers.indexOf(controllersList) + 1,
          question: controllersList[0].text,
          answerOptions: [
            controllersList[1].text,
            controllersList[2].text,
            controllersList[3].text,
            controllersList[4].text,
          ],
          correctAnswer: controllersList[5].text,
          type: GameAnswersType.row,
        );
      },
    ).toList();
  }

  void _initControllers() {
    titleController = TextEditingController(text: widget.theory?.lessonTitle);
    step1Controller =
        TextEditingController(text: widget.theory?.lessonPlan.step1);
    step2Controller =
        TextEditingController(text: widget.theory?.lessonPlan.step2);
    step3Controller =
        TextEditingController(text: widget.theory?.lessonPlan.step3);
    step4Controller =
        TextEditingController(text: widget.theory?.lessonPlan.step4);
    theory1Controller =
        TextEditingController(text: widget.theory?.lessonTheory.theoryStep1);
    theory2Controller =
        TextEditingController(text: widget.theory?.lessonTheory.theoryStep2);
    theory3Controller =
        TextEditingController(text: widget.theory?.lessonTheory.theoryStep3);
    theory4Controller =
        TextEditingController(text: widget.theory?.lessonTheory.theoryStep4);
    timeLimitController = TextEditingController(
      text: widget.game != null ? "${widget.game!.timeLimit / 60}" : null,
    );

    if (widget.theory != null && widget.game != null) {
      gameControllers = List.generate(
        4,
        (int indexG) => List.generate(
          6,
          (int index) {
            if (index == 0) {
              return TextEditingController(
                text: widget.game!.tasks[indexG].question,
              );
            }
            if (index == 5) {
              return TextEditingController(
                text: widget.game!.tasks[indexG].correctAnswer,
              );
            }
            if (index >= 1 && index <= 4) {
              return TextEditingController(
                text: widget.game!.tasks[indexG].answerOptions[index - 1],
              );
            }
            return TextEditingController();
          },
        ),
      );
    }
    if (widget.theory?.lessonTheory.theoryImageStep1.isNotEmpty ?? false) {
      theoryImage1Url = widget.theory?.lessonTheory.theoryImageStep1;
    }
    if (widget.theory?.lessonTheory.theoryImageStep2.isNotEmpty ?? false) {
      theoryImage2Url = widget.theory?.lessonTheory.theoryImageStep2;
    }
    if (widget.theory?.lessonTheory.theoryImageStep3.isNotEmpty ?? false) {
      theoryImage3Url = widget.theory?.lessonTheory.theoryImageStep3;
    }
    if (widget.theory?.lessonTheory.theoryImageStep4.isNotEmpty ?? false) {
      theoryImage4Url = widget.theory?.lessonTheory.theoryImageStep4;
    }
  }

  void _disposeControllers() {
    titleController.dispose();
    step1Controller.dispose();
    step2Controller.dispose();
    step3Controller.dispose();
    step4Controller.dispose();
    theory1Controller.dispose();
    theory2Controller.dispose();
    theory3Controller.dispose();
    theory4Controller.dispose();
    timeLimitController.dispose();
    gameControllers.forEach((controllersList) {
      controllersList.forEach((controller) => controller.dispose());
    });
  }

  Future<void> _pickImage(int step) async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((e) async {
      final files = uploadInput.files;
      if (files!.isEmpty) return;

      final file = files[0];

      setState(() {
        if (step == 1) {
          theoryImage1File = file;
          fileToDataUrl(file, 1);
        } else if (step == 2) {
          theoryImage2File = file;
          fileToDataUrl(file, 2);
        } else if (step == 3) {
          theoryImage3File = file;
          fileToDataUrl(file, 3);
        } else if (step == 4) {
          theoryImage4File = file;
          fileToDataUrl(file, 4);
        }
      });
    });
  }

  Future<void> fileToDataUrl(html.File file, int index) async {
    try {
      final reader = html.FileReader();
      final completer = Completer<String>();

      reader.onLoadEnd.listen((_) {
        completer.complete(reader.result as String);
      });

      reader.readAsDataUrl(file);

      String data = await completer.future;

      setState(() {
        if (index == 1) {
          theoryImage1Url = data;
        }
        if (index == 2) {
          theoryImage2Url = data;
        }
        if (index == 3) {
          theoryImage3Url = data;
        }
        if (index == 4) {
          theoryImage4Url = data;
        }
      });
    } catch (error) {
      logger.e(error);
    }
  }

  void _remove(int index) {
    setState(() {
      if (index == 1) {
        theoryImage1File = null;
        theoryImage1Url = null;
      }
      if (index == 2) {
        theoryImage2File = null;
        theoryImage2Url = null;
      }
      if (index == 3) {
        theoryImage3File = null;
        theoryImage3Url = null;
      }
      if (index == 4) {
        theoryImage4File = null;
        theoryImage4Url = null;
      }
    });
    _pickImage(index);
  }
}
