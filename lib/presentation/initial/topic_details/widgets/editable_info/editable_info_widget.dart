import 'dart:async';

import 'package:dsa_teaching_web/data/game/task.dart';
import 'package:dsa_teaching_web/data/teaching/web_file.dart';
import 'package:dsa_teaching_web/domain/game/game_answers_type.dart';
import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/game/itask.dart';
import 'package:dsa_teaching_web/domain/theory/ilesson_theory.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/bloc/topic_details_cubit.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/widgets/lesson_knowlege_check.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/widgets/lesson_plan.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/widgets/lesson_theory.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/widgets/lesson_title.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  List<List<TextEditingController>> gameControllersEasy = List.generate(
    4,
    (int index) =>
        List.generate(6, (index) => TextEditingController(text: '$index e')),
  );
  List<List<TextEditingController>> gameControllersMedium = List.generate(
    4,
    (int index) =>
        List.generate(6, (_) => TextEditingController(text: '$index m')),
  );

  List<List<TextEditingController>> gameControllersHard = List.generate(
    4,
    (int index) =>
        List.generate(6, (_) => TextEditingController(text: '$index h')),
  );

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
    final state = context.watch<TopicDetailsCubit>().state;

    return Flexible(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height - 100,
        child: SingleChildScrollView(
          child: Column(
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
                      onPickImage: _onPickImage,
                      onRemoveImage: _onRemoveImage,
                      theory1Controller: theory1Controller,
                      theoryImage1Url: state.imageUrls[1],
                      theory2Controller: theory2Controller,
                      theoryImage2Url: state.imageUrls[2],
                      theory3Controller: theory3Controller,
                      theoryImage3Url: state.imageUrls[3],
                      theory4Controller: theory4Controller,
                      theoryImage4Url: state.imageUrls[4],
                    ),
                    LessonKnowledgeCheck(
                      timeLimitController: timeLimitController,
                      gameControllersEasy: gameControllersEasy,
                      gameControllersMedium: gameControllersMedium,
                      gameControllersHard: gameControllersHard,
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

  void _onPickImage(int step) {
    context.read<TopicDetailsCubit>().pickFile(step);
  }

  void _onRemoveImage(int step) {
    context.read<TopicDetailsCubit>().removePickedFile(step);
  }

  void _onSaveButtonPressed() {
    final state = context.read<TopicDetailsCubit>().state;

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
      theoryImageStep1: state.imageFiles[1],
      theoryImageStep2: state.imageFiles[2],
      theoryImageStep3: state.imageFiles[3],
      theoryImageStep4: state.imageFiles[4],
    );
  }

  List<ITask> _fetchTasks() {
    final List<ITask> easyTasks = gameControllersEasy.map(
      (controllersList) {
        return Task(
          taskLevel: TaskLevel.easy,
          questionNumber: gameControllersEasy.indexOf(controllersList) + 1,
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
    final List<ITask> mediumTasks = gameControllersMedium.map(
      (controllersList) {
        return Task(
          taskLevel: TaskLevel.medium,
          questionNumber: gameControllersMedium.indexOf(controllersList) + 1,
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
    final List<ITask> hardTasks = gameControllersHard.map(
      (controllersList) {
        return Task(
          taskLevel: TaskLevel.hard,
          questionNumber: gameControllersHard.indexOf(controllersList) + 1,
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
    return [...easyTasks, ...mediumTasks, ...hardTasks];
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
      text: widget.game != null ? "${widget.game!.timeLimit ~/ 60}" : '',
    );

    if (widget.theory != null && widget.game != null) {
      gameControllersEasy = List.generate(
        4,
        (int indexG) => List.generate(
          6,
          (int index) {
            if (index == 0) {
              return TextEditingController(
                  text: widget.game!.tasks[TaskLevel.easy]?[indexG].question);
            }
            if (index == 5) {
              return TextEditingController(
                  text: widget
                      .game!.tasks[TaskLevel.easy]?[indexG].correctAnswer);
            }
            if (index >= 1 && index <= 4) {
              return TextEditingController(
                  text: widget.game!.tasks[TaskLevel.easy]?[indexG]
                      .answerOptions[index - 1]);
            }
            return TextEditingController();
          },
        ),
      );
      gameControllersMedium = List.generate(
        4,
        (int indexG) => List.generate(
          6,
          (int index) {
            if (index == 0) {
              return TextEditingController(
                  text: widget.game!.tasks[TaskLevel.medium]?[indexG].question);
            }
            if (index == 5) {
              return TextEditingController(
                  text: widget
                      .game!.tasks[TaskLevel.medium]?[indexG].correctAnswer);
            }
            if (index >= 1 && index <= 4) {
              return TextEditingController(
                  text: widget.game!.tasks[TaskLevel.medium]?[indexG]
                      .answerOptions[index - 1]);
            }
            return TextEditingController();
          },
        ),
      );
      gameControllersHard = List.generate(
        4,
        (int indexG) => List.generate(
          6,
          (int index) {
            if (index == 0) {
              return TextEditingController(
                  text: widget.game!.tasks[TaskLevel.hard]?[indexG].question);
            }
            if (index == 5) {
              return TextEditingController(
                  text: widget
                      .game!.tasks[TaskLevel.hard]?[indexG].correctAnswer);
            }
            if (index >= 1 && index <= 4) {
              return TextEditingController(
                  text: widget.game!.tasks[TaskLevel.hard]?[indexG]
                      .answerOptions[index - 1]);
            }
            return TextEditingController();
          },
        ),
      );
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
    for (var controllersList in gameControllersEasy) {
      for (var controller in controllersList) {
        controller.dispose();
      }
    }
    for (var controllersList in gameControllersMedium) {
      for (var controller in controllersList) {
        controller.dispose();
      }
    }
    for (var controllersList in gameControllersHard) {
      for (var controller in controllersList) {
        controller.dispose();
      }
    }
  }
}
