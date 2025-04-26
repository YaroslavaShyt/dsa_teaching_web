import 'package:dsa_teaching_web/domain/lesson/ilesson_plan.dart';

abstract interface class ILesson {
  ILesson({
    required this.id,
    required this.title,
    required this.gameId,
    required this.plan,
  });

  final int id;
  final int gameId;
  final String title;
  final ILessonPlan plan;
}
