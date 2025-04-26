import '../../domain/lesson/ilesson.dart';
import '../../domain/lesson/ilesson_plan.dart';
import 'lesson_plan.dart';

const String _lessonId = 'lessonId';
const String _lessonTitle = 'lessonTitle';
const String _lessonPlan = 'lessonPlanSteps';
const String _gameId = 'gameId';

class Lesson implements ILesson {
  Lesson({
    required this.id,
    required this.gameId,
    required this.title,
    required this.plan,
  });

  factory Lesson.fromJson(Map<String, dynamic> data) {
    return Lesson(
      id: data[_lessonId],
      gameId: data[_gameId],
      title: data[_lessonTitle],
      plan: LessonPlan.fromJson(
        data[_lessonPlan],
      ),
    );
  }

  @override
  final int id;

  @override
  final int gameId;

  @override
  final String title;

  @override
  final ILessonPlan plan;
}
