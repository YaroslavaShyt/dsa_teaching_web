import 'game_answers_type.dart';

abstract interface class ITask {
  ITask({
    required this.questionNumber,
    required this.question,
    required this.answerOptions,
    required this.correctAnswer,
    required this.type,
    this.id,
  });

  final int? id;

  final int questionNumber;
  final String question;
  final List<String> answerOptions;
  String correctAnswer;
  final GameAnswersType type;

  Map<String, dynamic> toJson();
}
