import '../../domain/game/game_answers_type.dart';
import '../../domain/game/itask.dart';

const String _taskId = 'taskId';
const String _questionNumber = 'questionNumber';
const String _question = 'question';
const String _answerOptions = 'answerOptions';
const String _correctAnswer = 'correctAnswer';
const String _gameAnswersType = 'gameAnswersTypeId';
const String _taskLevel = 'taskLevel';

enum TaskLevel {
  easy("EASY"),
  medium("MEDIUM"),
  hard("HARD");

  const TaskLevel(this.apiString);

  final String apiString;
}

class Task implements ITask {
  Task({
    required this.questionNumber,
    required this.question,
    required this.answerOptions,
    required this.correctAnswer,
    required this.type,
    required this.taskLevel,
    this.id,
  });

  factory Task.fromJson(Map<String, dynamic> data) {
    return Task(
      id: data[_taskId],
      questionNumber: data[_questionNumber],
      question: data[_question],
      answerOptions: List<String>.from(data[_answerOptions]),
      correctAnswer: data[_correctAnswer],
      type: GameAnswersType.apiToType(data[_gameAnswersType].toString()),
      taskLevel: _apiToType(data[_taskLevel]),
    );
  }

  static TaskLevel _apiToType(String apiString) {
    return switch (apiString) {
      'EASY' => TaskLevel.easy,
      'MEDIUM' => TaskLevel.medium,
      'HARD' => TaskLevel.hard,
      _ => TaskLevel.easy,
    };
  }

  @override
  final int? id;

  @override
  final int questionNumber;

  @override
  final String question;

  @override
  final List<String> answerOptions;

  @override
  String correctAnswer;

  @override
  final GameAnswersType type;

  @override
  final TaskLevel taskLevel;

  @override
  Map<String, dynamic> toJson() {
    return {
      _taskId: id,
      _questionNumber: questionNumber,
      _question: question,
      _answerOptions: answerOptions,
      _correctAnswer: correctAnswer,
      _gameAnswersType: type == GameAnswersType.row ? 1 : 2,
      _taskLevel: taskLevel.apiString,
    };
  }
}
