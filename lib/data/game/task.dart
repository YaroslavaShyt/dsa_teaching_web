import '../../domain/game/game_answers_type.dart';
import '../../domain/game/itask.dart';

const String _taskId = 'taskId';
const String _questionNumber = 'questionNumber';
const String _question = 'question';
const String _answerOptions = 'answerOptions';
const String _correctAnswer = 'correctAnswer';
const String _gameAnswersType = 'gameAnswersType';

class Task implements ITask {
  Task({
    required this.id,
    required this.questionNumber,
    required this.question,
    required this.answerOptions,
    required this.correctAnswer,
    required this.type,
  });

  factory Task.fromJson(Map<String, dynamic> data) {
    return Task(
      id: data[_taskId],
      questionNumber: data[_questionNumber],
      question: data[_question],
      answerOptions: List<String>.from(data[_answerOptions]),
      correctAnswer: data[_correctAnswer],
      type: GameAnswersType.apiToType(data[_gameAnswersType]),
    );
  }

  @override
  final int id;

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
}
