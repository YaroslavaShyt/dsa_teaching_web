import '../../domain/lesson/ilesson_plan.dart';

const String _step1 = 'step1';
const String _step2 = 'step2';
const String _step3 = 'step3';
const String _step4 = 'step4';

class LessonPlan implements ILessonPlan {
  LessonPlan({
    required this.step1,
    required this.step2,
    required this.step3,
    required this.step4,
  });

  factory LessonPlan.fromJson(Map<String, dynamic> data) {
    return LessonPlan(
      step1: data[_step1],
      step2: data[_step2],
      step3: data[_step3],
      step4: data[_step4],
    );
  }

  @override
  final String step1;

  @override
  final String step2;

  @override
  final String step3;

  @override
  final String step4;
}
