import 'dart:async';
import 'dart:html' as html;
import 'dart:io';

import 'package:dsa_teaching_web/core/utils/logger/logger.dart';
import 'package:dsa_teaching_web/data/game/task.dart';
import 'package:dsa_teaching_web/domain/game/game_answers_type.dart';
import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/game/itask.dart';
import 'package:dsa_teaching_web/domain/theory/ilesson_theory.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/widgets/lesson_knowlege_check.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/widgets/lesson_plan.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/widgets/lesson_theory.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/widgets/lesson_title.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

part 'save_data_typedef.dart';

class EditableInfoWidget extends StatefulWidget {
  const EditableInfoWidget({
    required this.saveInfo,
    this.theory,
    this.game,
    super.key,
  });

  final ILessonTheory? theory;
  final IGame? game;
  final SaveDataFunction saveInfo;

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

  File? theory1Gif;
  File? theory2Gif;
  File? theory3Gif;
  File? theory4Gif;

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
    return Flexible(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height - 100,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainContainer(
                padding: const EdgeInsetsDirectional.all(10),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LessonTitle(titleController: titleController),
                    LessonPlan(
                      step1Controller: step1Controller,
                      step2Controller: step2Controller,
                      step3Controller: step3Controller,
                      step4Controller: step4Controller,
                    ),
                    LessonTheory(
                      onPickImage: _pickImage,
                      onRemoveImage: _remove,
                      theory1Controller: theory1Controller,
                      theoryImage1Url: theoryImage1Url,
                      theory2Controller: theory2Controller,
                      theoryImage2Url: theoryImage2Url,
                      theory3Controller: theory3Controller,
                      theoryImage3Url: theoryImage3Url,
                      theory4Controller: theory4Controller,
                      theoryImage4Url: theoryImage4Url,
                    ),
                    LessonKnowledgeCheck(
                      timeLimitController: timeLimitController,
                      gameControllers: gameControllers,
                      onSaveButtonPressed: _onSaveButtonPressed,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSaveButtonPressed() {
    widget.saveInfo(
      theoryId: widget.theory?.lessonTheory.id,
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
