import 'package:dsa_teaching_web/data/game/task.dart';

import 'game_answers_type.dart';

abstract interface class ITask {
  ITask({
    required this.questionNumber,
    required this.question,
    required this.answerOptions,
    required this.correctAnswer,
    required this.type,
    required this.taskLevel,
    this.id,
  });

  final int? id;

  final int questionNumber;
  final String question;
  final List<String> answerOptions;
  String correctAnswer;
  final GameAnswersType type;
  final TaskLevel taskLevel;

  Map<String, dynamic> toJson();
}
