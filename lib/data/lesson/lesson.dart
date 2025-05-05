import '../../domain/lesson/ilesson.dart';
import '../../domain/lesson/ilesson_plan.dart';
import 'lesson_plan.dart';

const String _lessonId = 'lessonId';
const String _lessonTitle = 'lessonTitle';
const String _lessonPlan = 'lessonPlanSteps';
const String _gameId = 'gameId';

class Lesson implements ILesson {
  Lesson({
    required this.title,
    required this.plan,
    this.id,
    this.gameId,
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
  Map<String, dynamic> toJson() {
    return {
      _lessonTitle: title,
      'step1Plan': plan.step1,
      'step2Plan': plan.step2,
      'step3Plan': plan.step3,
      'step4Plan': plan.step4,
    };
  }

  @override
  final int? id;

  @override
  final int? gameId;

  @override
  final String title;

  @override
  final ILessonPlan plan;
}
