import 'package:dsa_teaching_web/domain/lesson/ilesson_plan.dart';

abstract interface class ILesson {
  ILesson({
    required this.title,
    required this.plan,
    this.gameId,
    this.id,
  });

  final int? id;
  final int? gameId;
  final String title;
  final ILessonPlan plan;

  Map<String, dynamic> toJson();
}
